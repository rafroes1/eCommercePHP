<?php
	require 'connection.php';

	function getHistory($id){
		try{
			$sql = $GLOBALS['db']->prepare('SELECT ci.product_id, p.name, ci.quantities, p.price AS individualPrice, p.description
												FROM cart_items AS ci, carts AS c, products AS p
												WHERE c.id = ci.cart_id 
    												AND c.status = 3 
        											AND c.user_id = :id 
        											AND ci.product_id = p.id');
        	$sql->bindValue(':id', $id);
        	$sql->execute();
        	$count = $sql->rowCount();

        	if($count > 0){
        		$items = array();
        		while($row = $sql->fetch(PDO::FETCH_ASSOC)){
        			array_push($items, $row);
        		}
        		return $items;
        	}else{
        		return $count;
        	}
		}catch (Exception $e){
    		$myObj = new stdClass();
    		$myObj->message = $e;
    		echo json_encode($myObj);
  		}
	}

	try{
		$http_verb = strtolower($_SERVER['REQUEST_METHOD']);

		if ($http_verb == 'post') {

        	$post = trim(file_get_contents("php://input"));
        	$json = json_decode($post, true);
            
        	$userId = $json['userId']; //contains 1

        	$history = getHistory($userId);

        	$myObj = new stdClass();

        	if($history != 0){
        		$myObj->history = $history;
        	}else{
    			$myObj->message = "No items bought";
        	}

        	echo json_encode($myObj);
    	}
	}catch (Exception $e){
    	$myObj = new stdClass();
    	$myObj->message = "Something went wrong, please try again later";
    	echo json_encode($myObj);
  	}
?>