<?php

class Settings extends D {
    public $Database;
    public function __construct() {
        parent::__construct();
    }
    private function Placeholder() {
        $this->Database = new Database();
    }
    public function Set($setting, $value) {
        $check = $this->Get($setting); // Get before the new bind
        $this->Database->Bind('string', ':settingsName', Validate::SanitizeString($setting));
        $this->Database->Bind('string', ':settingsValue', Validate::SanitizeString($value));
        if ($check == false) $query = $this->Database->Insert('settings', 'settingsName,settingsValue', ':settingsName,:settingsValue');
        else {
            if ($check == $value) return true; // already set
            $query = $this->Database->Update('settings', 'settingsValue=:settingsValue', 'WHERE settingsName=:settingsName');
        }
        return $query >= 1 ? true : false;
    }
    public function GetById($id) {
        $this->Database->Bind('int', ':settingsId', Validate::SanitizeInt($id));
        $query = $this->Database->Select('settings', '*', 'WHERE settingsId=:settingsId');
        return count($query) >= 1 ? $query : false;
    }
    public function Get($setting) {
        $this->Database->Bind('string', ':settingsName', Validate::SanitizeString($setting));
        $query = $this->Database->Select('settings', '*', 'WHERE settingsName=:settingsName');
        foreach ($query as $row) return $row->settingsValue;
        return false;
    }
    public function Delete($id) {
        $this->Database->Bind('int', ':settingsId', Validate::SanitizeInt($id));
        $query = $this->Database->Delete('settings', 'WHERE settingsId=:settingsId');
        return $query >= 1 ? true : false;
    }
    public function ListSettings() {
        $query = $this->Database->Select('settings', '*');
        return count($query) >= 1 ? $query : false;
    }
}