<!DOCTYPE HTML>

<html>
<head>
	<meta charset="UTF-8">
	<title>drama</title>
	<link rel="stylesheet" href="../css/style.css" type="text/css">
	
	<style>
		
	</style>

</head>
<body>
	<div id="header">
		<div>
		<?php
			if($_COOKIE['is_logged']==="LOGGED"){
				echo "<form action=".'"'."logout_process.php".'"'." method=".'"'."POST".'"'." >";	
				echo "<button type=".'"'."submit".'"'."name=".'"'."logbutton".'"'.">LOGOUT</button>";
				echo "</form>";
			}
			?>
			<a href="../index.php" class="logo"><img src="../images/logo.png" alt=""></a>
			<form action="../index.php">
				<a href="../cos.php"><img  src="../images/cos.jpg" alt="" name="cos" id="cos"></a>
				
			</form>
		</div>
		<div class="navigation">
			<ul>
				<li>
					<a href="../index.php">home</a>
				</li>
				
				</li>
				<li class="selected">
					<a href="../services.php">books</a>
					<ul>
						<li>
							<a href="drama.php">Drama</a>
						</li>
						<li>
							<a href="fiction.php">Fiction</a>
						</li>
						<li>
							<a href="horror.php">Horror</a>
						</li>
						<li>
							<a href="romance.php">Romance</a>
						</li>
						<li>
							<a href="jurnal.php">Jurnal</a>
						</li>
						<li>
							<a href="poetry.php">Poetry</a>
						</li>
						<li>
							<a href="alte.php">Altele</a>
						</li>
						
					</ul>
				</li>
				<li>
					<a href="../contact.php">contact</a>
				</li>
				<li class="booking">
					<a href="../booking.php">Cauta o carte</a>
				</li>
			</ul>
		</div>
	</div>
	<div id="body">
		<div class="content">
			<div class="section">
				<div class="breadcrumb">
					<span>You are here:</span>
					<ul>
						<li>
							<a href="../index.php">home</a>
						</li>
						<li>
							<a href="../services.php">books</a>
						</li>
						<li>
								<a href="findmybook.php">mySerch</a>
							</li>
						
					</ul>
				</div>
				<div class="services">
					<h2>Books</h2>
        <?php
				$tip=0;
				if(!isset($_COOKIE['schedule2']))setcookie("schedule2",$_POST['schedule2'],time()+86400);
				if(!isset($_COOKIE['INp']))setcookie("INp",$_POST['INp'],time()+86400);
        if( $_COOKIE['schedule2']==="pret"){$tip=1;echo"-------------------dupa pret";}
        else
        if( $_COOKIE['schedule2']==="nume"){$tip=2;echo"-------------------dupa titlu";}
        else
        if( $_COOKIE['schedule2']==="autor"){$tip=3;echo"-------------------dupa autor";}
        else
        if( $_COOKIE['schedule2']==="an"){$tip=4;echo"-------------------dupa an";}
        else
        if( $_COOKIE['schedule2']==="nr_disponibile"){$tip=5;echo"-------------------dupa nr_disponibile";}


        echo"$tip-------------------";
					if(isset($_GET['page']))showBooks($tip,"carti", $_COOKIE['INp'],$_GET['page']);
					                   else showBooks($tip,"carti", $_COOKIE['INp'],1);
					
				?>
				</div>
				<div class="pages">
						<?php
                        $i=0;
                        $d=$_COOKIE['INp'];
						if(isset($_GET['page']))$currentPage=$_GET['page'];
						else $currentPage=1;
						$nrBooks=numberOfBooks($tip,"carti",$d);
						$totalPages=(int)$nrBooks/12;
						if($currentPage>5)echo "<a href=".'"'."findmybook.php?page=1".'"'.">1</a>   ...   ";
						while($i<$totalPages){
							$i++;
							if($currentPage>=$i-2 && $currentPage<=$i+3 && $currentPage!=$i)
							echo "<a href=".'"'."findmybook.php?page=".$i.'"'.">".$i."</a>  ";
							else if($currentPage>=$i-2 && $currentPage<=$i+3)echo $currentPage."  ";
						}
						if($currentPage<$totalPages-3)echo "   ...   <a href=".'"'."findmybook.php?page=".$i.'"'.">".$i."</a>";

						?>
				</div>
			</div>
			<div class="sidebar">
				<div class="navigation">
					<h3>Books //</h3>
					<ul>
						<li class="selected">
							<a href="drama.php">drama</a>
						</li>
						<li>
							<a href="fiction.php">fiction</a>
						</li>
						<li>
							<a href="horror.php">horror</a>
						</li>
						<li>
							<a href="romance.php">romance</a>
						</li>
						<li>
							<a href="jurnal.php">jurnal</a>
						</li>
						<li>
							<a href="poetry.php">poetry</a>
						</li>
						<li>
							<a href="alte.php">altele</a>
						</li>	
					</ul>
				</div>
				<div class="contact">
					<h3>contact information</h3>
					<ul>
						<li>
							<b>address:</b> <span>426 strada repar</span>
						</li>
						<li>
							<b>phone:</b> <span>353737353</span>
						</li>
						<li>
							<b>fax:</b> <span>373753735533</span>
						</li>
						<li>
							<b>email:</b> <span><a href="">bicicleteSRL@yahoo.com</a></span>
						</li>
					</ul>
				</div>
				
			</div>
		</div>
	</div>
	<div id="footer">
		<div>
			<div class="contact">
				<h3>contact information</h3>
				<ul>
					<li>
						<b>address:</b> <span>426 strada repar</span>
					</li>
					<li>
						<b>phone:</b> <span>04433344433</span>
					</li>
					<li>
						<b>fax:</b> <span>43322324432</span>
					</li>
					<li>
						<b>email:</b> <span><a href="">biciclete@yahoo.com</a></span>
					</li>
				</ul>
			</div>
			<div class="tweets">
				<h3>recent tweets</h3>
				<ul>
					<li>
						<a href="#">blablalbalbalalvalvalvlablalbalblalblablab.<span>1 day ago</span></a>
					</li>
					<li>
						<a href="#">blablalbalbla.<span>2 days ago</span></a>
					</li>
				</ul>
			</div>
			<div class="posts">
				<h3>recent blog post</h3>
				<ul>
					<li>
						<a href="#">roti noi</a>
					</li>
					<li>
						<a href="#">repar tot</a>
					</li>
					<li>
						<a href="#">stoc epuizat</a>
					</li>
					
				</ul>
			</div>
			<div class="connect">
				<h3>stay in touch</h3>
				<p>
					pentru detalii
				</p>
				<ul>
					<li id="facebook">
						<a href="">facebook</a>
					</li>
					<li id="twitter">
						<a href="">twitter</a>
					</li>
					<li id="googleplus">
						<a href="">googleplus</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="section">
			<p>
				&copy; uaic iasi
			</p>
			
		</div>
	</div>
