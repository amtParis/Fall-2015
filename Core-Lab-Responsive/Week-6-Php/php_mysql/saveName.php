<?php

$name = $_POST['myName'];

if($name){

	// connection
	$servername = "localhost";
	$username = "chris2";
	$password = "password";
	$dbname = "simpleDB";

	// Create db connection
	$conn = mysqli_connect($servername, $username, $password,$dbname);
	
	// stop if failed
	if ( mysqli_connect_errno() ) {
     	die("Connection failed: " . mysqli_connect_error() . " " . mysqli_connect_errno() );
	}
	$query = "INSERT INTO users (username) VALUES ( '{$name}' )";
	$result = mysqli_query($conn, $query);

	if(!$result){
		die("Database query failed.". mysqli_error($conn));
	}

	mysqli_close($conn);
	echo "success";
}else{
	echo "no data";
}

?>