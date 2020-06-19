<?php 
    require 'connection.php';

    function getProducts($id) {
        try {
            $sql = $GLOBALS['db']->prepare('SELECT id, name, description, price, shipping_cost, image FROM products WHERE id = :id AND deleted_at IS NULL');
            $sql->bindValue(':id', $id);
            $sql->execute();
            $product = $sql->fetch(PDO::FETCH_ASSOC);
            return $product;
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
            if(isset($_GET['id'])) {
                $product = getProducts($_GET['id']);
                $myObj->success = true;
                $myObj->message = $product ? "" : "Cannot find this product id.";
                $myObj->product = $product ? $product : null;
            } else {
                $myObj->success = false;
                $myObj->message = "Missing product id.";
            }
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