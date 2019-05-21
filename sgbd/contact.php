<!DOCTYPE HTML>
<apex:page  applyHtmlTag="false">

<html>
<head>
	<meta charset="UTF-8">
	<title>imprumuturi</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	
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
					<a href="booking.php">Contul meu</a>
				</li>
			</ul>
		</div>
	</div>
	<div id="body">
		<div class="content">
			<div class="section">
				<div class="contact">
					<h2>imprumuturile mele</h2>
					<table class="table">
  <tr >
    <th>Book ID</th>
    <th>Book Name</th> 
	<th>Date loan</th>
	<th>Date return</th>
  </tr>
  <tr>
    <td>tatata</td>
    <td>Smith</td>
	<td>12.02.2017</td>
	<td>22.02.2017</td>
  </tr>
  <tr>
  <td>Jill</td>
    <td>Smith</td>
	<td>12.02.2017</td>
	<td>22.02.2017</td>
  </tr>
  <tr>
  <td>Jill</td>
    <td>Smith</td>
	<td>12.02.2017</td>
	<td>22.02.2017</td>
  </tr>
</table>
					
				</div>
			</div>
			<div class="sidebar">
				<div class="contact">
					<div>
						<a ><img src="images/lava2.jpg" alt=""></a>
					</div>
					
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