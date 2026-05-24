<?php
    if (isset($_GET["supprimer"])) {
        $id = $_GET["supprimer"];
        $lignes = file("data.txt", FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        $lignes = array_filter($lignes, function($ligne) use ($id) {
            list($idLigne) = explode("|", $ligne);
            return $idLigne != $id;
        });
        
        $file = fopen("data.txt", "w");
        foreach ($lignes as $ligne) {
            
            fwrite($file, $ligne."\n");
        }
        fclose($file);
    }
?>

<script>
    function filtreNote() {

        let note = document.getElementById("filtre").value;

        for(let i = 1 ; i < 5 ; i++) {

            let list = document.getElementsByClassName("note"+i);

            for(let j = 0 ; j < list.length ; j++) {

                if (note == i || note == 0) {
                    
                    list[j].style.display = "flex";
                }
                else {
                    
                    list[j].style.display = "none";
                }
            }
        }
    }
</script>

<div class="w3-card w3-content w3-margin-top w3-margin-bottom w3-round-xlarge w3-animate-opacity">
    <div class="w3-container w3-theme-d3 w3-margin-bottom w3-round-xlarge">
        <h2>
            <select class="w3-right w3-button w3-round-large" id="filtre">
                <option value="" disabled selected>
                    Filtrer les critiques
                </option>
                <option value="0" onClick="filtreNote()">
                    Toutes
                </option>        
                <option value="4" onClick="filtreNote()">
                    &#9733;&#9733;&#9733;&#9733;
                </option>
                <option value="3" onClick="filtreNote()">
                    &#9733;&#9733;&#9733;&#9734;
                </option>
                <option value="2" onClick="filtreNote()">
                    &#9733;&#9733;&#9734;&#9734;
                </option>
                <option value="1" onClick="filtreNote()">
                    &#9733;&#9734;&#9734;&#9734;
                </option>
            </select>
        </h2>
        <h2>Les critiques</h2>
    </div>
    
    <div class="w3-row" style="display:flex; flex-wrap:wrap; align-items:stretch;">
        <?php
            $file = fopen("data.txt", "r");
            while (!feof($file)) {
                $ligne = fgets($file);
                if ($ligne == "" ||$ligne == "\n") {
                    
                    continue;
                }
                list($id, $nom, $date, $type, $note, $info) = explode("|", $ligne);
        ?>
        <div class="w3-padding w3-third note<?php echo $note?>" style="display:flex">
            <div class="w3-padding w3-round-large w3-card" style="width:100%; display:flex; flex-direction:column;">
                <div class="w3-center w3-bold w3-theme-l3 w3-round-large w3-margin-bottom">
                    <?php echo $nom?>
                </div>
                <div class="w3-center">
                    <span class="w3-left w3-opacity"><i class="fa fa-calendar"></i> <?php echo $date?></span>
                    <?php
                        for($i = 1 ; $i < 5 ; $i++) {

                            if ($i <= $note) {

                                echo "<i class='fa fa-star w3-text-theme'></i>";
                            }
                            else {

                                echo "<i class='fa fa-star-o w3-text-gray'></i>";
                            }
                        }
                    ?>
                    <?php
                        if ($type == "restaurant") {

                            echo "<span class='w3-right w3-opacity'><i class='fa fa-cutlery'></i> $type</span>";
                        }
                        else {
                            
                            echo "<span class='w3-right w3-opacity'><i class='fa fa-beer'></i> $type</span>";
                        }
                    ?>
                </div>
                <hr>
                <i><?php echo $info?></i>
                <hr>
                <div style="margin-top:auto">
                    <a class='w3-button w3-theme-action w3-round w3-margin-bottom w3-small' href='index.php?page=editcritique&id=<?php echo $id?>'><i class="fa fa-pencil w3-margin-right"></i>Modifier</a>
                    <a class='w3-button w3-red w3-round w3-margin-bottom w3-small' href='index.php?page=critiques&supprimer=<?php echo $id?>' onClick='return confirm("Voulez vous vraiment supprimer cette critique ?")'><i class="fa fa-times w3-margin-right"></i>Supprimer</a>
                </div>
            </div>
        </div>
        <?php
        }
        fclose($file);
        ?>
    </div>
</div>