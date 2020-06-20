<?php 
require 'connection.php';
$http_verb = strtolower($_SERVER['REQUEST_METHOD']);

if ($http_verb == 'post')
{
    try
    { 
      $sql = $GLOBALS['db']->prepare('UPDATE users SET email=:email, fullname=:fullname, phone=:phone, address=:address WHERE id = :id');
      $sql->execute();
      $myObj->message = "Successfuly updated";
      echo json_encode($myObj);
    }
    catch (Exception $e) 
    {
      $myObj = new stdClass();
      $myObj->isLoggedIn = false;
      $myObj->message = "something went wrong, please try again later";
      echo json_encode($myObj);
    }
}
?>