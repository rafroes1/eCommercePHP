<?php 
	require 'connection.php';

	function getProducts($id){
		try{
			$sql = $GLOBALS['db']->prepare('SELECT * FROM products WHERE id = :id');
        	$sql->bindValue(':id', $id);
        	$sql->execute();
        	$count = $sql->rowCount();

        	if($count > 0){
        		$products = array();
        		while($row = $sql->fetch(PDO::FETCH_ASSOC)){
        			array_push($products, $row);
        		}
        		return $products;
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
            
        	$id = $json['id']; //contains 1

        	$products = getProducts($id);

        	$myObj = new stdClass();

        	if($products != 0){
        		$myObj->products = $products;
        	}else{
    			$myObj->message = "No products";
        	}

        	echo json_encode($myObj);
        }
        
	}catch (Exception $e){
    	$myObj = new stdClass();
    	$myObj->message = "Something went wrong, please try again later";
    	echo json_encode($myObj);
  	}
?>