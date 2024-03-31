<?php
session_start();
include_once("include/connect.php");


if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $username = $_POST["username"];
  $password = $_POST["password"];

  $hashed_password = hash('sha256', $password);

  $stmt = $pdo->prepare("SELECT iduser FROM user WHERE username = ? AND password = ?");
  $stmt->execute([$username, $hashed_password]);

  if ($stmt->rowCount() > 0) {
    $_SESSION['logged_in'] = true; 
    echo "success"; 
  } else {
    $stmt = $pdo->prepare("SELECT idstudent FROM students WHERE student_no = ? AND password = ?");
    $stmt->execute([$username, $hashed_password]);
    
    if ($stmt->rowCount() > 0) {
      $_SESSION['logged_in'] = true; 
      echo "success"; 
    } else {
      echo "error";
    }
  }
}
?>