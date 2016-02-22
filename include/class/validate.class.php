<?php
class Validate {
    public static function ValidateInt($int) {
        return filter_var($int, FILTER_VALIDATE_INT);
    }
    public static function SanitizeInt($int) {
        return filter_var($int, FILTER_SANITIZE_NUMBER_INT);
    }
    public static function ValidateFloat($float) {
        return filter_var($float, FILTER_VALIDATE_FLOAT);
    }
    public static function SanitizeFloat($float) {
        return filter_var($float, FILTER_SANITIZE_FLOAT);
    }
    public static function ValidateMac($mac) {
        return filter_var($mac, FILTER_VALIDATE_MAC);
    }
    public static function ValidateEmail($email) {
        return filter_var($email, FILTER_VALIDATE_EMAIL);
    }
    public static function SanitizeString($string) {
        return trim(filter_var($string, FILTER_SANITIZE_STRING));
    }
    public static function FilterIP($ip) {
        return filter_var($ip, FILTER_VALIDATE_IP);
    }
    public static function FilterBool($bool) {
        return filter_var($bool, FILTER_VALIDATE_BOOLEAN);
    }
    public static function FilterURL($url) {
        return filter_var($url, FILTER_VALIDATE_URL);
    }
    public static function SanitizeURL($url) {
        return filter_var($url, FILTER_SANITIZE_URL);
    }
    public static function ValidateDate($date, $format = 'Y-m-d H:i:s') {
        $d = DateTime::createFromFormat($format, $date);
        return $d && $d->format($format) == $date;
    }
    
}