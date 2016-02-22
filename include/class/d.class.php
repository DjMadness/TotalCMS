<?php
/*
 * The default class, this is for saving code when writing some of the same over and over again.
 */
abstract class D {
public $Database;
    public function __construct() {
        $this->Database = new Database();
    }
    public function __destruct() {
        unset($this->Database);
    }
    public static function S() {
        return new Static();
    }
    
}
