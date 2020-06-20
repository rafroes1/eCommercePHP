<?php 
require 'connection.php';

function updateUserToDB($id, $username, $fullname, $phone, $address)
{
  $cmd = 'UPDATE users SET username = :username, fullname = :fullname, phone = :phone, address = :address WHERE id = :id';
  $sql = $GLOBALS['db']->prepare($cmd);
  $sql->bindValue(':username', $username);
  $sql->bindValue(':fullname', $fullname);
  $sql->bindValue(':phone', $phone);
  $sql->bindValue(':address', $address);
  $sql->bindValue(':id', $id);
  $sql->execute();
}

$http_verb = strtolower($_SERVER['REQUEST_METHOD']);
$myObj = new stdClass();
if ($http_verb == 'post')
{
    try
    {
      if(isset($_SESSION['userId'])) {
        $post = trim(file_get_contents("php://input"));
        $json = json_decode($post, true);

        $id = $_SESSION['userId'];
        $username = $json['username'];
        $fullname = $json['fullname'];
        $phone = $json['phone'];
        $address = $json['address'];

        updateUserToDB($id, $username, $fullname, $phone, $address);
        $myObj->success = true;
        $myObj->message = "Profile was updated successfully.";

        echo json_encode($myObj);
      } else {
        $myObj->success = false;
        $myObj->message = "Please login into your account.";
        echo json_encode($myObj);
      }
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