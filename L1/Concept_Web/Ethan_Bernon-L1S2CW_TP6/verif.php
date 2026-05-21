<!DOCTYPE HTML>
<HTML>
<HEAD>
    <title>Tp PHP</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/5/w3.css">
	<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-teal.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
</HEAD>
<BODY>
    <header class="w3-header w3-theme w3-center w3-padding">
		<h1>Bienvenue dans le site</h1>
	</header>
	<main class="w3-card w3-content w3-margin-top w3-margin-bottom">
		<div class="w3-container w3-theme w3-margin-bottom">
			<h2>Formulaire d'inscription</h2>	
		</div>
		<form method="post" action="verif.php" class="w3-container">
            <?php
                echo "<label for='prenom' class='w3-text-theme'>Prenom<span class='w3-text-grey'>*</span> :</label><br>";
                if (isset($_POST["prenom"])) {
                    
                    $prenom = $_POST["prenom"];
                    echo "<input class='w3-input' type='text' name='prenom' value ='$prenom' id='prenom' required>";
                }
                else {
                    
                    echo "<input class='w3-input' type='text' name='prenom' id='prenom' required>";
                }
            ?><br>

            <?php 
                echo '<label for="nom" class="w3-text-theme">Nom<span class="w3-text-grey">*</span> :</label><br>';
                if (isset($_POST["nom"])) {

                    $nom = $_POST["nom"];
                    echo "<input class='w3-input' type='text' name='nom' value='$nom' id='nom' required>";
                }
                else {
                    
                    echo "<input class='w3-input' type='text' name='nom' id='nom' required>";
                }
            ?><br>

            <?php
                if (isset($_POST["age"])) {
                    
                    $age = $_POST["age"];
                    if ($_POST["age"] < 0 || $_POST["age"] > 150) {
                        
                        echo "<label for='age' class='w3-text-red'>Age :</label><br>";
                    }
                    else {
                        
                        echo "<label for='age' class='w3-text-theme'>Age :</label><br>";
                    }
                    echo "<input class='w3-input' type='number' name='age' value='$age' id='age' min='1' max='150'>";
                }
                else {
                    
                    echo "<label for='age' class='w3-text-theme'>Age :</label><br>";
                    echo "<input class='w3-input' type='number' name='age' id='age' min='1' max='150'>";
                }
                
            ?><br><br>
			
			<details>
            <?php
                if (isset($_POST["genre"])) {
                    
                    $genre = $_POST["genre"];
                    print_r($genre);
                    echo "<summary class='w3-text-theme'>Genre :</summary>";
                    echo "<input type='radio' name='genre' value='homme' id='homme' ";
                    if ($genre == "homme") {

                        echo "checked";
                    }
                    echo ">";
                    echo "<label for='homme'> Homme</label>";
                    echo "<br>";
                    echo "<input type='radio' name='genre' value='femme' id='femme' ";
                    if ($genre == "femme") {

                        echo "checked";
                    }
                    echo ">";
                    echo "<label for='femme'> Femme</label>";
                    echo "<br>";
                    echo "<input type='radio' name='genre' value='autre' id='autre' ";
                    if ($genre == "autre") {

                        echo "checked";
                    }
                    echo ">";
                    echo "<label for='autre'> Autre</label>";
                }
                else {

                    echo "<summary class='w3-text-theme'>Genre :</summary>";
                    echo "<input type='radio' name='genre' value='homme' id='homme'>";
                    echo "<label for='homme'> Homme</label>";
                    echo "<br>";
                    echo "<input type='radio' name='genre' value='femme' id='femme'>";
                    echo "<label for='femme'> Femme</label>";
                    echo "<br>";
                    echo "<input type='radio' name='genre' value='autre' id='autre'>";
                    echo "<label for='autre'> Autre</label>";
                }
            ?>
			</details><br>
			
			<details class='w3-margin-bottom'>
				<summary class='w3-text-theme'>Pratiques sportives :</summary>
				
				<div class='w3-half'>
                    <?php
                        echo "<input type='checkbox' name='sports[]' id='sport1' value='Bossaball' ";
                        if (isset($_POST["sports"]) && in_array("Bossaball" ,$_POST["sports"])) {

                            echo "checked";
                        }
                        echo ">";
                    ?>
					<label for='sport1'>Bossaball</label>
					<br>
                    <?php
                        echo "<input type='checkbox' name='sports[]' id='sport2' value='Chessboxing' ";
                        if (isset($_POST["sports"]) && in_array("Chessboxing" ,$_POST["sports"])) {

                            echo "checked";
                        }
                        echo ">";
                    ?>
					<label for='sport2'>Chessboxing</label>
					<br>
                    <?php
                        echo "<input type='checkbox' name='sports[]' id='sport3' value='Kabaddi' ";
                        if (isset($_POST["sports"]) && in_array("Kabaddi" ,$_POST["sports"])) {

                            echo "checked";
                        }
                        echo ">";
                    ?>
					<label for='sport3'>Kabaddi</label>
				</div>
				<div>
                    <?php
                        echo "<input type='checkbox' name='sports[]' id='sport4' value='Quidditch Moldu' ";
                        if (isset($_POST["sports"]) && in_array("Quidditch Moldu" ,$_POST["sports"])) {

                            echo "checked";
                        }
                        echo ">";
                    ?>
					<label for='sport4'>Quidditch Moldu</label>
					<br>
                    <?php
                        echo "<input type='checkbox' name='sports[]' id='sport5' value='Bubble Football' ";
                        if (isset($_POST["sports"]) && in_array("Bubble Football" ,$_POST["sports"])) {

                            echo "checked";
                        }
                        echo ">";
                    ?>
					<label for='sport5'>Bubble Football</label>
					<br>
                    <?php
                        echo "<input type='checkbox' name='sports[]' id='sport6' value='Hurling' ";
                        if (isset($_POST["sports"]) && in_array("Hurling" ,$_POST["sports"])) {

                            echo "checked";
                        }
                        echo ">";
                    ?>
					<label for='sport6'>Hurling</label>
					<br>
                    <?php
                        echo "<input type='checkbox' name='sports[]' id='sport7' value='Autre' ";
                        if (isset($_POST["sports"]) && in_array("Autre" ,$_POST["sports"])) {

                            echo "checked";
                        }
                        echo ">";
                    ?>
					<label for='sport7'>Autre</label>
				</div>
			</details>
			
			<label class='w3-text-theme'>Activite principale :</label><br>
			<select class='w3-select' name='activite'>
                <?php
                    echo "<option value='Etudiant' ";
                    if (isset($_POST["activite"]) && $_POST["activite"] == "Etudiant") {
                        echo "selected";
                    }
                    echo "> Etudiant</option>";
                ?>
                <?php
                    echo "<option value='Travailleur' ";
                    if (isset($_POST["activite"]) && $_POST["activite"] == "Travailleur") {
                        echo "selected";
                    }
                    echo "> Travailleur</option>";
                ?>
                <?php
                    echo "<option value='Retraite' ";
                    if (isset($_POST["activite"]) && $_POST["activite"] == "Retraite") {
                        echo "selected";
                    }
                    echo "> Retraite</option>";
                ?>
                <?php
                    echo "<option value='Sans Emploi' ";
                    if (isset($_POST["activite"]) && $_POST["activite"] == "Sans Emploi") {
                        echo "selected";
                    }
                    echo "> Sans Emploi</option>";
                ?>
			</select><br><br>
			
			<label class='w3-text-theme'>Moyens de transports :</label><br>
			<select class='w3-select' name='transport' multiple size='6'>
                <?php
                    echo "<option value='Concorde' ";
                    if (isset($_POST["transport"]) && $_POST["transport"] == "Concorde") {
                        echo "selected";
                    }
                    echo "> Concorde</option>";
                ?>
                <?php
                    echo "<option value='Brouette' ";
                    if (isset($_POST["transport"]) && $_POST["transport"] == "Brouette") {
                        echo "selected";
                    }
                    echo "> Brouette</option>";
                ?>
                <?php
                    echo "<option value='DeLorean' ";
                    if (isset($_POST["transport"]) && $_POST["transport"] == "DeLorean") {
                        echo "selected";
                    }
                    echo "> DeLorean</option>";
                ?>
                <?php
                    echo "<option value='Cloche pied' ";
                    if (isset($_POST["transport"]) && $_POST["transport"] == "Cloche pied") {
                        echo "selected";
                    }
                    echo "> Cloche pied</option>";
                ?>
                <?php
                    echo "<option value='TARDIS' ";
                    if (isset($_POST["transport"]) && $_POST["transport"] == "TARDIS") {
                        echo "selected";
                    }
                    echo "> TARDIS</option>";
                ?>
                <?php
                    echo "<option value='Nimbus 2000' ";
                    if (isset($_POST["transport"]) && $_POST["transport"] == "Nimbus 2000") {
                        echo "selected";
                    }
                    echo "> Nimbus 2000</option>";
                ?>
			</select><br><br><br>
			
            <?php
                if(isset($_POST["email"])) {

                    $email = $_POST["email"];
                    if (preg_match("/^[^@]+@alumni.univ-avignon.fr$/", $email)) {
        
                        echo "<label for='email' class='w3-text-theme'>Email :</label><br>";
                    }
                    else {

                        echo "<label for='email' class='w3-text-red'>Email :</label><br>";
                    }

                    echo "<input class='w3-input' type='email' name='email' value='$email' placeholder='prenom.nom@alumni.univ-avignon.fr' id='email'>";
                }
                else {
                    
                    echo "<label for='email' class='w3-text-theme'>Email :</label><br>";
                    echo "<input class='w3-input' type='email' name='email' placeholder='prenom.nom@alumni.univ-avignon.fr' id='email'>";
                }
            ?><br>

            <?php
                $couleur_mdp = "w3-text-theme";
                if (isset($_POST["mdp1"]) && isset($_POST["mdp2"]) && $_POST["mdp1"] != $_POST["mdp2"]) {

                    $couleur_mdp = "w3-text-red";
                }
                echo "<label for='mdp1' class='$couleur_mdp'>Mot de passe :</label><br>";
                if (isset($_POST["mdp1"])) {

                    $mdp1 = $_POST["mdp1"];
                    echo "<input class='w3-input' type='password' name='mdp1' id='mdp1' value='$mdp1'>";
                }
                else {

                    echo "<input class='w3-input' type='password' name='mdp1' id='mdp1'>";
                }
                echo "<br>";
                echo "<label for='mdp2' class='$couleur_mdp'>Confirmation du mot de passe :</label><br>";

                if (isset($_POST["mdp2"])) {

                    $mdp2 = $_POST["mdp2"];
                    echo "<input class='w3-input' type='password' name='mdp2' id='mdp2' value='$mdp2'>";
                }
                else {

                    echo "<input class='w3-input' type='password' name='mdp2' id='mdp2'>";
                }
            ?><br>

			<br><br>
			
			<label for='info' class='w3-text-theme'>Autres informations :</label><br>
			<textarea class='w3-input' name='info' id='info' row='3'></textarea>
			<br><br>
			<input class='w3-button w3-theme w3-round w3-margin-bottom' type='submit'>
			<input class='w3-button w3-theme w3-round w3-margin-bottom' type='reset'>
		</form>
	</main>
    <footer class='w3-footer w3-container w3-center'>
        <p>
            <?php
                if (!isset($_POST["nom"]) || !isset($_POST["age"]) || !isset($_POST["email"]) || !isset($_POST["mdp1"]) || !isset($_POST["mdp2"])) {

                    exit("Erreur : Informations manquantes.");
                }
                if ($_POST["age"] != "") {
                    
                    if ($_POST["age"] < 0) {
        
                        exit("Erreur : L'age doit être positif.");
                    }
                    if ($_POST["age"] > 150) {
        
                        exit("Erreur : L'age doit être inférieur à 150 ans.");
                    }
                }
                if ($_POST["email"] != "") {

                    if (! preg_match("/^[^@]+@alumni.univ-avignon.fr$/", $_POST["email"])) {
        
                        exit("Erreur : Le mail n'est pas de la forme \"xxx@alumni.univ-avignon.fr\".");
                    }
                }
                if ($_POST["mdp1"] != "" && $_POST["mdp1"] != "") {

                    if ($_POST["mdp1"] != $_POST["mdp2"]) {
        
                        exit("Erreur : Les deux mots de passes ne sont pas identiques.");
                    }
                }
            ?>

            Bienvenue 
            <?php
                if (isset($_POST["genre"])) {
                    
                    if ($_POST["genre"] == "homme") {
        
                        echo "monsieur";
                    }
                    else if ($_POST["genre"] == "femme") {
        
                        echo "madame";
                    }
                }
            ?>
            <?php echo $_POST["prenom"]?>
            <?php echo $_POST["nom"]?>.
            <?php
                if ($_POST["age"] != "") {
                    
                    echo "<br>\n";
                    echo "Votre age est de";
                    echo $_POST["age"];
                    echo " ans.";
                }
            ?><br>
            Vous êtes <?php echo $_POST["activite"]?>.
            <?php
                if (!empty($_POST["sports"])) {

                    echo "<br>\n";
                    echo "Vous pratiquez ";
                    foreach($_POST["sports"] as $sport) {
        
                        echo "le $sport, ";
                    };
                }
            ?>
            <?php
                if(isset($_POST["transport"])) {

                    echo "<br>\n";
                    echo "Vous préférez vous déplacer en ";
                    echo $_POST["transport"];
                }
            ?>
            <?php 
                if ($_POST["info"] != "") {

                    echo "<br>\n";
                    echo "Nous avons bien noté votre commentaire : ";
                    echo $_POST["info"];
                }
            ?>
            <?php 
                if ($_POST["email"] != "") {
                    
                    echo "<br>\n";
                    echo "Votre identifiant est : ";
                    echo $_POST["email"];
                }
            ?>
            <?php 
                if ($_POST["mdp1"] != "" && $_POST["mdp2"] != "") {
                    
                    echo "<br>\n";
                    echo "Votre mot de passe est : ";
                    echo $_POST["mdp1"];
                }
            ?>
        </p>
</footer>
</BODY>
</HTML>