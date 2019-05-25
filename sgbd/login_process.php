<?php
$conn = oci_connect("student", "student", "localhost:1521/xe");
if (!$conn) {
   $m = oci_error();
   echo $m['message'], "\n";
   exit;
}
$enquiry="SELECT GIVE_USERS"."('".$_POST['uname']."') as mrfc from dual";
$stid = oci_parse($conn, $enquiry);
oci_execute($stid);
$row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS);
$rc=$row['MRFC'];
oci_execute($rc);
$rc_row = oci_fetch_array($rc, OCI_ASSOC+OCI_RETURN_NULLS);
if($rc_row==null){setcookie("is_logged","USER_NOT_FOUND",time()+(86400*10),"/");
               header('Location: /sgbd/index.php');
            }
        else if($rc_row['PASS']!=$_POST['pass']){
            setcookie("is_logged","PASS_NOT_FOUND",time()+(86400*10),"/");
            header('Location: /sgbd/index.php');
        }
            else {setcookie("is_logged","LOGGED",time()+(86400*10),"/");
                  setcookie("user",$rc_row['PRENUME'],time()+(86400*10),"/");
                  setcookie("userID",$rc_row['ID_USER'],time()+(86400*10),"/");
                  header('Location: /sgbd/index.php');
                }

?>