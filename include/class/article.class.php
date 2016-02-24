<?php

class Article extends D {
    public $Database;
    public function __construct() {
        parent::__construct();
    }
    private function Placeholder() {
        $this->Database = new Database();
    }
    private function Setup() {
        $articles = "CREATE TABLE IF NOT EXISTS `articles` (
            `articlesId` int(11) NOT NULL AUTO_INCREMENT,
            `articles_fk_usersId` int(11) NOT NULL,
            `articlesDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
            `articles_fk_imageId` int(11) DEFAULT NULL,
            `articlesTitle` varchar(255) NOT NULL,
            `articlesText` text NOT NULL,
            PRIMARY KEY (`articlesId`),
            KEY `articles_fk_usersId` (`articles_fk_usersId`),
            KEY `articles_fk_imageId` (`articles_fk_imageId`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;";
        $this->Database->RawQuery($articles);
        $articles_comments = "CREATE TABLE IF NOT EXISTS `articles_comments` (
            `articles_commentsId` int(11) NOT NULL AUTO_INCREMENT,
            `articles_commentsDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
            `articles_comments_fk_articlesId` int(11) NOT NULL,
            `articles_comments_fk_usersId` int(11) NOT NULL,
            `articles_commentsText` text NOT NULL,
            PRIMARY KEY (`articles_commentsId`),
            KEY `articles_comments_fk_articlesId` (`articles_comments_fk_articlesId`,`articles_comments_fk_usersId`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;";
        $this->Database->RawQuery($articles_comments);
        $articles_comments_meta = "CREATE TABLE IF NOT EXISTS `articles_comments_meta` (
            `articles_comments_metaId` int(11) NOT NULL AUTO_INCREMENT,
            `articles_comments_meta_fk_articles_commentsId` int(11) NOT NULL,
            `articles_comments_metaSetting` varchar(128) NOT NULL,
            `articles_comments_metaValue` varchar(255) NOT NULL,
            PRIMARY KEY (`articles_comments_metaId`),
            KEY `articles_comments_meta_fk_articles_commentsId` (`articles_comments_meta_fk_articles_commentsId`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;";
        $this->Database->RawQuery($articles_comments_meta);
        $articles_meta = "CREATE TABLE IF NOT EXISTS `articles_meta` (
            `articles_metaId` int(11) NOT NULL AUTO_INCREMENT,
            `articles_meta_fk_articlesId` int(11) NOT NULL,
            `articles_metaSetting` varchar(128) NOT NULL,
            `articles_metaValue` varchar(255) NOT NULL,
            PRIMARY KEY (`articles_metaId`),
            KEY `articles_meta_fk_articlesId` (`articles_meta_fk_articlesId`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;";
        $this->Database->RawQuery($articles_meta);
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
    public function ListArticles($start = 0, $limit = 10) {
        $this->Database->Bind('int', ':start', Validate::SanitizeInt($start));
        $this->Database->Bind('int', ':limit', Validate::SanitizeInt($limit));
        $query = $this->Database->Select('articles', '*', 'ORDER BY articlesDate DESC LIMIT :start, :limit');
        return count($query) >= 1 ? json_encode(json_decode($query)) : false;
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
    public function GetComments($articlesId, $start = 0, $limit = 50) {
        $this->Database->Bind('int', ':articles_commentsId', Validate::SanitizeInt($articlesId));
        $this->Database->Bind('int', ':limit', Validate::SanitizeInt($limit));
        $query = $this->Database->Select('articles_comments', '*',
            'WHERE articles_commentsId=:articles_commentsId ORDER BY articles_commentsDate DESC LIMIT :start, :limit');
        return count($query) >= 1 ? $query : false;
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
        $query = $this->Database->Update('articles_comments', 'articles_commentsText=:articles_commentsText', 'WHERE articles_commentsId=:articles_commentsId');
        return $query >= 1 ? true : false;
    }
    /*
     * Handle votes and meta later on, i wont be using this yet, this is just to make a placeholder for stuff people might want
     * This is for digg/reddit like up/downvoting etc., this is something that would need a enable/disable setting, 
     * as it would turn the website into a more user usercontrolled way.
     */
    public function VoteComment($commentId, $vote) {
        
    }
    public function SetCommentMeta($articles_commentsId, $setting, $value) {
        
    }
    public function GetcommentMeta($articles_commentsId, $setting) {
        
    }
}