</body>
<?php 
						function showBooks($tip,$table,$newBookp,$pageNumber){
						//	$table="carti";
						//	$bookType="'Drama'";
							$conn = oci_connect("student", "student", "localhost:1521/xe");
							if (!$conn) {
  							$m = oci_error();
   							echo $m['message'], "\n";
   							exit;
										}
                                        if	($tip===2)$enquiry="SELECT * FROM ".$table." where TITLU_CARTE like '%$newBookp%'";
                                     else
                                     if	($tip===3) $enquiry="SELECT * FROM ".$table." where TITLU_CARTE=".$newBookp;
                                     else
                                     if	($tip===4) $enquiry="SELECT * FROM ".$table." where AN_PUBLICATIE like '%$newBookp%'";
                                     else
                                     if	($tip===5) $enquiry="SELECT * FROM ".$table." where NR_DISPONIBILE=".$newBookp;

                                     else
                                     $enquiry="SELECT * FROM ".$table." where pret=".$newBookp;

							$stid = oci_parse($conn, $enquiry);
							oci_execute($stid);
							$i=0;
							$currPag=1;
							echo "<table><tr>";
							while($currPag!=$pageNumber){
							$currPag++;
							while($i<12){
								$row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS);
								$i++;}
								$i=0;
							}
							$i=0;
							while($i<12){
								$row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS);
								if($row==null)break;
								$i++;
								
                                echo "<th><h4>".$row['TITLU_CARTE']."</h4>";
                                if ($row['GEN_CARTE']==='Poetry') 
					                echo "<h3><a href=".'"'."thisbook.php?page=".$row['ID_CARTE'].'"'."><img src=".'"'."../images/transmisie.jpg".'"'." ></a></h3></th>";
                                else
                                if ($row['GEN_CARTE']==='Jurnal') 
                                  echo "<h3><a href=".'"'."thisbook.php?page=".$row['ID_CARTE'].'"'."><img src=".'"'."../images/frane.jpg".'"'." ></a></h3></th>";
                                else
                                if ($row['GEN_CARTE']==='Horror') 
                                  echo "<h3><a href=".'"'."thisbook.php?page=".$row['ID_CARTE'].'"'."><img src=".'"'."../images/tool-box.jpg".'"'." ></a></h3></th>";
                                else     
                                if ($row['GEN_CARTE']==='Drama') 
                                  echo "<h3><a href=".'"'."thisbook.php?page=".$row['ID_CARTE'].'"'."><img src=".'"'."../images/drinking.jpg".'"'." ></a></h3></th>";
                                else
                                if ($row['GEN_CARTE']==='Fiction') 
                                  echo "<h3><a href=".'"'."thisbook.php?page=".$row['ID_CARTE'].'"'."><img src=".'"'."../images/navigator.jpg".'"'." ></a></h3></th>";
                                else
                                if ($row['GEN_CARTE']==='Romance') 
                                  echo "<h3><a href=".'"'."thisbook.php?page=".$row['ID_CARTE'].'"'."><img src=".'"'."../images/roti.jpg".'"'." ></a></h3></th>";
                                else
                                  echo "<h3><a href=".'"'."thisbook.php?page=".$row['ID_CARTE'].'"'."><img src=".'"'."../images/book.jpg".'"'." ></a></h3></th>";

                                    if($i%3==0)echo"</tr><tr>";
							
										}
														
							echo "</tr></table>";
							oci_close($conn);
							
						}
						function numberOfBooks($tip,$table,$newBookp){
							$conn = oci_connect("student", "student", "localhost:1521/xe");
							if (!$conn) {
  							$m = oci_error();
   							echo $m['message'], "\n";
   							exit;
                                        }
                                        if	($tip===2)$enquiry="SELECT * FROM ".$table." where TITLU_CARTE like '%$newBookp%'";
                                        else
                                        if	($tip===3) $enquiry="SELECT * FROM ".$table." where TITLU_CARTE=".$newBookp;
                                        else
                                        if	($tip===4) $enquiry="SELECT * FROM ".$table." where AN_PUBLICATIE like '%$newBookp%'";
                                        else
                                        if	($tip===5) $enquiry="SELECT * FROM ".$table." where NR_DISPONIBILE=".$newBookp;   
                                        else
                                        $enquiry="SELECT * FROM ".$table." where pret=".$newBookp;

							$stid = oci_parse($conn, $enquiry);
							oci_execute($stid);
							$i=0;

							while ($row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS))$i++;
							oci_close($conn);
							return $i;
						}

?>
</html>