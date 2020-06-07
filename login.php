<?php 
require 'connection.php';

try
{
  $http_verb = strtolower($_SERVER['REQUEST_METHOD']);

  if ($http_verb == 'post')
  {
      $post = trim(file_get_contents("php://input"));
      $json = json_decode($post, true);
          
      $email = $json['email'];
      $password = $json['password'];

      $userId = validateUser($email, $password);

      $myObj = new stdClass();
      $myObj->isLoggedIn = $userId > 0;
      $myObj->message = $userId > 0 ? "" : "email/password does not match";
      
      $_SESSION['userId'] = $userId;
      $_SESSION['isLoggedIn'] = true;

      echo json_encode($myObj);
  }
  else if ($http_verb == 'get')
  {
      //am i logged in
      $myObj = new stdClass();
      $myObj->isLoggedIn = isset($_SESSION['isLoggedIn']) ? $_SESSION['isLoggedIn'] : false;
      echo json_encode($myObj);
  }
  else if ($http_verb == 'delete')
  {
      //log out
      $_SESSION['isLoggedIn'] = false;

      $myObj = new stdClass();
      $myObj->isLoggedIn = false;
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

function validateUser($email, $password)
{
  $userId = 0;

  try 
  {
    if(filter_var($email, FILTER_VALIDATE_EMAIL) && strlen($password)> 0)
    {
      $sql = $GLOBALS['db']->prepare('SELECT * FROM users WHERE email = :email AND deleted_at IS NULL');
      $sql->bindValue(':email', $email);
      $sql->execute();
      
      if($user = $sql->fetch(PDO::FETCH_ASSOC))
      {
        //compare passwords
        if(password_verify($password, $user['password']))
          $userId = $user['id'];
      }
    }
  } 
  catch(PDOException $e) 
  {
    echo $e->getMessage();
  }

  return $userId;
}

?>