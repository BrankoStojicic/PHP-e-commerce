<?php
session_start();
//error_reporting(0);
require_once 'database/connect.php';
require_once 'functions/users.php';
$errors = array();
if(isset($_SESSION['user_id'])){
    $status = user_data($_SESSION['user_id'], 'active');
    if($status['active'] == 0){
        header('Location: logout.php');
        };
}
?>