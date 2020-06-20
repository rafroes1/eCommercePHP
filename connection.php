<?php 
session_start();

$GLOBALS['db'] = new PDO('mysql:dbname=ecommerce; host=localhost', '', ''); 
$GLOBALS['db']->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
?>