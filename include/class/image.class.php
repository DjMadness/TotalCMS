<?php

/*
 * Written by Christopher Moore (DjMadness)
 * This class is for handling image uploads, both adding, deleting, resizing etc.
 * Filenames should be automaticly generated, this is to ensure that no file is already in use
 */
class Image extends D {
    public $Database;
    public function __construct() {
        parent::__construct();
    }
    private function Placeholder() {
        $this->Database = new Database();
    }
    private function Setup() {
        $query = "CREATE TABLE IF NOT EXISTS `image` (
            `imageId` int(11) NOT NULL AUTO_INCREMENT,
            `imageFilename` varchar(255) COLLATE utf8_danish_ci NOT NULL,
            `imageDescription` varchar(255) COLLATE utf8_danish_ci NOT NULL,
            `imageDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (`imageId`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;";
        $this->Database->RawQuery($query);
    }
    public function AddImage($description) {
        
    }
    public function ReplaceImage($imageId, $description) {
        
    }
    public function DelImage($imageId) {
        
    }
    public function ListImages() {
        
    }
    public function ResizeImage($imageId, $width, $height) {
        
    }
}