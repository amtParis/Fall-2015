<?php
$dir = strip_tags($_POST["folder"]);
$img = $_POST["svg"];

$response = 0;

if($img){
	$name = "";
	if ( isset( $_POST["name"] ) ){
		$name = strip_tags($_POST["name"]);
	}

	$image_name = $dir."/".$name.time().''.'_P5.svg';
	
	
	$file = file($img);
	
	// limit at 5 mb
	if( $file['size'] < (1000000 * 5) ){
		$result = file_put_contents($image_name, $file);
		$response = 1;
	}else{
		$response = 0;
	}
	
}else{
	$response = 0;
}

echo $response;
?>