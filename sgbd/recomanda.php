<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>myAcc</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	
</head>
<body>
	<div id="header">
		<div>
		<?php
		setcookie("schedule2",$_POST['schedule2'],time()-86400);
		setcookie("INp",$_POST['INp'],time()-86400);
			if($_COOKIE['is_logged']==="LOGGED"){
				echo "<form action=".'"'."logout_process.php".'"'." method=".'"'."POST".'"'." >";	
				echo "<button type=".'"'."submit".'"'."name=".'"'."logbutton".'"'.">LOGOUT</button>";
				echo "</form>";
			}
			
			
			
			?>
			<a href="index.php" class="logo"><img src="images/logo.png" alt=""></a>
			<form action="index.php">
					<a href="cos.php"><img  src="images/cos.jpg" alt="" name="cos" id="cos"></a>

			</form>
		</div>
		<div class="navigation">
			<ul>
				<li>
					<a href="index.php">home</a>
				</li>
				
				</li>
				<li class="selected">
					<a href="services.php">books</a>
					<ul>
							<li>
								<a href="books/drama.php">Drama</a>
							</li>
							<li>
								<a href="books/fiction.php">Fiction</a>
							</li>
							<li>
								<a href="books/horror.php">Horror</a>
							</li>
							<li>
								<a href="books/romance.php">Romance</a>
							</li>
							<li>
								<a href="books/jurnal.php">jurnal</a>
							</li>
							<li>
								<a href="books/poetry.php">Poetry</a>
							</li>
							<li>
								<a href="books/alte.php">Altele</a>
							</li>
							
						</ul>
				</li>
				<li>
					<a href="contact.php">imprumuturi</a>
				</li>
				<li class="booking">
					<a href="booking.php">Cauta o carte</a>
				</li>
				<li class="rec">
					<a href="recomanda.php">Carti recomandate</a>
				</li>
			</ul>
		</div>
	</div>
	<div id="body">
		<div class="content">
			<div class="section">
				<div class="booking">
					<h2>Look for a book?</h2>
					<?php

					if(isset($_GET['page']))showBooks("carti",$_GET['uname'],$_GET['page']);
					else showBooks("carti","'Drama'",1);
 
	
				?>
				</div>
			</div>
			<div class="sidebar">
				<div class="contact">
					<div>
						<a ><img src="images/lava2.jpg" alt=""></a>
					</div>
					<h4>contact information</h4>
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
				function showBooks($table,$bookType,$pageNumber){
					//	$table="carti";
					//	$bookType="'Drama'";
						$conn = oci_connect("student", "student", "localhost:1521/xe");
						if (!$conn) {
						  $m = oci_error();
						   echo $m['message'], "\n";
						   exit;
									}
						$enquiry="SELECT RECOMANDA_DUPA_USERI(".$bookType.")"." AS mrfc FROM dual";
						
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
							echo "<h3><a href=".'"'."books/thisbook.php?page=".$rc_row['ID_CARTE'].'"'."><img src=".'"'."images/book.jpg".'"'." ></a></h3></th>";
							if($i%3==0)echo"</tr><tr>";
							
						
									}
													
						echo "</tr></table>";
						oci_free_statement($rc);
						oci_close($conn);
						
					}
					function numberOfBooks($table,$bookType){
						$conn = oci_connect("student", "student", "localhost:1521/xe");
						if (!$conn) {
						  $m = oci_error();
						   echo $m['message'], "\n";
						   exit;
									}
						$enquiry="SELECT RECOMANDA_DUPA_USERI(".$bookType.")"." AS mrfc FROM dual";
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
</html>