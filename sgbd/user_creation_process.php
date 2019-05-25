<?php
$conn = oci_connect("student", "student", "localhost:1521/xe");
if (!$conn) {
   $m = oci_error();
   echo $m['message'], "\n";
   exit;
}
if(!isset($_COOKIE['current_ID']))setcookie("current_ID",10003,time()+(86400*100));
if(!isset($_COOKIE['error_state']))setcookie("error_state","NO_PROBLEM",time()+(86400*100));

$enquiry="SELECT * FROM USERI WHERE USER_NAME="."'".$_POST['uname']."'";
$stid = oci_parse($conn, $enquiry);
oci_execute($stid);
$row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS);
if($row!=null){
    setcookie("error_state","USER_TAKEN",time()+(86400*100));
    header('Location: index.php');}
if($_POST['passr']!=$_POST['passr2'])setcookie("error_state","PASS_DOESNT_MATCH",time()+(86400*100));


$enquiry="begin INSERT_USER".
"(:idul, :userrr, :password, :nume, :prenume, :gender, :phone, :addre, :email, '20-05-2019', '20-05-2019');end;";
$stid = oci_parse($conn, $enquiry);
$idd=$_COOKIE['current_ID'];
oci_bind_by_name($stid,':idul',$idd);
oci_bind_by_name($stid,':userrr',$_POST['uname']);
oci_bind_by_name($stid,':password',$_POST['passr']);
oci_bind_by_name($stid,':nume',$_POST['fname']);
oci_bind_by_name($stid,':prenume',$_POST['lname']);
oci_bind_by_name($stid,':gender',$_POST['schedule']);
oci_bind_by_name($stid,':phone',$_POST['phone']);
oci_bind_by_name($stid,':addre',$_POST['address']);
oci_bind_by_name($stid,':email',$_POST['email3']);
//echo $enquiry;
oci_execute($stid);
setcookie("current_ID",$_COOKIE['current_ID']+1,time()+(86400*100));
header('Location: index.php');

?>