<?php
$dbhost							= "localhost";
$dbuser							= "root";
$dbpass							= "root";
$dbname							= "kodluyoruz";

$connection = mysqli_connect($dbhost,$dbuser,$dbpass) or die ("Mysql baglanti hatasi");
mysqli_select_db($connection,$dbname) or die ("Veritabani baglanti hatasi");
?>
