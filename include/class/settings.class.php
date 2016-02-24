<?php

class Settings extends D {
    public $Database;
    public function __construct() {
        parent::__construct();
        $this->Setup();
    }
    private function Placeholder() {
        $this->Database = new Database();
    }
    /*
     * Sure importing an SQL file would be easier, but there is too little control over that.
     */
    private function Setup() {
        $query = "CREATE TABLE IF NOT EXISTS `settings` (
            `settingsId` int(11) NOT NULL AUTO_INCREMENT, 
            `settingsName` varchar(128) NOT NULL, 
            `settingsValue` varchar(255) NOT NULL, 
            PRIMARY KEY (`settingsId`)) ENGINE=InnoDB DEFAULT CHARSET=utf8; 
            ALTER TABLE `settings` ADD PRIMARY KEY (`settingsId`); 
            ALTER TABLE `settings` MODIFY `settingsId` int(11) NOT NULL AUTO_INCREMENT;";
        
        $this->Database->RawQuery($query);
        if(!$this->Get('admin_email')) $this->Set ('admin_email', 'admin@poorly.configured.website.net');
        if(!$this->Get('theme_selected')) $this->Set ('theme_selected', 'default'); // always revert to default theme
        if(!$this->Get('website_description')) $this->Set ('website_description', 'Website description');
        if(!$this->Get('website_author')) $this->Set ('website_author', 'poorly configured');
        if(!$this->Get('website_keywords')) $this->Set ('website_keywords', 'no,keywords,here');
        if(!$this->Get('website_footer')) $this->Set ('website_footer', 'insert footer text here');
        if(!$this->Get('website_charset')) $this->Set ('website_charset', 'uft-8');
        if(!$this->Get('website_title')) $this->Set ('website_title', 'Default website title');
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