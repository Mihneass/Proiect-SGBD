<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>home</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	
</head>

<?php

if(!isset($_COOKIE['is_logged'])){
	setcookie("is_logged",0,time()+(86400*10),"/");
	setcookie("user",0,time()-(86400*10),"/");
	setcookie("userID",0,time()-(86400*10),"/");

}


?>

<body>
	<div id="header">
		<div>
			<a href="index.php" class="logo"><img src="images/logo.png" alt=""></a>
			<?php
			if($_COOKIE['is_logged']==="LOGGED"){
				header('Location: services.php');
				echo "<form action=".'"'."logout_process.php".'"'." method=".'"'."POST".'"'." >";	
				echo "<button type=".'"'."submit".'"'."name=".'"'."logbutton".'"'.">LOGOUT</button>";
				echo "</form>";
			}
			?>
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
			<div class="header">
				
					<form action="login_process.php" method="POST">
							<ul>
									<li>
											<a  class="figure"></a>
										<div>
												  
												  <h2 style="position: absolute;">ALREADY HAVE A BIBLIOTECA ACCOUNT?</h2>
												
										</div>
									</li>
							</ul>
					<ul>
						<li>
							<a  class="figure"></a>
							<div>
								<h3><span>Username</span></h3>
								<p>
										<input type="text" name="uname" id="uname" required>	</p>
							</div>
						</li>
						<li>
							<a  class="figure"></a>
							<div>
								<h3><span >Password</span></h3>
								<p>
										<input type="password" name="pass" id="pass" required>	</p>
							</div>
						</li>
						<li>
							<a  class="figure"></a>
							<div>
								<h3><span >Login</span></h3>
								<p>
										<button type="submit" name="logbutton"> OK</button><?php if($_COOKIE['is_logged']==="USER_NOT_FOUND"){echo "There is no user with that name!";
																																			  setcookie("is_logged",0,time()+(86400*10),"/");}
																																		else if($_COOKIE['is_logged']==="PASS_NOT_FOUND"){echo "Wrong password!";
																																			setcookie("is_logged",0,time()+(86400*10),"/");}
																																		?> 	</p>
							</div>
						</li>
					</ul>
				</form>
			</div>			
	
		<div id="body">
			<div class="content">
				<div class="section">
					<div class="booking">
						<h2>							DON'T HAVE A BIBLIOTECA ACCOUNT?						
							</h2>
						
						<form action="user_creation_process.php" method="POST">
							<h4>fill in your contact details</h4>
							<div class="form1">
								
								<label for="uname"> <span>Username</span>
									<input type="text" name="uname" id="uname" required>
								</label>
								
								<label for="email3"> <span>email address</span>
									<input type="email" name="email3" id="email3" required>
								</label>
								<label for="lname"> <span>last name</span>
									<input type="text" name="lname" id="lname" required>
								</label>
								<label for="fname"> <span>first name</span>
									<input type="text" name="fname" id="fname" required>
								</label>
								
								
								<label for="address1"> <span>address </span>
									<input type="text" name="address" id="address" required>
								</label>

								<label for="gen"> <span>gender </span>
									<select name="schedule" id="schedule">
										<option value="baiat">male</option>
										<option value="fata">female</option>	
									</select>
								</label>
								<label for="phone"> <span>phone number</span>
									<input type="tel" pattern="[0-9]7[0-9]{8}" name="phone" id="phone" required>
								</label>
								
								<label for="passr"> <span>Password</span>
									<input type="password" name="passr" id="passr" required>
								</label>
								<label for="passr2"> <span>Confirm your password</span>
									<input type="password" name="passr2" id="passr2" required>
								</label>



								<label > <span>register</span>
								<button type="submit"> ok </button>
							</label>
							<?php  if($_COOKIE['error_state']==="USER_TAKEN"){
							echo "The username is already in use";
							setcookie("error_state","NO_PROBLEM",time()+(86400*100));}
							else if($_COOKIE['error_state']==="PASS_DOESNT_MATCH"){
							echo "The passwords must match";
							setcookie("error_state","NO_PROBLEM",time()+(86400*100));
							} ?>

								
							</div>	
						</form>
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
		</html>