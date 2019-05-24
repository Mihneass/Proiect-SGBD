<?php
if($_COOKIE['is_logged']===0)header('Location: index.php');
setcookie("current_position",$_COOKIE['current_position']+1,time()+86400);
$newBook=array(
    'positionInBasket'=>$_COOKIE['current_position'],
    'bookID'=>$_POST['book_ID'],
    'bookName'=>$_POST['book_name'],
    'buyOrLease'=>$_POST['schedule'],
    'price'=>$_POST['book_price']
);
echo $_POST['book_ID'];
$fileContent = file_get_contents('./cosul_curent.json');
        $basket = json_decode($fileContent); 

		array_push($basket,$newBook);
        $formatedBasket=json_encode($basket);
        file_put_contents('./cosul_curent.json',$formatedBasket);
        fclose('./cosul_curent.json');


header('Location: thisbook.php?page='.$_POST['book_ID']);

?>