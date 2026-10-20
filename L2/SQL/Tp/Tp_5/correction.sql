-- 1. Combien chaque leader a t'il dirigé de CD ?
-- chaque leader => group by leader
-- Combien de cd dirigés => count(id-cd) 
-- pas de condition sur les groupes => requête type 4
 

 
  SELECT nom, COUNT(DISTINCT id_cd)
  FROM leader
  JOIN individu on(id_ind=id_musicien)
  GROUP BY individu.id_ind, nom;
  

-- 2. Quels sont les leaders qui ont dirigé plus que la moyenne des leaders ?
-- Je veux les leader qui ont dirigé plus de cd que la moyenne des leaders
-- il faudrait pouvoir calcul la moyenne = AVG(COUNT(cd)) or l'enchainement des fonctions de groupe n'est pas possible en postgreSql
-- Nous allons devoir utiliser une sous-requête qui retourne le nbre de cd dirigés par leader (c'est la question précédente)
-- et sur le résultat de cette requête appliquer la fonction AVG.
-- requete de type 5.2
 

 
SELECT nom
FROM individu
JOIN leader ON id_ind = id_musicien
GROUP BY id_ind, nom
HAVING COUNT(id_cd) > ALL (
    SELECT AVG(C)
    FROM (
        SELECT COUNT(id_cd) AS C
        FROM leader
        GROUP BY id_musicien
    ) AS A
);

-- 3. En quelle année y a t'il eu le plus de enreg enregistrés ?
-- group by année, count enreg on garde celui qui a le compte
-- plus grand que tous les comptes
-- requete 5.2

 

    select annee_enr 
    from enreg
    group by annee_enr
    having count(id_enr) >=all(select count(id_enr)
                                  from enreg
                                  group by annee_enr);
  

 
-- 4. Quels sont les compositeurs qui sont aussi interpretes ?
-- on sélectionne les compositeurs qui appartiennent aussi aux interprètes
-- requête type 3.2

  

select distinct nom 
from individu 
join compo on (id_ind=id_musicien)
    where id_musicien in (select id_musicien 
                          from interp);
  

-- Alternative = une personne est interprète ET compositeur s'il apparait dans les 2 tables
-- on fait donc un jointure sur l'attribut id_musicien entre les tables interp et compo

  

select distinct nom 
from individu 
join compo on (id_ind=compo.id_musicien)
join interp on (id_ind=interp.id_musicien);
  

-- 5. Quels sont les compositeurs qui ont composé la totalité des enreg d'un CD ?
-- On cherche les compositeurs pour lesquels il existe un CD 
-- dans lequel il y a autant d'enregistrements que d'enregistrements composés par le compositeur sur ce cd
-- requête 5.2

  

    select distinct nom, id_ind 
    from individu as II 
    join compo on (id_ind=id_musicien)
    where exists (select distinct id_cd
                  from enreg EE
                  group by id_cd
                  having count (distinct id_enr) = 
                                  (select count (distinct id_enr)
                                   from enreg  natural join compo
                                   where enreg.id_cd = EE.id_cd
                                   and id_musicien=II.id_ind ));
  

-- Alternative , même début : On cherche les compositeurs pour lesquels il existe un CD 
-- pour lequel il n'existe pas un enregistrement qui ne soit pas composé par le compositeur

 

SELECT i.id_ind, i.nom, i.prenom, c.id_cd
FROM compo c
JOIN individu i ON i.id_ind = c.id_musicien
JOIN enreg using (id_cd)
WHERE not exists (select id_enr from enreg e
                  where e.id_cd = c.id_cd
                  and not exists (select id_enr from compo o
                                   where o.id_musicien = c.id_musicien
                                   and o.id_enr=e.id_enr
                                   and o.id_cd=e.id_cd)              
                 );
    

 

 
-- 6. Quels sont les compositeurs qui n'ont joué dans aucun enreg qu'ils ont composé ?
-- Je cherche les compositeurs pour lesquels il n'existe aucun enregistrement qu'il a composé  pour lequel il est interprete

 

select distinct nom, id_ind 
from individu as ii 
where id_ind not in
     (select distinct c.id_musicien 
        from compo c 
        join interp i on i.id_musicien = c.id_musicien 
                      and i.id_enr = c.id_enr
                      and i.id_cd = c.id_cd) ;

-- ALTERNATIVE -- je cherche les compositeurs qui ne font pas partie -- des compositeurs qui ont interprété au moins une de leur composition

 

select  nom, id_ind 
from individu as II 
where id_ind not IN (
    select id_musicien 
    from compo CO
    where (id_ind =id_musicien)
    and  exists (select id_enr 
    from interp as I 
    where I.id_musicien=CO.id_musicien 
    and I.id_enr=CO.id_enr 
    and I.id_cd=CO.id_cd));

-- 7. Quelles sont la ou les paires de musiciens le plus souvent réunis dans un enreg de notre base ?
-- les couples de musiciens qui apparaissent le plus souvent ensemble
-- requete 5.2

 

    select A.id_musicien, B.id_musicien 
    from interp A 
    join Interp B using (id_enr)
    where A.id_musicien > B.id_musicien
    group by A.id_musicien, B.id_musicien
    having count(*) >= all (select count(*) 
                               from interp A 
                               join Interp B using (id_enr)
                               where A.id_musicien > B.id_musicien
                               group by A.id_musicien, B.id_musicien ) ;
  

--8. Quels sont les enreg joués après la mort de l'un de ses compositeurs ?
-- les enregistrements dont l’année d'enregistrement est supérieur à l'année de decès de son compositeur
-- requetre 

 

SELECT id_enr, id_cd FROM enreg e WHERE TO_DATE(annee_enr || '-01-01', 'YYYY-MM-DD') > any(SELECT date_deces                                                        FROM individu                                                         JOIN compo o ON (id_ind = id_musicien)                                                        WHERE e.id_cd = o.id_cd                                                                                  AND e.id_enr = o.id_enr);

 
-- 9. Quels sont les individus de moins de trente ans qui sont à la fois interprète, compositeur et leader ?
-- les individus qui sont dans les 3 tables interp, compo , et leader dont l'annee de naissance

 

    select distinct (id_ind, date_nais) 
    from individu
    join compo on id_ind=compo.id_musicien
    join leader on id_ind=leader.id_musicien
    join interp on id_ind=interp.id_musicien
    where date_nais > CURRENT_DATE - INTERVAL '30 years'    and date_deces is NULL;
  

-- 10. Quels sont les musiciens qui jouent au moins l'une de leurs compositions dans chaque disque où ils jouent comme interprète ?
-- Pour un interpete, Il n'existe pas un CD dans lequel il joue , pour lequel il n'existe pas un enregistrement pour lequel il n'est pas compositeur
-- ATTENTION, il peut y avoir plusieurs compositeurs par enregistrement  
-- - le i1.id_cd donne tous les cd où l'interprete joue
-- id_cd est solution s'il existe un enreg de ce cd qui soit composé par cet inter ET joué par lui
-- jointure naturel => Même enreg ET même musicien

 

    select distinct (id_musicien , i1.id_cd) as "numInd, numCD"
    from individu join interp i1 on (id_ind = id_musicien)  
    where exists (select id_enr from interp int2          
                  natural join compo                                 
                  where i1.id_cd = int2.id_cd                );
    