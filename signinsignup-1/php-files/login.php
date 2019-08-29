<?php

header('Content-Type: application/json; charset=UTF-8');
//Veritabanı bağlantı dosyası
include_once "connect.php";

//giriş formu verileri
$email = $_POST['email'];
$password = $_POST['password'];
$password = md5($password);

//sorgu
$sorgu = "select email,password from users where email='" . $email . "' and password='" .$password . "'";
$result = mysqli_query($connection,$sorgu);
$row=mysqli_fetch_array($result,MYSQLI_ASSOC);


if (mysqli_num_rows($result) > 0)
{
 if (!empty($row)) 
 {
    $response['status']='Success';
    $response['message']="Login successful";
    $returnValue = $row;
  }
}
else
{
  $response['status']='Error';
  $response['message']="Error: User not found";
}
echo json_encode($response);

mysqli_close($connection);
