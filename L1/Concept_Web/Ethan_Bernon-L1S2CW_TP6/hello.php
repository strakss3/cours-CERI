<HTML>
<HEAD>
	<title>Tp PHP</title>
</HEAD>
<BODY>
	<?php echo "Hello word en PHP!"; ?>
	<br><br>
	
	<?php
		$i=6;
		$j=7;
		$r=$i*$j;
		echo "$i x $j = $r";
		echo "<br>";

		$k=$i;
		$i=$j;
		$j=$k;
		$r=$i*$j;
		echo "$i x $j = $r";
		echo "<br><br>";
	?>
	
	<?php 
		$a = "Hello ";
		$b = " année";
		$annee = 1545.2;
		$annee = $annee * 2;
		$msg = $a.$b;
		echo "<h3>$msg $annee !</h3>";
		$annee = $annee + 6*54/7;
		$msg = $msg.$msg.$msg.$msg;
		echo "$annee $msg";
		echo "<br><br>";
	?>
	
	<?php 
		$sec = time()-2*24*60*60;
		$date = date("d-m-Y", $sec);
		echo "Il y a 2 jour, c'était le $date";
		echo "<br><br>";
	?>
	
	<?php
		$sec = time() % 80;
		if ($sec <= 40) {
			echo "<h2 style='color:red'>$sec est entre 0 et 39 secs</h2>";
		}
		else {
			echo "<h2 style='color:blue'>$sec est entre 40 et 79 secs</h2>";
		}
		echo "<br><br>";
		//header("Refresh:1");
	?>
	
	<?php
		$txt = "ceci est un court text qui va changer de couleur";
		for($i = 0 ; $i < 33 ; $i++) {
			if ($i%11 == 0) {
				
				$R = rand(0,255);
				$G = rand(0,255);
				$B = rand(0,255);
			}
			echo "<p style='color:rgb($R,$G,$B)'>$txt</p>";
		}
	?>
	
	<?php
		// Prenom
		$tab_fname[0] = "E";
		$tab_fname[1] = "t";
		$tab_fname[2] = "h";
		$tab_fname[3] = "a";
		$tab_fname[4] = "n";
		print_r($tab_fname);
		echo "<br>\n";
		
		// Nom
		$tab_lname = array("B", "e", "r", "n", "o", "n");
		print_r($tab_lname);
		echo "<br>\n";
	
		// Surnom
		$tab_sname[] = "U";
		$tab_sname[] = "A";
		$tab_sname[] = "P";
		$tab_sname[] = "V";
		$tab_sname[] = "2";
		$tab_sname[] = "6";
		$tab_sname[] = "0";
		$tab_sname[] = "1";
		$tab_sname[] = "4";
		$tab_sname[] = "7";
		$tab_sname[] = "4";
		print_r($tab_sname);
		echo "<br><br>\n";
	?>
	
	<?php
		$url = array(
			"video" => "https://www.youtube.com/",
			"graphic calculator" => "https://www.desmos.com/calculator?lang=fr",
			"DVD logo" => "https://bouncingdvdlogo.com/",
			"" => "",
			"" => "",
			"" => ""
		);
		print_r($url)
	?>
</BODY>
</HTML>
