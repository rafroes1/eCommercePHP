<?php
	require 'connection.php';

	//add product name and price
	function getHistory($id){
		try{
			$sql = $GLOBALS['db']->prepare('SELECT ci.product_id, ci.quantities
				FROM cart_items AS ci, carts AS c 
				WHERE c.id = ci.cart_id AND c.checkedout = 1 AND c.user_id = :id');
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
    		$myObj->message = "Problem with the query/database";
    		echo json_encode($myObj);
  		}
	}

	//use this function to return an item name and description
	function getProductInfo($id){
		try{
			$sql = $GLOBALS['db']->prepare('SELECT name, description FROM products WHERE id = :id');
        	$sql->bindValue(':id', $id);
        	$sql->execute();
        	$count = $sql->rowCount();

        	if($count > 0){
        		$info = $sql->fetch(PDO::FETCH_ASSOC);
        		return $info;
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
            
        	$userId = $json['id']; //contains 2

        	//array with all productsID and quantities purchased in history
        	$history = getHistory($userId);

        	//you can loop through this array and use 'getProductInfo(productID)' to get product name and description

        	$myObj = new stdClass();

        	if($history != 0){
        		$myObj->history = $history;
        	}else{
    			$myObj->message = "No items bought";
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