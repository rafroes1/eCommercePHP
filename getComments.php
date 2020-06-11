<?php 
	require 'connection.php';

	function getComments($id){
		try{
			$sql = $GLOBALS['db']->prepare('SELECT product_id, rating, images, text FROM comments WHERE product_id = :id');
        	$sql->bindValue(':id', $id);
        	$sql->execute();

        	if($comments = $sql->fetch(PDO::FETCH_ASSOC)){
        		//todo: arrumar aqui que ta retornando so um comentario e nao todos
        		return $comments;
        	}else{
        		return 0;
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
            
        	$productId = $json['id']; //contains 1

        	$comments = getComments($productId);

        	$myObj = new stdClass();

        	if($comments != 0){
        		$myObj->comments = $comments;
        	}else{
    			$myObj->message = "No comments";
        	}

        	echo json_encode($myObj);
    	}else if ($http_verb == 'get') {
    		//TODO
    	}else if ($http_verb == 'delete') {
        	//TODO
    	}
	}catch (Exception $e){
    	$myObj = new stdClass();
    	$myObj->message = "Something went wrong, please try again later";
    	echo json_encode($myObj);
  	}
?>