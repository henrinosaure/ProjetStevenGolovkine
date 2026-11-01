# analysededonnees
Question: **Pouvons-nous déterminer la résistance d'une bactérie à un antibiotique particulier, sachant ses gènes de résistance?**

Bactéries résistantes ou non avec certains gènes présents → créer des groupes avec ACP/k-means? k-nn pour voir si nouvelle bactérie avec certains gènes présents est résistante ou non

Variables nécessaires par observation : nom de la bactérie, présence de certains gènes (gène A, B, C, D, etc.), résistance à un ou plusieurs antibiotiques.

à mettre dans un fichier Data/ :
**Antimicrobial Resistance (le gêne)**
1. NCBI_AMR : https://www.ncbi.nlm.nih.gov/pathogens/isolates/
2. garder seulement colonnes : "BioSample"           "AMR genotypes"
**Antibiotic sensibility test**
1. NCBI_AST : https://www.ncbi.nlm.nih.gov/pathogens/ast/
2. garder seulement colonnes : "BioSample"            "Organism group"       "Scientific name"     "Antibiotic"     "Resistance phenotype"

**Objectifs court-terme** 
1. Trouver comment faire une ACP à partir de des données qualitatives (ACM? Analyse en correspondances multiples?).
2. Voir si on veut juste se concentrer sur un anti-biotique pour le début, puis continuer la méthode avec d'autres antibiotiques dans le futur.
3. Voir si y'a d'autres façons de filtrer les données. 
4. Déterminer comment on veut traiter les différentes mutations des gènes
5. Préparer les données pour L'ACM
6. Délibérer sur comment faire en sorte que la banque de données de validation/test pour qu'elle ne change pas entre deux essais sans biais. (La façon que je l'ai fait pourrait entraîner un biais peut-être jsp)

**Objectifs long-terme**
1. Faire la préparation des données
2. ACM pour trouver les gènes les plus importants pour les antibiotiques.
3. k-means pour déterminer si tu es résistant ou non à un antibiotique sachant les gènes que tu as/as pas.

# Filtrage de données
Banques de données AMR et AST de NCBI sont mis en tibble sur R. 
On enlève les colonnes pas pertinentes.
Enlève tous les NA/données manquantes
Split la banque de données par gène : Avant, chaque observation avait plusieurs gènes, Après, chaque observation a 1 gène (tidy)
Garder seulement les gènes qui ont 10 ou plus observations
Garder seulement les antibiotiques qui ont 25 ou plus observations (on pourra considérer choisir seulement 1 antibiotique dans le futur)
Enlever les observations en double (à voir si on veut faire ça plus tôt dans la filtration, mais ça change pas grand chose)
Créer et écrire les banques de données d'entrainement/test/validation








