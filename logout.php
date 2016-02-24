<?php
session_destroy();
session_start();
include('include/header.php');
header('location: index.php');