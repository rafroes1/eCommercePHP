<?php 
	require 'connection.php';

	function getComments($id){
		try{
			$sql = $GLOBALS['db']->prepare('SELECT product_id, rating, images, text, username, c.created_at FROM comments AS c, users AS u WHERE product_id = :id AND c.user_id = u.id');
        	$sql->bindValue(':id', $id);
        	$sql->execute();
        	$count = $sql->rowCount();

        	if($count > 0){
        		$comments = array();
        		while($row = $sql->fetch(PDO::FETCH_ASSOC)){
        			array_push($comments, $row);
        		}
        		return $comments;
        	}else{
        		return $count;
        	}
        }catch (Exception $e){
    		$myObj = new stdClass();
    		$myObj->message = "Problem with the query/database";
    		echo json_encode($myObj);
  		}
	}

	try{
		$http_verb = strtolower($_SERVER['REQUEST_METHOD']);

		if ($http_verb == 'post') {

        	$post = trim(file_get_contents("php://input"));
        	$json = json_decode($post, true);
            
        	$productId = $json['productId'];

        	$comments = getComments($productId);

        	$myObj = new stdClass();

        	if($comments != 0){
        		$myObj->comments = $comments;
        	}else{
    			$myObj->message = "No comments";
        	}

        	echo json_encode($myObj);
    	}
	}catch (Exception $e){
    	$myObj = new stdClass();
    	$myObj->message = "Something went wrong, please try again later";
    	echo json_encode($myObj);
  	}
?>