<?php 
require 'connection.php';

$http_verb = strtolower($_SERVER['REQUEST_METHOD']);

if(isset($_SESSION['userId'])) {
  if($http_verb == 'get') {
    $myObj = new stdClass();
    $myObj->success = true;
    $myObj->message = "";
    $myObj->user = getProfile();
    
    echo json_encode($myObj);
  }
  else if($http_verb == 'patch') {
    $myObj = new stdClass();
    $post = trim(file_get_contents("php://input"));
    $json = json_decode($post, true);
    if(isset($json['password']) && isset($json['password_confirmation'])) {
      $result = changePassword($json['password'], $json['password_confirmation']);
      $myObj->success = $result->success;
      $myObj->message = $result->message;
    } else {
      $myObj->success = false;
      $myObj->message = "Missing parameters.";
    }

    echo json_encode($myObj);
  }
} else {
  $myObj = new stdClass();
  $myObj->success = false;
  $myObj->message = "Please login into your account.";
  echo json_encode($myObj);
}

function getProfile() {
  $cmd = 'SELECT email, username, fullname, phone, address FROM users WHERE id = :id';
  $sql = $GLOBALS['db']->prepare($cmd);
  $sql->bindValue(':id', $_SESSION['userId']);
  $sql->execute();
  $user = $sql->fetch(PDO::FETCH_ASSOC);
  return $user;
}

function changePassword($password, $password_confirmation) {
  $myObj = new stdClass();
  $myObj->success = true;
  $myObj->message = 'Password was changed successfully.';

  if($password == $password_confirmation) {
    $password = password_hash($password, PASSWORD_DEFAULT);
    $cmd = 'UPDATE users SET password = :password WHERE id = :id';
    $sql = $GLOBALS['db']->prepare($cmd);
    $sql->bindValue(':password', $password);
    $sql->bindValue(':id', $_SESSION['userId']);
    $sql->execute();
  } else {
    $myObj->success = false;
    $myObj->message = 'Password confirmation doesn\'t match Password.';
  }

  return $myObj;
}

?>