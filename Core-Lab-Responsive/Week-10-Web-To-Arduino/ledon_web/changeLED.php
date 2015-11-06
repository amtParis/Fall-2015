<?php

$led = $_POST['state'];

//if($led == 0 || $led == 1){
	$textfile = "led.txt";
	$fileLocation = "$textfile";
	$fh = fopen($fileLocation, 'w ') or die('Error');
	fwrite($fh, $led);
	fclose($fh);
	echo "ok";
//}
?>