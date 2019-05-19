<!DOCTYPE HTML>

<html>
<head>
	<meta charset="UTF-8">
	<title>books</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	
</head>
<body>
	<div id="header">
		<div>
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
					<a href="contact.php">contact</a>
				</li>
				<li class="booking">
					<a href="booking.php">Contul meu</a>
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
							<a href="index.php">home</a>
						</li>
						<li>
							<a href="services.php">books</a>
						</li>
						
					</ul>
				</div>
				<div class="services">
				<h1><?php if($_COOKIE['is_logged']==="LOGGED")echo "Welcome, ".$_COOKIE['user'];  ?></h1>
					<h2>Books</h2>
					<ul>
						<li>
							<a href="books/drama.php" class="figure"><img src="images/drinking.jpg" alt=""></a>
							<div>
								<h3>drama</h3>
								<p>
										drama drama drama. 
								</p>
							</div>
						</li>
						<li>
							<a href="books/fiction.php" class="figure"><img src="images/navigator.jpg" alt=""></a>
							<div>
								<h3>fiction</h3>
								<p>
										fiction fiction fiction
								</p>
							</div>
						</li>
						<li>
							<a href="books/horror.php" class="figure"><img src="images/tool-box.jpg" alt=""></a>
							<div>
								<h3>horror</h3>
								<p>
										horror horror horror
								</p>
							</div>
						</li>

						<li>
							<a href="books/romance.php" class="figure"><img src="images/roti.jpg" alt=""></a>
							<div>
								<h3>romance</h3>
								<p>									
										romance romance romance romance
								</p>
							</div>
						</li>

						<li>
							<a href="books/jurnal.php" class="figure"><img src="images/frane.jpg" alt=""></a>
							<div>
								<h3>jurnal</h3>
								<p>									
										jurnal jurnal jurnal jurnal
								</p>
							</div>
						</li>

						<li>
					     	<a href="books/poetry.php" class="figure"><img src="images/transmisie.jpg" alt=""></a>
							<div>
								<h3>poetry</h3>
								<p>									
										poetry poetry poetry poetry
								</p>
							</div>
						</li>

						<li>
							<a href="books/alte.php" class="figure"><img src="images/diverse.jpg" alt=""></a>
							<div>
								<h3>altele</h3>
								<p>									
									Tot felul de carti.
								</p>
							</div>
						</li>

					</ul>
				</div>
			</div>
			<div class="sidebar">
				<div class="navigation">
					<h3>Books //</h3>
					<ul>
						<li class="selected">
							<a href="books/drama.php">drama</a>
						</li>
						<li>
							<a href="books/fiction.php">fiction</a>
						</li>
						<li>
							<a href="books/horror.php">horror</a>
						</li>
						<li>
							<a href="books/romance.php">romance</a>
						</li>
						<li>
							<a href="books/jurnal.php">jurnal</a>
						</li>
						<li>
							<a href="books/poetry.php">poetry</a>
						</li>
						<li>
							<a href="books/alte.php">altele</a>
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
</html>