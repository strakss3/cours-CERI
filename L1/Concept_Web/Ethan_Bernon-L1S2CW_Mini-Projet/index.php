<!DOCTYPE HTML>
<HTML>
<HEAD>
	<title>Menj Ben La</title>
	<link rel="icon" type="image/x-icon" href="logo.png">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/5/w3.css">
	<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-green.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
	
	<link href="https://fonts.googleapis.com/css2?family=Philosopher&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Red+Rose&display=swap" rel="stylesheet">

	<style>
		body {
			min-height: 100vh;
			display: flex;
			flex-direction: column;
		}
		
		p, h1, h2, h3, div, span {

			font-family: "Philosopher", sans-serif;
		}

		a, button, select, option {

			font-family: "Red Rose", sans-serif;
		}

		main {
			
			flex:1;
		}
	</style>

    <script>
        function menuOpen() {

            document.getElementById("sidebar").style.display = "block";
        }

        function menuClose() {

            document.getElementById("sidebar").style.display = "none";
        }
    </script>
</HEAD>
<BODY>
	<header class="w3-header w3-theme w3-center w3-padding">
        <button class="w3-button w3-xlarge w3-left w3-circle w3-theme-action" onclick="menuOpen()">☰</button>
        <img src="./logo.png" width="70px" class="w3-right">
		<h1>╘══╣ <span class="w3-bold">Menj Ben La</span> ╠══╕</h1>
	</header>
    <nav class="w3-sidebar w3-bar-block w3-border-right w3-animate-left" style="display:none" id="sidebar">
        <button onclick="menuClose()" class="w3-bar-item w3-large">Close &times;</button>
		<a href="index.php?page=init" class="w3-bar-item w3-button">Accueil</a>
		<a href="index.php?page=critiques" class="w3-bar-item w3-button">Voir les critiques</a>
		<a href="index.php?page=editcritique" class="w3-bar-item w3-button">Ajouter une critique</a>
    </nav>
	<main>
		<?php
			$page = $_GET["page"] ?? 'init';
			if ($page === "init") {

				include "init.php";
			}
			else if ($page === "critiques") {

				include "critiques.php";
			}
			else if ($page === "editcritique") {

				include "editcritique.php";
			}
		?>
	</main>
    <footer class="w3-footer w3-theme w3-padding">
		<p>
			<a href="https://youtube.com" class="w3-right w3-xxlarge"><i class="fa fa-fw fa-youtube-play w3-hover-opacity"></i></a>
			<a href="https://www.google.com/maps" class="w3-right w3-xxlarge"><i class="fa fa-fw fa-map-marker w3-hover-opacity"></i></a>
			<a href="https://fr.trustpilot.com/" class="w3-right w3-xxlarge"><i class="fa fa-fw fa-star w3-hover-opacity"></i></a>
			&copy; 2026 Menj Ben La. Not All Rights Reserved.<br>
			Nous contacter : 06 06 06 06 06<br>
			Site réalisé par : <abbr title="uapv2601474">Ethan Bernon</abbr>
		</p>
		
    </footer>
</BODY>
</HTML>
