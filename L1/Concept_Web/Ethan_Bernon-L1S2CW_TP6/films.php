<?php
    function h($var) {

        return htmlspecialchars($var, ENT_QUOTES, "UTF-8");
    }

    $file = fopen("films.txt","r");

    while(($line = fgets($file)) !== false) {
        
        $line = trim($line);        
        $champs = explode('|', $line);
        $array[] = $champs;
    }

    fclose($file);

    $submitted = $_SERVER['REQUEST_METHOD'] === "POST";
?>

<HTML>
<HEAD>
    <title>Tp </title>
</HEAD>
<BODY>
    <?php if($submitted): ?>
    <table>
        <tr>
            <th>Titre</th>
            <th>Realisateur</th>
            <th>Genre</th>
            <th>Date de Sortie</th>
            <th>Duree</th>
        </tr>
        <?php
            foreach($array as $film) {

                if($film[0] === $_POST["films"]) {

                    for ($i = 0 ; $i < 5 ; $i++) {

                        $info = h($film[$i]);
                        echo "<td>"; 
                        echo "$info";
                        echo "</td>";
                    }  
                }
            }
        ?>
        </tr>
    </table>

    <?php else: ?>

    <form method="post" action="films.php">

        <label for="films"> Selectionnez un film </label> <br>
        <select id="films" name="films">
        <?php
            foreach ($array as $film) {

                echo '<option value="' . h($film[0]) . '">' . htmlspecialchars($film[0]) . '</option>';
                echo "<option ";
                echo "value=''";
            }
        ?>
        </select>
        <input type="submit" value="Afficher les données du film">
    </form>

    <?php endif; ?>
</BODY>
</HTML>
