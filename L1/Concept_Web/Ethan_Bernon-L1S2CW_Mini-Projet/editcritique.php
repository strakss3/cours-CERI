<?php
    if (isset($_GET["id"])) {

        $id = $_GET["id"];
        $file = fopen("data.txt", "r");
        while(!feof($file)) {
            
            $line = fgets($file);
            $array_line = explode("|", $line);
            if($array_line[0] == $id) {

                $nom = $array_line[1];
                $date =  $array_line[2];
                $type =  $array_line[3];
                $note =  $array_line[4];
                $texte =  $array_line[5];
                break;
            }
        }
    }
    else {
        
        $id = $note = 0;
        $nom = $date = $type = $texte = "";
        $file = fopen("data.txt", "r");
        while(!feof($file)) {
            
            $line = fgets($file);
            $id_test = explode("|", $line);
            $id = max($id,$id_test[0]);
        }
        $id += 1;
        fclose($file);
    }
?>

<script>
    window.onload = function() {

        updateNote();
    }

    function checkNom() {

        let nom = document.getElementById("nom").value;
        if (nom === "") {

            alert("Veuiller entrer le nom du restaurant");
            return false;
        }
        if (nom.includes("|")) {

            alert("Les champs ne peuvent pas contenir de caractère |");
            return false;
        }
        return true;
    }

    function checkDate() {

        let date = document.getElementById("date").value;
        if (date === "") {

            alert("Veuiller entrer l'année de visite");
            return false;
        }
        if (date < 1900) {

            alert("La date ne peux pas être anterieur à 1900");
            return false;
        }
        if (date > <?= date("Y")?>) {

            alert("La date ne peut pas être au delà de <?= date("Y")?>");
            return false;
        }
        return true;
    }

    function checkType() {

        let type = document.getElementById("type").value;
        if (type === "") {

            alert("Veuiller choisir le type du lieu");
            return false;
        }
        return true;
    }

    function checkNote() {

        let note = document.querySelector('input[name="note"]:checked');
        if(!note || note.value == 0) {

            alert("Veuiller entrer une note entre 1 et 4 étoiles");
            return false;
        }
        return true;
    }

    function checkTexte() {

        let texte = document.getElementById("texte").value;
        console.log(texte);
        if (texte === "") {

            alert("Veuiller écrire le texte de la critique");
            return false;
        }
        if (texte.includes("|")) {

            console.log(texte);
            return false;
        }
        return true;
    }

    function checkChamp() {

        if(!checkNom() || !checkDate() || !checkType() || !checkNote() || !checkTexte()) {

            return false;
        }
        let nom = document.getElementById("nom").value;
        let type = document.getElementById("type").value;
        alert(`La critique du ${type} "${nom}" a bien été ajouté`);
        return true;
    }

    function effacerForm() {
        document.getElementById("nom").value = "";
        document.getElementById("date").value = "";
        document.getElementById("type").value = "";

        let checked = document.querySelector('input[name="note"]:checked');
        if (checked) checked.checked = false;
        for(let i = 1 ; i < 5 ; i++) {

            document.getElementById("note"+i).checked = false;
            document.getElementById("etoile"+i).classList.replace("fa-star", "fa-star-o");
        }

        document.getElementById("texte").value = "";
    }

    function updateNote() {
        let checked = document.querySelector('input[name="note"]:checked');
        if (!checked) {
            
            return;
        }

        let full = true
        for(let i = 1 ; i < 5 ; i++) {

            let etoile = document.getElementById("etoile"+i);
            let note = document.getElementById("note"+i);
            
            if (full) {
                
                etoile.classList.replace("fa-star-o", "fa-star");
            }
            else {
                
                etoile.classList.replace("fa-star", "fa-star-o");
            }
            if(note.checked) {

                full = false;
            }
        }
    }
</script>

<div class='w3-card w3-content w3-margin-top w3-margin-bottom w3-round-xlarge w3-animate-opacity'>
    <div class='w3-card w3-container w3-theme-d3 w3-margin-bottom w3-round-xlarge'>
        <h4 class="w3-right w3-card">
            <span class="w3-tag w3-theme-l3 w3-border-top w3-round-large">
                ID - <?php echo $id?>
            </span>
        </h4>
        <h2>Création de la critique :</h2>
    </div>
    <form method='post' onsubmit='return checkChamp()' class='w3-container'>
        <input type="hidden" name="id" value="<?php echo $id?>">

        <label for='nom' class='w3-text-theme'><i class="fa fa-bookmark-o fa-fw w3-margin-right w3-text-theme"></i>Nom du restaurant :</label><br>
        <input class='w3-input' type='text' name='nom' value='<?php echo $nom?>' id='nom'>
        <br>

        <label for='date' class='w3-text-theme '><i class="fa fa-calendar-o fa-fw w3-margin-right w3-text-theme"></i>Année de visite :</label><br>
        <input class='w3-input' type='number' name='date' value='<?php echo $date?>' id='date'>
        <br>
        
        <label class='w3-text-theme '><i class="fa fa-map-o fa-fw w3-margin-right w3-text-theme"></i>Type de l'établissement :</label><br>
        <select class='w3-select' name='type' id='type' multiple size='2'>
            <option value='restaurant' <?php if ($type == "restaurant") echo "selected"?>>Restaurant</option>
            <option value='bar' <?php if ($type == "bar") echo "selected"?>>Bar</option>
        </select>
        <br><br>

        <label class='w3-text-theme '><i class="fa fa-heart-o fa-fw w3-margin-right w3-text-theme"></i>Note :</label><br><br>
        <?php
            for($i = 1 ; $i < 5 ; $i++) {
        ?>
        <input type="radio" name="note" id="note<?php echo $i?>" value="<?php echo $i?>" <?php echo $note == $i ? "checked" : ""?> style="display:none" onClick="updateNote()">
        <label for="note<?php echo $i?>" id="etoile<?php echo $i?>" class="fa fa-star-o w3-xlarge w3-text-theme" style="cursor:pointer"></label>
        <?php
            }
        ?>
        <br><br>
        
        <label for='texte' class='w3-text-theme'><i class="fa fa-comment-o fa-fw w3-margin-right w3-text-theme"></i>Texte de la critique :</label>        <textarea class='w3-input' name='texte' id='texte' row='3'><?php echo $texte?></textarea>
        <br><br>

        <button class='w3-button w3-theme-action w3-round w3-margin-bottom' type='submit'><i class="fa fa-send w3-margin-right"></i>Envoyer</button>
        <button class='w3-button w3-red w3-round w3-margin-bottom' type='button' onClick="effacerForm()"><i class="fa fa-times w3-margin-right"></i>Effacer</button>
    </form>
</div>

<?php
    if ($_SERVER["REQUEST_METHOD"] === "POST" && !empty($_POST["nom"])) {

        $nom = $_POST["nom"];
        $date = $_POST["date"];
        $type = $_POST["type"];
        $note = $_POST["note"];
        $texte = $_POST["texte"];
        $id = $_POST["id"];
        
        $line_modified = false;
        $new_line = "$id|$nom|$date|$type|$note|$texte";
        $file = file("data.txt", FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        
        foreach($file as &$line) {

            $current_id = explode("|", $line)[0];
            if ($current_id == $id) {

                $line = $new_line;
                $line_modified = true;
            }
        }
        if (!$line_modified) {

            $file[] = $new_line;
        }

        $new_file = fopen("data.txt", "w");
        foreach ($file as $l) {
            
            fwrite($new_file, $l."\n");
        }
        fclose($new_file);
        echo "<script>window.location.href = 'index.php?page=critiques';</script>";
    }
?>