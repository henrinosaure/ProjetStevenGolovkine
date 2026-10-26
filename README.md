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
