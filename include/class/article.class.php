<?php

class Article extends D {
    public $Database;
    public function __construct() {
        parent::__construct();
    }
    private function Placeholder() {
        $this->Database = new Database();
    }
    public function AddArticle($usersId, $title, $text, $imageId = null) {
        $this->Database->Bind('int', ':usersId', Validate::SanitizeInt($usersId));
        $this->Database->Bind('string', ':articlesTitle', Validate::SanitizeString($title));
        $this->Database->Bind('string', ':articlesText', Validate::SanitizeString($text));
        if ($imageId == null) $this->Database->Bind('null', ':articles_fk_imageId', null);
        else $this->Database->Bind('int', ':articles_fk_imageId', Validate::SanitizeString($imageId));
        $query = $this->Database->Insert('articles', 'usersId,articlesTitle,articlesText,articles_fk_imageId',
            ':usersId,:articlesTitle,:articlesText,:articles_fk_imageId');
        return $query != 0 ? true : false;
    }
    public function DelArticle($articlesId) {
        $this->Database->Bind('int', ':articlesId', Validate::SanitizeInt($articlesId));
        $query = $this->Database->Delete('articles', 'WHERE articlesId=:articlesId');
        return $query >= 1 ? true : false;
    }
    public function EditArticle($articlesId, $title, $text, $imageId = null) {
        $this->Database->Bind('int', ':articlesId', Validate::SanitizeInt($articlesId));
        $this->Database->Bind('int', ':usersId', Validate::SanitizeInt($usersId));
        $this->Database->Bind('string', ':articlesTitle', Validate::SanitizeString($title));
        $this->Database->Bind('string', ':articlesText', Validate::SanitizeString($text));
        if ($imageId == null) $this->Database->Bind('null', ':articles_fk_imageId', null);
        else $this->Database->Bind('int', ':articles_fk_imageId', Validate::SanitizeString($imageId));
        $query = $this->Database->Update('articles',
            'usersId=:usersId,articlesTitle=:articlesTitle,articlesText=:articlesText,articles_fk_imageId=:articles_fk_imageId', 'WHERE articlesId=:articlesId');
        return $query >= 1 ? true : false;
    }
    public function ViewArticle($articlesId) {
        $this->Database->Bind('int', ':articlesId', Validate::SanitizeInt($articlesId));
        $query = $this->Database->Select('articles', '*', 'WHERE articlesId=:articlesId');
        $return = array();
        foreach ($query as $row) array_push($return, array($row, $this->CountComments($row->articlesId)));
        return $query >= 1 ? json_encode(json_decode($return)) : false;
    }
    public function ListArticles($limit = 10) {
        
    }
    public function VoteArticle($articlesId, $vote) {
        $this->Database->Bind('int', ':articlesId', Validate::SanitizeInt($articlesId));
    }
    public function SetArticleMeta($articlesId, $setting, $value) {
        $this->Database->Bind('int', ':articlesId', Validate::SanitizeInt($articlesId));
    }
    public function GetArticleMeta($articlesId, $setting) {
        $this->Database->Bind('int', ':articlesId', Validate::SanitizeInt($articlesId));
    }
    public function GetComments($articlesId) {
        $this->Database->Bind('int', ':articlesId', Validate::SanitizeInt($articlesId));
    }
    public function AddComment($articlesId, $usersId, $comment) {
        $this->Database->Bind('int', ':articles_comments_fk_articlesId', Validate::SanitizeInt($articlesId));
        $this->Database->Bind('int', ':articles_comments_fk_usersId', Validate::SanitizeInt($usersId));
        $this->Database->Bind('string', ':articles_commentsText', Validate::SanitizeString($comment));
        $query = $this->Database->Insert('articles_comments', 'articles_comments_fk_articlesId,articles_comments_fk_usersId,articles_commentsText',
            ':articles_comments_fk_articlesId,:articles_comments_fk_usersId,:articles_commentsText');
        return $query != 0 ? true : false;
    }
    public function CountComments($articlesId) {
        $this->Database->Bind('int', ':articles_comments_fk_articlesId', Validate::SanitizeInt($articlesId));
        $query = $this->Database->Select('articles_comments', 'count(articles_commentsId) AS comments',
            'WHERE articles_comments_fk_articlesId=:articles_comments_fk_articlesId');
        foreach ($query as $row) return $row->comments;
        return false;
    }
    public function DelComment($articles_commentsId) {
        $this->Database->Bind('int', ':articles_commentsId', Validate::SanitizeInt($articles_commentsId));
        $query = $this->Database->Delete('articles_comments', 'WHERE articles_commentsId=:articles_commentsId');
        return $query >= 1 ? true : false;
    }
    public function EditComment($articles_commentsId, $comment) {
        $this->Database->Bind('int', ':articles_commentsId', Validate::SanitizeInt($articles_commentsId));
        $this->Database->Bind('string', ':articles_commentsText', Validate::SanitizeString($comment));
    }
    public function VoteComment($commentId, $vote) {
        
    }
}