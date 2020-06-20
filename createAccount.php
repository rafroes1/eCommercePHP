<?php

require 'connection.php';

 
  function isUnknownEmail($email)
  {
    $isUnknown = false;

    if(filter_var($email, FILTER_VALIDATE_EMAIL))
    {
      $sql = $GLOBALS['db']->prepare('SELECT count(*) FROM users WHERE email = :email');
      $sql->bindValue(':email', $email);
      $sql->execute();
      
      $result = $sql->fetch(PDO::FETCH_NUM);
      $isUnknown = $result[0] == 0;
    }

    return $isUnknown;
  }

  function addUserToDB($username,$email, $password,$fullname,$phone,$address)
  {
    $cmd = 'INSERT INTO users (username, email, password, fullname, phone, address) ' .
    'VALUES (:username, :email, :password, :fullname, :phone, :address) ';
    $sql = $GLOBALS['db']->prepare($cmd);
    $sql->bindValue(':email', $email);
    $sql->bindValue(':password', password_hash($password, PASSWORD_DEFAULT));
    $sql->bindValue(':username', $username);
    $sql->bindValue(':fullname', $fullname);
    $sql->bindValue(':phone', $phone);
    $sql->bindValue(':address', $address);
    $sql->execute();

    return $GLOBALS['db']->lastInsertId();
  }

  $http_verb = strtolower($_SERVER['REQUEST_METHOD']);

  if ($http_verb == 'post')
  {
    try
    {
        $myObj = new stdClass();
        $post = trim(file_get_contents("php://input"));
        $json = json_decode($post, true); 
        $email = $json['email'];
        $password = $json['password'];
        $username = $json['username'];
        $fullname = $json['fullname'];
        $phone = $json['phone'];
        $address = $json['address'];

        if (isUnknownEmail($email))
        {
            $userId = addUserToDB($username, $email, $password, $fullname, $phone, $address);
            $myObj->success = true;
            $myObj->message = $userId > 0 ? "Your account was created successfully. Please login into the system." : "something went wrong. Please try again.";

            echo json_encode($myObj);
        }
        else
        {
            $myObj->success = false;
            $myObj->message = "Email already has account. Try to log in instead.";
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


