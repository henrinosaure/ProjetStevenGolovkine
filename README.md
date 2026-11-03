# analysededonnees
Question: **Pouvons-nous déterminer la résistance d'une bactérie à un antibiotique particulier, sachant ses gènes de résistance?**

Bactéries résistantes ou non avec certains gènes présents → créer des groupes avec ACP/k-means? k-nn pour voir si nouvelle bactérie avec certains gènes présents est résistante ou non

# To Do
**Objectifs court-terme** 
1. Apprendre la theorie sur l'ACM
2. Déterminer comment on veut traiter les différentes mutations des gènes
3. Sort la grosse banque avant la separation entrainement/test/validation

**Objectifs long-terme**
1. Faire la préparation des données
2. ACM pour trouver les gènes les plus importants pour les antibiotiques.
3. k-means pour déterminer si tu es résistant ou non à un antibiotique sachant les gènes que tu as/as pas.
Variables nécessaires par observation : nom de la bactérie, présence de certains gènes (gène A, B, C, D, etc.), résistance à un ou plusieurs antibiotiques.
4. Déterminer si l'analyse s'est bien fonctionnée avec un test

# Données
**à mettre dans un fichier Data/ :**

**Antimicrobial Resistance (le gêne)**
NCBI_AMR : https://www.ncbi.nlm.nih.gov/pathogens/isolates/
garder seulement colonnes : "BioSample"           "AMR genotypes"

**Antibiotic sensibility test**
NCBI_AST : https://www.ncbi.nlm.nih.gov/pathogens/ast/
garder seulement colonnes : "BioSample"            "Organism group"       "Scientific name"     "Antibiotic"     "Resistance phenotype"

# Filtrage de données
1. Banques de données AMR et AST de NCBI sont mis en tibble sur R. 
2. On enlève les colonnes pas pertinentes.
3. Enlève tous les NA/données manquantes
4. Split la banque de données par gène : Avant, chaque observation avait plusieurs gènes, Après, chaque observation a 1 gène (tidy)
5. Garder seulement les gènes qui ont 10 ou plus observations
6. Garder seulement les 25 antibiotiques les plus fréquents
7. Enlever les observations en double (à voir si on veut faire ça plus tôt dans la filtration, mais ça change pas grand chose)
8. Créer et écrire les banques de données d'entrainement/test/validation

# Autres notes
ciprofloxacin est l'antibiotique le plus présent. Est-ce qu'on veut le choisir comme premier antibiotique à étudier?
gène pas présent dans données =/= gène absent du génome... comment on traite ça?
0 inflated regression? Voir si/comment c'est applicable
