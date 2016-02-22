<?php

class User extends D {
    public $Database;
    public function __construct() {
        parent::__construct();
    }
    private function Placeholder() {
        $this->Database = new Database();
    }
    public function Adduser($username, $password, $rpassword) {
        if ($this->GetIdByUsername($username) != false) return false;
        if ($password != $rpassword) return null; // password does not match
        if (strlen($username) <= 0) return false;
        $this->Database->Bind('string', ':usersUsername', Validate::SanitizeString($username));
        $this->Database->Bind('string', ':usersPassword', password_hash($password, PASSWORD_BCRYPT));
        $query = $this->Database->Insert('users', 'usersUsername,usersPassword', ':usersUsername,:usersPassword');
        return $query >= 1 ? true : false;
    }
    public function ChangeUsername($userid, $username) {
        if ($this->GetUsernameById($userid) == false) return false; // user does not exist
        if ($this->GetIdByUsername($username) != false) return false; // user already exists
        $this->Database->Bind('int', ':usersId', Validate::SanitizeInt($userid));
        $this->Database->Bind('string', ':usersUsername', Validate::SanitizeString($username));
        $query = $this->Database->Update('users', 'usersUsername=:usersUsername', 'WHERE usersId=:usersId');
        return $query >= 1 ? true : false;
    }
    public function Deluser($userid) {
        if ($this->GetUsernameById($userid) != false) return true; // already deleted
        $this->Database->Bind('int', ':usersId', Validate::SanitizeInt($userid));
        $query = $this->Database->SDelete('u,um', 'users u',
            'JOIN users_meta um ON um.users_meta_fk_usersId=u.usersId'
            . 'WHERE um.users_meta_fk_usersId=u.usersId AND u.usersId=:usersId');
        return $query >= 1 ? true : false;
    }
    public function GetIdByUsername($username) {
        $this->Database->Bind('string', ':usersUsername', Validate::SanitizeString($username));
        $query = $this->Database->Select('users', 'usersId', 'WHERE usersUsername=:usersUsername');
        foreach ($query as $row) return $row->usersId;
        return false;
    }
    public function GetUsernameById($userid) {
        $this->Database->Bind('int', ':usersId', Validate::SanitizeInt($userid));
        $query = $this->Database->Select('users', 'usersUsername', 'WHERE usersId=:usersId');
        foreach ($query as $row) return $row->usersUsername;
        return false;
    }
    public function GetByUserid($userid) {
        $this->Database->Bind('int', ':usersId', Validate::SanitizeInt($userid));
        $return = array();
        $query = $this->Database->Select('users', '*', 'WHERE usersId=:usersId');
        foreach ($query as $row) {
            $return[$row->usersId] = (array) $row;
            if ($this->GetAllMetadata($row->usersId) != false) {
                foreach ($this->GetAllMetadata($row->usersId) as $metadata) {
                    $return[$row->usersId]['metadata'][$metadata->users_metaSetting] = $metadata->users_metaValue;
                }
            }
            if ($this->GetAllProfile($row->usersId) != false) {
                foreach ($this->GetAllProfile($row->usersId) as $profile) {
                    $return[$row->usersId]['profile'][$profile->users_profileSetting] = $profile->users_profileValue;
                }
            }
        }
        return count($return) >= 1 ? json_decode(json_encode($return)) : false;
    }
    // Reduce amount of data being processed by letting the SQL server count instead of counting all the rows in an array.
    public function NumberUsers() {
        $query = $this->Database->Select('users', 'count(usersId) AS amount');
        foreach ($query as $row) return $row->amount;
        return 0;
    }
    public function GetAllUsers($start = 0, $limit = null) {
        $return = array();
        $limit_start = Validate::SanitizeInt($start);
        if ($limit == null) $query = $this->Database->Select('users', '*');
        else {
            $limit = Validate::SanitizeInt($limit);
            $query = $this->Database->Select('users', '*', "LIMIT $limit_start, $limit");
        }
        foreach ($query as $row) {
            $return[$row->usersId] = (array) $row;
            if ($this->GetAllMetadata($row->usersId) != false) {
                foreach ($this->GetAllMetadata($row->usersId) as $metadata) {
                    $return[$row->usersId]['metadata'][$metadata->users_metaSetting] = $metadata->users_metaValue;
                }
            }
            if ($this->GetAllProfile($row->usersId) != false) {
                foreach ($this->GetAllProfile($row->usersId) as $profile) {
                    $return[$row->usersId]['profile'][$profile->users_profileSetting] = $profile->users_profileValue;
                }
            }
        }
        return count($return) >= 1 ? json_decode(json_encode($return)) : false;
    }
    public function GetAllMetadata($userid) {
        $this->Database->Bind('int', ':usersId', Validate::SanitizeInt($userid));
        $query = $this->Database->Select('users_meta', '*', 'WHERE users_meta_fk_usersId=:usersId');
        return count($query) >= 1 ? $query : false;
    }
    public function GetAllProfile($userid) {
        $this->Database->Bind('int', ':usersId', Validate::SanitizeInt($userid));
        $query = $this->Database->Select('users_profile', '*', 'WHERE users_profile_fk_usersId=:usersId');
        return count($query) >= 1 ? $query : false;
    }
    public function Login($username, $password) {
        $this->Database->Bind('string', ':usersUsername', Validate::SanitizeString($username));
        $query = $this->Database->Select('users', 'usersId,usersPassword,usersUsername', 'WHERE usersUsername=:usersUsername');
        foreach ($query as $row) {
            if (password_verify($password, $row->usersPassword)) {
                $_SESSION['usersId'] = $row->usersId;
                $_SESSION['usersUsername'] = $row->usersUsername; // lets get the case sensitivity right here!
                return true;
            } else return false;
        }
    }
    public function SetPassword($userid, $password, $rpassword) {
        if ($password != $rpassword) return null; // password does not match
        $this->Database->Bind('int', ':usersId', Validate::SanitizeInt($userid));
        $this->Database->Bind('string', ':usersPassword', password_hash($password, PASSWORD_BCRYPT));
        $query = $this->Database->Update('users', 'usersPassword=:usersPassword', 'WHERE usersId=:usersId');
        return $query >= 1 ? true : false;
    }
    public function SetMeta($userid, $setting, $value) {
        if ($this->GetUsernameById($userid) == false) return null;
        $check = $this->GetMeta($userid, $setting); // Get before the new bind
        $this->Database->Bind('int', ':users_meta_fk_usersId', $userid);
        $this->Database->Bind('string', ':users_metaSetting', $setting);
        $this->Database->Bind('string', ':users_metaValue', $value);
        if ($check == false) {
            $query = $this->Database->Insert('users_meta', 'users_metaSetting,users_metaValue,users_meta_fk_usersId',
                ':users_metaSetting,:users_metaValue,:users_meta_fk_usersId');
        } else {
            if ($check == $value) return true; // already set
            $query = $this->Database->Update('users_meta', 'users_metaValue=:users_metaValue',
                'WHERE users_metaSetting=:users_metaSetting AND users_meta_fk_usersId=:users_meta_fk_usersId');
        }
        return $query >= 1 ? true : false;
    }
    public function GetMeta($userid, $setting) {
        $this->Database->Bind('int', ':users_meta_fk_usersId', $userid);
        $this->Database->Bind('string', ':users_metaSetting', $setting);
        $query = $this->Database->Select('users_meta', 'users_metaValue',
            'WHERE users_metaSetting=:users_metaSetting AND users_meta_fk_usersId=:users_meta_fk_usersId');
        foreach ($query as $row) return $row->users_metaValue;
        return false;
    }
    // NULL already exists
    public function SetEmail($userid, $email) {
        if (Validate::ValidateEmail($email)) {
            $this->Database->Bind('string', ':users_metaValue', $email);
            $query = $this->Database->Select('users_meta', 'users_metaId', 'WHERE users_metaValue=:users_metaValue');
            return count($query) >= 1 ? null : $this->SetMeta($userid, 'email', $email);
        } else return false;
    }
    public function GetEmail($userid) {
        return $this->GetMeta($userid, 'email');
    }
    public function SetProfile($userid, $setting, $value) {
        if ($this->GetUsernameById($userid) == false) return null;
        $check = $this->GetProfile($userid, $setting); // Get before the new bind
        $this->Database->Bind('int', ':users_profile_fk_usersId', $userid);
        $this->Database->Bind('string', ':users_profileSetting', $setting);
        $this->Database->Bind('string', ':users_profileValue', $value);
        if ($check == false) $query = $this->Database->Insert('users_profile', 'users_profileSetting,users_profileValue,users_profile_fk_usersId',
                ':users_profileSetting,:users_profileValue,:users_profile_fk_usersId');
        else {
            if ($check == $value) return true; // already set
            $query = $this->Database->Update('users_profile', 'users_profileValue=:users_profileValue',
                'WHERE users_profileSetting=:users_profileSetting AND users_profile_fk_usersId=:users_profile_fk_usersId');
        }
        return $query >= 1 ? true : false;
    }
    public function GetProfile($userid, $setting) {
        $this->Database->Bind('int', ':users_profile_fk_usersId', $userid);
        $this->Database->Bind('string', ':users_profileSetting', $setting);
        $query = $this->Database->Select('users_profile', 'users_profileValue',
            'WHERE users_profileSetting=:users_profileSetting AND users_profile_fk_usersId=:users_profile_fk_usersId');
        foreach ($query as $row) return $row->users_profileValue;
        return false;
    }
    /*
     * Access system, should be handled with users anyway, since it is user related
     * most people will frown on this, too bad i dont care, whenever i use a user class i useually need the access class anyway!
     * don't waste my time and complain about it, its tough noogie!
     */
    public function HasAccess($userid, $pagename, $action) {
        $this->Database->Bind('string', ':pagename', $pagename);
        $query = $this->Database->Select('requirement', 'requirementId', 'WHERE requirementPagename=:pagename');
        if ($this->Database->Count($query) == 0) return true;
        else {
            $this->Database->Bind('int', ':userid', $userid);
            $this->Database->Bind('string', ':pagename', $pagename);
            $this->Database->Bind('string', ':action', $action);
            $query = $this->Database->Select('users', '*',
                "LEFT JOIN access ON access.access_fk_usersId=users.usersId 
                LEFT JOIN roles ON roles.rolesId=access.access_fk_rolesId 
                LEFT JOIN permissions ON permissions_fk_roleId=roles.rolesId 
                LEFT JOIN requirement ON requirement.requirement_fk_permissionsName=permissions.permissionsName 
                WHERE ((requirement.requirementPagename=:pagename 
                AND requirement.requirementAction=:action) OR (permissions.permissionsName='can_all')) AND users.usersId=:userid");
            // Ok here is where it could get a little bit messy, we need to check for login etc.
            $return = array();
            foreach ($query as $row) {
                if (($row->requirement_fk_permissionsName == 'is_login') && ($_SESSION['uid'] == 0)) return false;
                else if (($row->requirement_fk_permissionsName == 'is_logout') && ($_SESSION['uid'] != 0)) return false;
                else if ($row->permissionsName == 'can_all') {
                    if (($row->requirement_fk_permissionsName == 'is_logout') || ($row->requirement_fk_permissionsName == 'is_login')) return false;
                }
                else {
                    array_push($return, $row);
                }
            }
            return $this->Database->Count($return) >= 1 ? true : false;
        }
    }
    public function AddRole($rolename) {
        if ($this->GetRoleByName($rolename) != false) return true; // already exists
        $this->Database->Bind('string', ':rolename', $rolename);
        $this->Database->Insert('roles', 'rolesName', ':rolename');
        return $this->GetRoleByName($rolename) != false ? true : false;
    }
    public function DelRole($roleid) {
        $this->Database->Bind('int', ':rolesid', $roleid);
        return $this->Database->Delete('roles', 'WHERE rolesId=:rolesid') >= 1 ? true : false;
    }
    public function EditRole($roleid, $rolename) {
        $this->Database->Bind('int', ':rolesid', $roleid);
        $this->Database->Bind('string', ':rolesname', $rolename);
        $this->Database->Update('roles', 'rolesName=:rolesname', 'WHERE rolesId=:rolesid');
        return $this->GetRoleByName($rolename) != false ? true : false;
    }
    public function ListRoles() {
        $query = $this->Database->Select('roles', '*');
        return $this->Database->Count($query) >= 1 ? $query : false;
    }
    public function GetRoleByName($rolename) {
        $this->Database->Bind('string', ':rolesname', $rolename);
        $query = $this->Database->Select('roles', 'rolesId,rolesName', 'WHERE rolesName=:rolesname');
        return $this->Database->Count($query) >= 1 ? $query : false;
    }
    public function AddPermission($permissionname, $roleid) {
        if ($this->GetPermissionByName($permissionname, $roleid) != false) return true;
        $this->Database->Bind('string', ':permissionsname', $permissionname);
        $this->Database->Bind('int', ':roleid', $roleid);
        $this->Database->Insert('permissions', 'permissionsName,permissions_fk_roleId', ':permissionsname,:roleid');
        return $this->GetPermissionByName($permissionname, $roleid) != false ? true : false;
    }
    public function DelPermission($permissionid) {
        $this->Database->Bind('id', ':permissionsid', $permissionid);
        return $this->Database->Delete('permissions', 'WHERE permissionsId=:permissionsid') >= 1 ? true : false;
    }
    public function EditPermission($permissionid, $permissionname, $roleid) {
        if ($this->GetPermissionByName($permissionname, $roleid) == false) return false; // does not exist
        $this->Database->Bind('int', ':permissionsId', $permissionid);
        $this->Database->Bind('string', ':permissionsName', $permissionname);
        $this->Database->Bind('int', ':rolesId', $roleid);
        $this->Database->Update('permissions', 'permissionsName=:permissionsName,permissions_fk_roleId=:rolesId', 'WHERE permissionsId=:permissionsId');
        return $this->GetPermissionByName($permissionname, $roleid) != false ? true : false;
    }
    public function GetPermissionByName($permissionname, $roleid) {
        $this->Database->Bind('string', ':permissionsname', $permissionname);
        $this->Database->Bind('int', ':rolesId', $roleid);
        $query = $this->Database->Select('permissions', 'permissionsId,permissionsName',
            'WHERE permissionsName=:permissionsname AND permissions_fk_roleId=:rolesId');
        return $this->Database->Count($query) >= 1 ? $query : false;
    }
    public function ListPermissions() {
        $query = $this->Database->Select('permissions', '*');
        return $this->Database->Count($query) >= 1 ? $query : false;
    }
    public function AddAccess($roleid, $userid) {
        if ($this->GetAccess($roleid, $userid) != false) return true;
        $this->Database->Bind('int', ':usersId', $userid);
        $this->Database->Bind('int', ':rolesId', $roleid);
        return $this->Database->Count($this->Database->Insert('access', 'access_fk_rolesId,access_fk_usersId', ':rolesId,:usersId')) >= 1 ? true : false;
    }
    public function DelAccess($accessid) {
        $this->Database->Bind('int', ':accessId', $accessid);
        return $this->Database->Delete('access', 'WHERE accessId=:accessId') >= 1 ? true : false;
    }
    public function EditAccess($accessid, $roleid, $userid) {
        $this->Database->Bind('int', ':usersId', $userid);
        $this->Database->Bind('int', ':rolesId', $roleid);
        $this->Database->Bind('int', ':accessId', $accessid);
        $this->Database->Update('access', 'access_fk_rolesId=:rolesId,access_fk_usersId=:accessId', 'WHERE accessId=:accessId');
        return $this->GetAccess($roleid, $userid) != false ? true : false;
    }
    public function GetAccess($roleid, $userid) {
        $this->Database->Bind('int', ':usersId', $userid);
        $this->Database->Bind('int', ':rolesId', $roleid);
        $query = $this->Database->Select('access', '*', 'WHERE access_fk_rolesId=:rolesId AND access_fk_usersId=:usersId');
        return $this->Database->Count($query) >= 1 ? $query : false;
    }
    public function AddRequirement($pagename, $action, $permissionid) {
        if ($this->GetRequirement($pagename, $action, $permissionid) != false) return true;
        $this->Database->Bind('int', ':permissionsId', $permissionid);
        $this->Database->Bind('string', ':pagename', $pagename);
        $this->Database->Bind('string', ':action', $action);
        $this->Database->Insert('requirement', 'requirement_fk_permissionsId,requirementPagename,requirementAction', ':permissionsId,:pagename,:action');
        return $this->GetRequirement($pagename, $action, $permissionid) != false ? true : false;
    }
    public function DelRequirement($requirementid) {
        $this->Database->Bind('int', ':requirementId', $requirementid);
        return $this->Database->Delete('requirement', 'WHERE requirementId=:requirementId') >= 1 ? true : false;
    }
    public function EditRequirement($requirementid, $pagename, $action, $permissionid) {
        $this->Database->Bind('int', ':permissionsId', $permissionid);
        $this->Database->Bind('int', ':requirementId', $requirementid);
        $this->Database->Bind('string', ':pagename', $pagename);
        $this->Database->Bind('string', ':action', $action);
        $this->Database->Update('requirement', 'requirement_fk_permissionsId=:permissionsId,requirementPagename=:pagename,requirementAction=:action',
            'WHERE requirementId=:requirementId');
        return $this->GetRequirement($pagename, $action, $permissionid) != false ? true : false;
    }
    public function GetRequirement($pagename, $action, $permissionname) {
        $this->Database->Bind('int', ':permissionsName', $permissionname);
        $this->Database->Bind('string', ':pagename', $pagename);
        $this->Database->Bind('string', ':action', $action);
        $query = $this->Database->Select('access', '*',
            'WHERE requirementPagename=:pagename AND requirement_fk_permissionsName=:permissionsName AND requirementAction=:action');
        return $this->Database->Count($query) >= 1 ? $query : false;
    }
}