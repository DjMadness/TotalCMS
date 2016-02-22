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