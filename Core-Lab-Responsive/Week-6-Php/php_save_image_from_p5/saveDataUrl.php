<?php

$img = $_POST['image'];
$img = str_replace('data:image/png;base64,', '', $img);
$img = str_replace(' ', '+', $img);
$fileData = base64_decode($img);

// saving local files
$id = uniqid();
$fileName = $id.".png";
file_put_contents($fileName, $fileData);

?>