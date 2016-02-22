<?php

class Navigation extends D {
    public $Database;
    public function __construct() {
        parent::__construct();
    }
    private function Placeholder() {
        $this->Database = new Database();
    }
    public function AddNav($name, $url, $type, $position, $imageId = null) {
        $this->Database->Bind('string', ':navigationName', Validate::SanitizeString($name));
        $this->Database->Bind('string', ':navigationUrl', Validate::SanitizeURL($url));
        $this->Database->Bind('string', ':navigationType', Validate::SanitizeString($type));
        $this->Database->Bind('int', ':navigationPosition', Validate::SanitizeInt($position));
        if ($imageId == null) $this->Database->Bind('null', ':navigation_fk_imageId', null);
        else $this->Database->Bind('int', ':navigation_fk_imageId', Validate::SanitizeInt($imageId));
        $query = $this->Database->Insert('navigation', 'navigationName,navigationUrl,navigationType,navigationPosition,navigation_fk_imageId',
            ':navigationName,:navigationUrl,:navigationType,:navigationPosition,:navigation_fk_imageId');
        return $query >= 1 ? true : false;
    }
    public function DelNav($navid) {
        $this->Database->Bind('int', ':navigationId', Validate::SanitizeInt($navid));
        $query = $this->Database->Delete('navigation', 'WHERE navigationId=:navigationId');
        return $query >= 1 ? true : false;
    }
    public function ListNav() {
        $query = $this->Database->Select('navigation', '*');
        return count($query) >= 1 ? $query : false;
    }
    public function ReorderNav($navid1, $navid2) {
        if ((Validate::ValidateInt($navid1)) && (Validate::ValidateInt($navid2))) {
            $this->Database->Bind('int', ':navid1', $navid1);
            $this->Database->Bind('int', ':navid2', $navid2);
            $query = $this->Database->Update("navigation AS navigation1 
                JOIN navigation AS navigation2 ON (navigation1.navigationId=:navid1 AND navigation2.navigationId=:navid2) 
                OR (navigation1.navigationId=:navid2 AND navigation2.navigationId=:navid1)", 
                'navigation1.navigationPos=navigation2.navigationPos, navigation2.navigationPos=navigation1.navigationPos');
            return $query >= 1 ? true : false;
        } return null;
    }
}