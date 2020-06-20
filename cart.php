<?php 
require 'connection.php';

$http_verb = strtolower($_SERVER['REQUEST_METHOD']);

if($http_verb == 'get') {
  $myObj = new stdClass();
  if(isset($_SESSION['cart'])) {
    $myObj->success = true;
    $myObj->message = "";
    $myObj->products = getProducts();
  } else {
    $myObj->success = true;
    $myObj->message = "Cart is empty.";
    $myObj->products = [];
  }
  echo json_encode($myObj);
}
else if($http_verb == 'post') {
  $post = trim(file_get_contents("php://input"));
  $json = json_decode($post, true);
  $myObj = new stdClass();
  if(isset($_GET['action'])) {
    if($_GET['action'] == 'add') {
      add($json['product_id']);

      $myObj->success = true;
      $myObj->message = "A new product was added to cart successfully.";
    }
    else if ($_GET['action'] == 'checkout') {
      if(isset($_SESSION['cart'])) {
        checkout($json);

        $myObj->success = true;
        $myObj->message = "Purchase successful.";
      } else {
        $myObj->success = true;
        $myObj->message = "Cart is empty.";
      }
    }
    else {
      $myObj->success = false;
      $myObj->message = "This action is not exist.";
    }
  } else {
    $myObj->success = false;
    $myObj->message = "Missing action.";
  }

  echo json_encode($myObj);
}
else if($http_verb == 'put') {
  $post = trim(file_get_contents("php://input"));
  $json = json_decode($post, true);
  $myObj = new stdClass();

  if(isset($_SESSION['cart'])) {
    $result = checkValidation($json['products']);
    if($result->isValid) {
      update($json['products']);

      $myObj->success = true;
      $myObj->message = "Cart was updated successfully.";
    } else {
      $myObj->success = $result->isValid;
      $myObj->message = $result->message;
    }
  } else {
    $myObj->success = true;
    $myObj->message = "Cart is empty.";
  }

  echo json_encode($myObj);
}
else if($http_verb == 'delete') {
  $myObj = new stdClass();
  if(isset($_SESSION['cart'])) {
    if(isset($_GET['action'])) {
      if($_GET['action'] == 'remove') {
        $post = trim(file_get_contents("php://input"));
        $json = json_decode($post, true);

        if(isset($_SESSION['cart'][$json['product_id']])) {
          unset($_SESSION['cart'][$json['product_id']]);
          $myObj->success = true;
          $myObj->message = "Product was removed from cart successfully.";
        } else {
          $myObj->success = false;
          $myObj->message = "Product is not exist in your cart.";
        }
      }
      else if($_GET['action'] == 'clear') {
        unset($_SESSION['cart']);

        $myObj->success = true;
        $myObj->message = "Cart was cleared successfully.";
      }
      else {
        $myObj->success = false;
        $myObj->message = "This action is not exist.";
      }
    } else {
      $myObj->success = false;
      $myObj->message = "Missing action.";
    }
  } else {
    $myObj->success = true;
    $myObj->message = "Cart is empty.";
  }

  echo json_encode($myObj);
}

function getProducts() {
  $products = [];
  foreach ($_SESSION['cart'] as $item) {
    $cmd = 'SELECT name, description, price, shipping_cost, image FROM products WHERE id = :id AND deleted_at IS NULL';
    $sql = $GLOBALS['db']->prepare($cmd);
    $sql->bindValue(':id', $item['product_id']);
    $sql->execute();
    $product = $sql->fetch(PDO::FETCH_ASSOC);
    $products[] = $product;
  }
  return $products;
}

function add($product_id) {
  if(isset($_SESSION['cart'])) {
    if(isset($_SESSION['cart'][$product_id]))
      $_SESSION['cart'][$product_id]['quantities'] += 1;
    else
      $_SESSION['cart'][$product_id] = ['product_id' => $product_id, 'quantities' => 1];
  } else {
    $_SESSION['cart'] = array();
    $_SESSION['cart'][$product_id] = ['product_id' => $product_id, 'quantities' => 1];
  }
}

function update($products) {
  foreach ($products as $product) {
    $_SESSION['cart'][$product['id']]['quantities'] = $product['quantities'];
  }
}

function checkValidation($products) {
  $myObj = new stdClass();
  $myObj->isValid = true;
  $myObj->message = "";
  foreach ($products as $product) {
    if((int)$product['quantities'] <= 0) {
      $myObj->isValid = false;
      $myObj->message = "Quantity is not valid and must be greater than 0.";
      break;
    }
  }
  return $myObj;
}

function checkout($json) {
  // save cart
  $userId = isset($_SESSION['userId']) ? $_SESSION['userId'] : null;
  $cmd = 'INSERT INTO carts (user_id, fullname, phone, address) VALUES (:user_id, :fullname, :phone, :address)';
  $sql = $GLOBALS['db']->prepare($cmd);
  $sql->bindValue(':user_id', $userId);
  foreach (['fullname', 'phone', 'address'] as $field) {
    $sql->bindValue(":$field", $json[$field]);
  }
  $sql->execute();
  $cart_id = $GLOBALS['db']->lastInsertId();

  // save cart items
  $total = 0;
  foreach ($_SESSION['cart'] as $item) {
    $cmd = 'SELECT * FROM products WHERE id = :id AND deleted_at IS NULL';
    $sql = $GLOBALS['db']->prepare($cmd);
    $sql->bindValue(':id', $item['product_id']);
    $sql->execute();
    $product = $sql->fetch(PDO::FETCH_ASSOC);

    $cmd = 'INSERT INTO cart_items (cart_id, product_id, quantities, price, shipping_cost) VALUES (:cart_id, :product_id, :quantities, :price, :shipping_cost)';
    $sql = $GLOBALS['db']->prepare($cmd);
    $sql->bindValue(':cart_id', $cart_id);
    $sql->bindValue(':product_id', $product['id']);
    $sql->bindValue(':quantities', $item['quantities']);
    $sql->bindValue(':price', $product['price']);
    $sql->bindValue(':shipping_cost', $product['shipping_cost']);
    $sql->execute();

    $total += $product['price'] + $product['shipping_cost'];
  }

  // update cart total
  $cmd = 'UPDATE carts SET total = :total WHERE id = :id';
  $sql = $GLOBALS['db']->prepare($cmd);
  $sql->bindValue(':total', $total);
  $sql->bindValue(':id', $cart_id);
  $sql->execute();

  unset($_SESSION['cart']);
}

?>
