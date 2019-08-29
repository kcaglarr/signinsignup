<?php

header('Content-Type: application/json; charset=UTF-8');
//Veritabanı bağlantı dosyası
include_once "connect.php";

//kayıt formu verileri
$name = $_POST['name'];
$lastName = $_POST['lastName'];
$email = $_POST['email'];
$password = $_POST['password'];
$password = md5($password);

//sorgu
$sorgu="INSERT INTO users (name,lastname,email,password) VALUES ('$name','$lastName','$email','$password')";

//kontrol
$check=mysqli_query($connection,"SELECT * FROM users WHERE email='$email'");


if(mysqli_num_rows($check) > 0){
    $response['status']='Error';
    $response['message']= $email. " email address already exist" ;
}

else
{
    if (mysqli_query($connection, $sorgu)) {
        $response['status']='Success';
        $response['message']="Registration completed successfully";

    } else {
        $response['status']='Error';
        $response['mesaj']="Error: " . $sorgu ;

    }
}
echo json_encode($response);

mysqli_close($connection);
