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
        
    }
    public function DelNav($navid) {
        
    }
    public function ListNav() {
        
    }
    public function ReorderNav($navid1, $navid2) {
        
    }
}