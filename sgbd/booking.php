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
			</ul>
		</div>
	</div>
	<div id="body">
		<div class="content">
			<div class="section">
				<div class="booking">
					<h2>Look for a book</h2>
					<?php
				//	setcookie("schedule2",0,time()-86400);
				//	setcookie("INp",0,time()-86400);
					
					
					
					echo "
					</table>
					<table>
						</tr>
						<tr>
							<th> 
								<form method=".'"'."POST".'"'." action=".'"'."books/findmybook.php".'"'.">
								<select name=".'"'."schedule2".'"'." id=".'"'."schedule2".'"'.">
								<option value=".'"'."nume".'"'.">dupa nume</option>	
								<option value=".'"'."an".'"'.">dupa an</option>
								<option value=".'"'."pret".'"'.">dupa pret</option>	
								<option value=".'"'."nr_disponibile".'"'.">dupa nr_disponibile</option>	
							</select>
							<label for='INpe'> <span>INPUT </span>
									<input  type='text' name='INp' id='INp3' required>
								</label>
									<button class='INp' type=".'"'."submit".'"'." name=".'"'."buy".'"'.">go</button></form>
								
							</th>
						</tr>";
						
				echo" </table>";

				echo "<br><br><br><br><br><br><br><br><br>
						<form method=".'"'."POST".'"'." action=".'"'."books/redirect_to_thisbook.php".'"'.">
						<label for="."'"."give_author"."'"."> Insert the ID of the book to find the author! </label>
						<input  type='text' name='ID_INP' id='give_author' required>
						<button class='ID_INP' type=".'"'."submit".'"'." name=".'"'."www".'"'.">go</button>
						</form>";
				
				



					echo"<br><br><br><br><br><br><br><br><br>	
					<form method=".'"'."POST".'"'." action=".'"'."books/redirect_to_thisbook.php".'"'.">
					
						
						<tr>
							<th> 
					<label for="."'"."give_title"."'"."> Titlu </label>
						<input  type='text' name='ID_title' id='give_title' required>
						</th>
						<th>
						<label for="."'"."give_pret"."'"."> Pret </label>
						<input  type='text' name='ID_pret' id='give_pret' required>
						</th>
						<th>
						<label for="."'"."give_gen"."'"."> Gen </label>
						<input  type='text' name='ID_gen' id='give_gen' required>
						</th>
						<th>
						<label for="."'"."give_an"."'"."> An </label>
						<input  type='text' name='ID_INP' id='give_an' required>
						</th>
						</tr>
						<td>
						<button class='ID_INP' type=".'"'."submit".'"'." name=".'"'."www".'"'.">go</button>
						</td>
						</form>";
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
</html>