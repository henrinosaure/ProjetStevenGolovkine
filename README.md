# analysededonnees
Projet d'analyse de données Henrizz, Busty J et Colgate

Question: **Pouvons-nous déterminer la résistance d'une bactérie à un antibiotique particulier, sachant ses gènes de résistance?**

Bactéries résistantes ou non avec certains gènes présents → créer des groupes avec ACP/k-means? k-nn pour voir si nouvelle bactérie avec certains gènes présents est résistante ou non

Variables nécessaires par observation : nom de la bactérie, présence de certains gènes (gène A, B, C, D, etc.), résistance à un ou plusieurs antibiotiques.

à mettre dans un fichier Data/ :

NCBI_AMR : https://www.ncbi.nlm.nih.gov/pathogens/isolates/
garder seulement colonnes : "BioSample"           "AMR genotypes"

NCBI_AST : https://www.ncbi.nlm.nih.gov/pathogens/ast/
garder seulement colonnes : "BioSample"            "Organism group"       "Scientific name"     "Antibiotic"     "Resistance phenotype"


**Objectifs court-terme**
Trouver comment faire une ACP à partir de des données qualitatives (ACM? Analyse en correspondances multiples?)
Voir si on veut juste se concentrer sur un anti-biotique pour le début, puis continuer la méthode avec d'autres antibiotiques dans le futur
Voir si y'a d'autres façons de filtrer les données

**Objectifs long-terme**
ACM pour trouver les gènes les plus importants pour les antibiotiques
k-means pour déterminer si tu es résistant ou non à un antibiotique sachant les gènes que tu as/as pas
