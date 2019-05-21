<?php
$fileContent = file_get_contents('./cosul_curent.json');
$books = json_decode($fileContent,true);
$i=0;
foreach($books as $element){
    
    if($element['positionInBasket']===$_POST['position_to_delete'])unset($books[$i]);
    $i++;
}
$books=array_values($books);
$formatedUsers=json_encode($books);
file_put_contents('./cosul_curent.json',$formatedUsers);
fclose('./cosul_curent.json');
header('Location: ../cos.php');
?>