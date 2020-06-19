<?php 
    require 'connection.php';

    function getAllProducts() {
        try {
            $sql = $GLOBALS['db']->prepare('SELECT id, name, description, price, shipping_cost, image FROM products WHERE deleted_at IS NULL');
            $sql->execute();
            $count = $sql->rowCount();

            $products = array();
            if($count > 0){
                while($row = $sql->fetch(PDO::FETCH_ASSOC)){
                    array_push($products, $row);
                }
            }
            return $products;
        } catch (Exception $e) {
            $myObj = new stdClass();
            $myObj->message = "Problem with the query/database";
            echo json_encode($myObj);
        }
    }

    try {
        $http_verb = strtolower($_SERVER['REQUEST_METHOD']);
        $myObj = new stdClass();

        if ($http_verb == 'get') {
            $products = getAllProducts();

            $myObj->success = true;
            $myObj->message = $products ? "" : "No products.";
            $myObj->products = $products;
        } else {
            $myObj->success = false;
            $myObj->message = "Wrong method.";
        }
        
        echo json_encode($myObj);
    } catch (Exception $e) {
        $myObj = new stdClass();
        $myObj->message = "Something went wrong, please try again later";
        echo json_encode($myObj);
    }
?>