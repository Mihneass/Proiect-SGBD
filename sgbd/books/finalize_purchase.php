<?php
$fileContent = file_get_contents('./cosul_curent.json');
$basket = json_decode($fileContent,true); 
$conn = oci_connect("student", "student", "localhost:1521/xe");
if(!isset($_COOKIE['loan_id']))setcookie("loan_id",(int)2001,time()+(86400*10));
if (!$conn) {
   $m = oci_error();
   echo $m['message'], "\n";
   exit;
}
foreach($basket as $element){
if($element['buyOrLease']==="cumpara")$enquiry="UPDATE CARTI SET NR_DISPONIBILE=NR_DISPONIBILE-1, NR_TOTALE=NR_TOTALE-1 where ID_CARTE=".$element['bookID'];
                            else $enquiry="UPDATE CARTI SET NR_DISPONIBILE=NR_DISPONIBILE-1 where ID_CARTE=".$element['bookID'];
try{$stid = oci_parse($conn, $enquiry);
oci_execute($stid);}
catch (Exception $e){
    echo $e->errorMessage();
}


if($element['buyOrLease']!="cumpara")$enquiry="INSERT INTO IMPRUMUTURI VALUES(:id,:idBook,:idUser,:date1,:date2,:date3,:date4)";
$stid = oci_parse($conn, $enquiry);
$idd=$_COOKIE['loan_id'];
$idUser=$_COOKIE['userID'];
$today=date("d-m-Y");
oci_bind_by_name($stid,':id',$idd);
oci_bind_by_name($stid,':idBook',$element['bookID']);
oci_bind_by_name($stid,':idUser',$idUser);
oci_bind_by_name($stid,':date1',$today);
oci_bind_by_name($stid,':date2',$today);
oci_bind_by_name($stid,':date3',$today);
oci_bind_by_name($stid,':date4',$today);
setcookie("loan_id",$_COOKIE['loan_id']+1,time()+(86400*10));
echo $_COOKIE['loan_id'];
oci_execute($stid);


$enquiry="SELECT * FROM CARTI WHERE ID_CARTE=".$element['bookID'];
$stid = oci_parse($conn, $enquiry);
oci_execute($stid);
$row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS);
if($row['NR_TOTALE']<=0){
    $enquiry="DELETE FROM CARTI WHERE ID_CARTE=".$row["ID_CARTE"];
    $stid = oci_parse($conn, $enquiry);
    oci_execute($stid);}
}
$empty_array=array();
$empty_array=json_encode($empty_array);
file_put_contents('./cosul_curent.json',$empty_array);
fclose('./cosul_curent.json');
setcookie("current_position",(int)0,time()+(86400));
header('Location: ../cos.php');
?>