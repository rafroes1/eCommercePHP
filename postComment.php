<?php 
	require 'connection.php';

	function insertComment($productId, $userId, $text, $rating){
		if(!empty($text)){
			$sql = $GLOBALS['db']->prepare('INSERT INTO comments (product_id, user_id, rating, text, created_at, updated_at) VALUES (:productId, :userId, :rating, :text, Now(), Now())');
			$sql->bindValue(':productId', $productId);
			$sql->bindValue(':userId', $userId);
			$sql->bindValue(':rating', $rating);
			$sql->bindValue(':text', $text);
			$result = $sql->execute();

			return ($result) ? true : false;
		}else{
			return false;
		}
	}

	try{
		$http_verb = strtolower($_SERVER['REQUEST_METHOD']);

		if ($http_verb == 'post') {

        	$post = trim(file_get_contents("php://input"));
        	$json = json_decode($post, true);
            
        	$productId = $json['productId']; 
        	$userId = $json['userId'];
        	$text = $json['text'];
        	$rating = $json['rating'];

        	$inserted = insertComment($productId, $userId, $text, $rating);

        	$myObj = new stdClass();

        	$myObj->inserted = $inserted;

        	echo json_encode($myObj);
    	}
	}catch (Exception $e){
    	$myObj = new stdClass();
    	$myObj->message = "Something went wrong, please try again later";
    	echo json_encode($myObj);
  	}
?>