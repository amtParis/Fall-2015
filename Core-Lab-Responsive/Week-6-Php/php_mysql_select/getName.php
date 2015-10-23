<?php

$name = $_POST['myName'];

if($name){

	// Set up connection info
	$servername = "localhost";
	$username = "chris2";
	$password = "password";
	$dbname = "myAwesomeDatabase";

	// Create db connection
	$conn = mysqli_connect($servername, $username, $password,$dbname);
	
	// Stop if db connection failed
	if ( mysqli_connect_errno() ) {
     	die("Connection failed: " . mysqli_connect_error() . " " . mysqli_connect_errno() );
	}
	
	// Create selection query for items in database based on username (max 10 in this case)
	//$query = "SELECT * FROM userInfo WHERE username='$name' LIMIT 10"; // this one for exact match
	$query = "SELECT * FROM userInfo WHERE username LIKE '%$name%' LIMIT 10"; 

	// Get the result by querying database
	$result = mysqli_query($conn, $query);

	// Stop if no result
	if(!$result){
		die("Database query failed.". mysqli_error($conn));
	}
	
	// Convert resulst to json array
	$json_arr = array();

	if ($result->num_rows > 0) {
    				// output data of each row
		while($row = mysqli_fetch_array($result, MYSQLI_ASSOC) ) {
			 $json_arr[] = $row;
		}
	} 

	// Close database connection
	mysqli_close($conn);
	$result->close();

	// Send back data in json format
	echo json_encode($json_arr);
	
}else{
	echo "no data";
}

?>