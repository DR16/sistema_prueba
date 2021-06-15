<?php 	

$localhost = "db";
$username = "root";
$password = "root";
$dbname = "demo";
$port = "3306";

// db connection
$connect = new mysqli($localhost, $username, $password, $dbname);
// check connection
if($connect->connect_error) {
  die("Connection Failed en la linea: " . $connect->connect_error);
} else {
  // echo "Successfully connected";
}

?>