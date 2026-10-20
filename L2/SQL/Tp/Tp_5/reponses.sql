/* Exo 1 : 
    SELECT ind.nom, ind.prenom, COUNT(lead.id_cd) AS nombre_CD
    FROM leader lead
    JOIN individu ind ON lead.id_musicien = ind.id_ind
    GROUP BY ind.id_ind, ind.nom, ind.prenom
    ORDER BY ind.id_ind;
    */

/* Exo 2 : 
    WITH CTE_Number_CD AS (
        SELECT id_musicien, COUNT(id_cd) AS nbr_cd
        FROM leader
        GROUP BY id_musicien
    )
    SELECT ind.nom, ind.prenom, nbr.nbr_cd
    FROM CTE_Number_CD nbr
    JOIN individu ind ON nbr.id_musicien = ind.id_ind
    WHERE nbr.nbr_cd > (
        SELECT AVG(nbr_cd)
        FROM CTE_Number_CD
    )
    ORDER BY ind.id_ind;
    */

/* Exo 3 :
    WITH CTE_Number_enr AS (
        SELECT enr.annee_enr, COUNT(enr.id_enr) AS nbr_enr
        FROM enreg enr
        GROUP BY enr.annee_enr
    )
    SELECT nbr.annee_enr, nbr.nbr_enr
    FROM CTE_Number_enr nbr
    WHERE nbr.nbr_enr >= ALL(
        SELECT MAX(nbr_enr)
        FROM CTE_Number_enr
    )
    ORDER BY nbr.annee_enr;
    */

/* Exo 4 :
    SELECT DISTINCT indiv.id_ind, indiv.nom, indiv.prenom
    FROM individu indiv
    JOIN compo ON compo.id_musicien = indiv.id_ind
    JOIN interp ON interp.id_musicien = indiv.id_ind
    */

/* Exo 5 :
    WITH CTE_Number_music AS(
        SELECT id_cd, COUNT(titre_cd) AS nbr_music
        FROM CD
        JOIN enreg USING(id_cd)
        GROUP BY id_cd
    )
    SELECT co.id_cd, co.id_musicien, COUNT(co.id_enr)
    FROM CTE_Number_music cte
    JOIN compo co USING(id_cd)
    GROUP BY co.id_cd, cte.id_cd, co.id_musicien, cte.nbr_music
    HAVING cte.id_cd = co.id_cd
    AND COUNT(co.id_enr) = cte.nbr_music
    ORDER BY co.id_cd, co.id_musicien;
    */

/* Exo 6 : 
    SELECT id_ind, nom, prenom
    FROM individu
    WHERE id_ind NOT IN (
        SELECT c.id_musicien
        FROM enreg e
        JOIN interp i
            ON e.id_cd = i.id_cd
            AND e.id_enr = i.id_enr
        JOIN compo c
            ON e.id_cd = c.id_cd
            AND e.id_enr = c.id_enr
        WHERE c.id_musicien = i.id_musicien
    )
    */

/* Exo 7 : 
    WITH CTE_Presence AS (
        SELECT DISTINCT id_cd, id_enr, id_musicien
        FROM interp
    ),
    CTE_Paires AS (
        SELECT
            p1.id_musicien AS musicien1,
            p2.id_musicien AS musicien2,
            COUNT(*)       AS nb_morceaux
        FROM CTE_Presence p1
        JOIN CTE_Presence p2
            ON  p1.id_cd  = p2.id_cd
            AND p1.id_enr = p2.id_enr
            AND p1.id_musicien < p2.id_musicien
        GROUP BY p1.id_musicien, p2.id_musicien
    )
    SELECT
        i1.nom      AS nom1,
        i1.prenom   AS prenom1,
        i2.nom      AS nom2,
        i2.prenom   AS prenom2,
        p.nb_morceaux
    FROM CTE_Paires p
    JOIN individu i1 ON i1.id_ind = p.musicien1
    JOIN individu i2 ON i2.id_ind = p.musicien2
    WHERE p.nb_morceaux = (
        SELECT MAX(nb_morceaux)
        FROM CTE_Paires
    )
    ORDER BY nom1, nom2;
    */

/* Exo 8 :
    SELECT e.titre_enr, e.annee_enr, i.nom, i.prenom, i.date_deces
    FROM enreg e
    JOIN compo c
        ON e.id_cd = c.id_cd
        AND e.id_enr = c.id_enr
    JOIN individu i 
        ON c.id_musicien = i.id_ind
    WHERE e.annee_enr > EXTRACT(YEAR FROM i.date_deces)
    */

/* Exo 9 : 
    SELECT DISTINCT ind.nom, ind.prenom
    FROM individu ind
    JOIN leader l ON ind.id_ind = l.id_musicien
    JOIN interp i ON ind.id_ind = i.id_musicien
    JOIN compo c ON ind.id_ind = c.id_musicien
    WHERE ('2026-10-18' - ind.date_nais) / 365 < '30'
    */

/* Exo 10 :
    WITH disques_interpretes AS (
        SELECT id_musicien, COUNT(DISTINCT id_cd) AS nb
        FROM interp
        GROUP BY id_musicien
    ),
    disques_avec_compo_jouee AS (
        SELECT c.id_musicien, COUNT(DISTINCT c.id_cd) AS nb
        FROM compo c
        JOIN interp ip USING (id_cd, id_enr, id_musicien)
        GROUP BY c.id_musicien
    )
    SELECT i.nom, i.prenom
    FROM disques_interpretes d
    JOIN disques_avec_compo_jouee c ON c.id_musicien = d.id_musicien AND c.nb = d.nb
    JOIN individu i ON i.id_ind = d.id_musicien;
    */