<?php

class Article extends D {
    public $Database;
    public function __construct() {
        parent::__construct();
    }
    private function Placeholder() {
        $this->Database = new Database();
    }
    public function AddArticle($usersId, $title, $text) {
        
    }
    public function DelArticle($articleId) {
        
    }
    public function EditArticle($articleId, $title, $text) {
        
    }
    public function ViewArticle($articleId) {
        
    }
    public function GetArticle($usersId, $title, $text) {
        
    }
    public function ListArticles() {
        
    }
    public function VoteArticle($articleId, $vote) {
        
    }
    public function SetArticleMeta($articleId, $setting, $value) {
        
    }
    public function GetArticleMeta($articleId, $setting) {
        
    }
    public function GetComments($articleId) {
        
    }
    public function Comment($articleId, $usersId, $comment) {
        
    }
    public function DelComment($commentId) {
        
    }
    public function EditComment($commentId, $comment) {
        
    }
    public function VoteComment($commentId, $vote) {
        
    }
}