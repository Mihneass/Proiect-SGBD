<?php
$conn = oci_connect("student", "student", "localhost:1521/xe");
if (!$conn) {
   $m = oci_error();
   echo $m['message'], "\n";
   exit;
}
$enquiry="BEGIN GET_ONE_USER"."("."'".$_POST['uname']."'".",:pass,:id_user);end;";
//$enquiry="BEGIN GET_ONE_USER"."("."'"."'".'||a;drop table membership'."'".",:pass,:id_user);end;";
$stid = oci_parse($conn, $enquiry);
oci_bind_by_name($stid,':pass',$rpassword,40);
oci_bind_by_name($stid,':id_user',$id_user,40);
oci_execute($stid);
/*
$row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS);
$rc=$row['MRFC'];
oci_execute($rc);
$rc_row = oci_fetch_array($rc, OCI_ASSOC+OCI_RETURN_NULLS);
*/
echo $rpassword;
if($rpassword==='USER NOT FOUND'){setcookie("is_logged","USER_NOT_FOUND",time()+(86400*10),"/");
            echo $enquiry;
            header('Location: /sgbd/index.php');
            }
        else if($rpassword!=$_POST['pass']){
            setcookie("is_logged","PASS_NOT_FOUND",time()+(86400*10),"/");
            header('Location: /sgbd/index.php');
        }
            else {setcookie("is_logged","LOGGED",time()+(86400*10),"/");
                  setcookie("user",$_POST['uname'],time()+(86400*10),"/");
                  setcookie("userID",$id_user,time()+(86400*10),"/");
                  header('Location: /sgbd/index.php');
                }

?>