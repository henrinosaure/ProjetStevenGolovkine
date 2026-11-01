#install.packages("tidyverse")
library(tidyverse)

NCBI_AST <- read_tsv("Data/NCBI_AST.tsv") %>%
  rename_with(~ sub("^#BioSample$", "BioSample", .x))

NCBI_AMR <- read_tsv("Data/NCBI_AMR.tsv") %>%
  rename_with(~ sub("^#BioSample$", "BioSample", .x))

# Filtre et combine les 2 banques de donnees, gardant les colonnes :
# BioSample, Organism Group, Antibiotic, Resistance phenotype et AMR Genotypes
NCBI_filtered <- NCBI_AST %>%
  filter(`BioSample` %in% NCBI_AMR$`BioSample`) %>%
  filter(`Resistance phenotype` %in% c("susceptible", "resistant")) %>%
  select(`BioSample`, `Organism group`, Antibiotic, `Resistance phenotype`) %>%
  left_join(NCBI_AMR %>% select(`BioSample`, `AMR genotypes`), by = "BioSample"
  )%>%
  filter(
    !is.na(`AMR genotypes`),
    trimws(`AMR genotypes`) != ""
  )

# Split la banque de donnees pour chaque gene
NCBI_genes <- NCBI_filtered %>%
  separate_longer_delim(`AMR genotypes`, delim = ",") %>%
  separate_wider_delim(
    `AMR genotypes`,
    delim = "=",
    names = c("gene", "detection")
  )

# Enlever les donnees avec des gènes trop niches (apparaissent moins de 10 fois)
# Garder seulement les 25 antibiotiques les plus fréquents

# Trouve les genes a enlever en fonction de ceux qui sont les plus frequents 
#(on garde seulement ceux qui ont 10 ou plus d'apparitions)
genes_to_remove <- NCBI_genes %>%
  distinct(`BioSample`, gene) %>%
  count(gene) %>%
  # Changer parametre à côté de n pour seuil de fois que le gêne doit être la pour être gardé
  filter(n < 10)

# Gardes seulement les 25 antibiotiques les plus frequents
antibio_to_keep <- NCBI_genes %>%
  distinct(BioSample, Antibiotic) %>%
  count(Antibiotic) %>%
  # Changer n pour nombre d'antibiotiques à garder
  slice_max(n, n = 25, with_ties = FALSE)

# Applique les 2 banques de filtration precedentes et enleve les observations en double 
#(Qui ont tous le meme biosample, gene et antibiotique testé)
NCBI_genes_filtered <- NCBI_genes %>%
  filter(!(gene %in% genes_to_remove$gene)) %>%
  filter(Antibiotic %in% antibio_to_keep$Antibiotic) %>%
  distinct(BioSample, Antibiotic, gene, .keep_all = TRUE)

# =============================================================================
# --------- creer banque d'entrainement et banque de validation/test ----------
# =============================================================================

pattern_validation <- c(1, 1, 1, rep(0, 17))
pattern_test <- c(rep(0, 17), 1, 1, 1)


banque_validation <- NCBI_genes_filtered %>%
  # ca choisit les 3 premiers sur 20 (15%) pour chaque chunk de 20 observations.
  # le length.out = n, ca fait juste dire de continuer le pattern sur tout le tibble
  # le == 1 dit de garder seulement les elements qui sont egals a 1 dans le pattern validation
  filter(rep(pattern_validation, length.out = n())==1)

banque_test <- NCBI_genes_filtered %>%
  filter(rep(pattern_test, length.out = n())==1)



