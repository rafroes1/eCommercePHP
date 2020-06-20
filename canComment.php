<?php 
	require 'connection.php';

	function canComment($productId, $userId){
		try{
			$sql = $GLOBALS['db']->prepare('SELECT COUNT(c.id) AS numberOfCarts FROM carts AS c, cart_items AS ci WHERE c.status = 3 AND c.user_id = :userId AND ci.product_id = :productId');
        	$sql->bindValue(':productId', $productId);
        	$sql->bindValue(':userId', $userId);
        	$sql->execute();

        	$aux = $sql->fetch(PDO::FETCH_ASSOC);
        	if($aux['numberOfCarts'] != "0"){
        		return true;
        	}else{
        		return false;
        	}
		}catch (Exception $e){
    		$myObj = new stdClass();
    		$myObj->message = "Something went wrong, please try again later";
    		echo json_encode($myObj);
  		}
	}

	try{
		$http_verb = strtolower($_SERVER['REQUEST_METHOD']);

		if ($http_verb == 'post') {

        	$post = trim(file_get_contents("php://input"));
        	$json = json_decode($post, true);
            
        	$productId = $json['productId'];
        	$userId = $json['userId'];

        	$canComment = canComment($productId, $userId);

        	$myObj = new stdClass();

        	$myObj->canComment = $canComment;

        	echo json_encode($myObj);
    	}
	}catch (Exception $e){
    	$myObj = new stdClass();
    	$myObj->message = "Something went wrong, please try again later";
    	echo json_encode($myObj);
  	}
?>