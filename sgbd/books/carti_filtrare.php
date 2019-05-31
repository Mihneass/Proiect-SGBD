<?php

setcookie('ID_title',$_POST['ID_title'],time()+(86400));
setcookie('ID_pret',$_POST['ID_pret'],time()+(86400));
setcookie('ID_INP',$_POST['ID_INP'],time()+(86400));
setcookie('ID_gen',$_POST['ID_gen'],time()+(86400));
if(isset($_GET['page']))showBooks($_POST['ID_title'],$_POST['ID_pret'],$_POST['ID_INP'],$_POST['ID_gen'],$_GET['page']);
else showBooks($_POST['ID_title'],$_POST['ID_pret'],$_POST['ID_INP'],$_POST['ID_gen'],1);
					$i=0;
                    if(isset($_GET['page']))$currentPage=$_GET['page'];
                    else $currentPage=1;
                    $nrBooks=numberOfBooks($_POST['ID_title'],$_POST['ID_pret'],$_POST['ID_gen'],$_POST['ID_INP']);
                    $totalPages=(int)$nrBooks/12;
                   echo $totalPages;
                    if($currentPage>5)echo "<a href=".'"'."carti_filtrare.php?page=1".'"'.">1</a>   ...   ";
                    while($i<$totalPages){
                        $i++;
                        if($currentPage>=$i-2 && $currentPage<=$i+3 && $currentPage!=$i)
                        echo "<a href=".'"'."carti_filtrare.php?page=".$i.'"'.">".$i."</a>  ";
                        else if($currentPage>=$i-2 && $currentPage<=$i+3)echo $currentPage."  ";
                    }
                    if($currentPage<$totalPages-3)echo "   ...   <a href=".'"'."carti_filtrare.php?page=".$i.'"'.">".$i."</a>";




function showBooks($ID_title,$ID_pret,$ID_INP,$ID_gen,$pageNumber){
$conn = oci_connect("student", "student", "localhost:1521/xe");
if (!$conn) {
  $m = oci_error();
   echo $m['message'], "\n";
   exit;
            }
            $enquiry="SELECT GIVE_BOOKS_BY_FILTER("."'".$ID_title."'".","."'".$ID_pret."'".","."'".$ID_gen."'".","."'".$ID_INP."'".")"." AS mrfc FROM dual";

$stid = oci_parse($conn, $enquiry);
oci_execute($stid);
$i=0;
$currPag=1;
$row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS);
$rc=$row['MRFC'];
oci_execute($rc);
echo "<table><tr>";
while($currPag!=$pageNumber){
$currPag++;
while($i<12){
    $rc_row = oci_fetch_array($rc, OCI_ASSOC+OCI_RETURN_NULLS);
    //var_dump($row);
    $i++;}
    $i=0;
}
$i=0;
while($i<12){
    $rc_row = oci_fetch_array($rc, OCI_ASSOC+OCI_RETURN_NULLS);
    if($rc_row==null)break;
    $i++;
    echo "<th><h4>".$rc_row['TITLU_CARTE']."</h4>";
    echo "<h3><a href=".'"'."thisbook.php?page=".$rc_row['ID_CARTE'].'"'."><img src=".'"'."../images/book.jpg".'"'." ></a></h3></th>";
    if($i%3==0)echo"</tr><tr>";
    

            }
                            
echo "</tr></table>";
oci_free_statement($rc);
oci_close($conn);

        }


function numberOfBooks($ID_title,$ID_pret,$ID_INP,$ID_gen){
    $conn = oci_connect("student", "student", "localhost:1521/xe");
    if (!$conn) {
      $m = oci_error();
       echo $m['message'], "\n";
       exit;
                }
    $enquiry="SELECT GIVE_BOOKS_BY_FILTER("."'".$ID_title."'".","."'".$ID_pret."'".","."'".$ID_gen."'".","."'".$ID_INP."'".")"." AS mrfc FROM dual";
    echo $enquiry;
    $stid = oci_parse($conn, $enquiry);
    oci_execute($stid);
    $i=0;
    $row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS);
    $rc=$row['MRFC'];
    oci_execute($rc);
    while ($rc_row = oci_fetch_array($rc, OCI_ASSOC+OCI_RETURN_NULLS))$i++;
    
    oci_free_statement($rc);
    oci_close($conn);
    return $i;
}


?>