<!DOCTYPE HTML>
<HTML>
<HEAD>
    <title>Tp PHP</title>
</HEAD>
<BODY>
    <p>
        <?php 
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
        Vous préférez vous déplacer en <?php echo $_POST["transport"]?>.
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
</BODY>
</HTML>