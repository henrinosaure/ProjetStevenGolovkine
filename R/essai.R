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
  left_join(NCBI_AMR %>% select(`BioSample`, `AMR genotypes`), by = "BioSample")

# Split la banque de donnees pour chaque gene
NCBI_genes <- NCBI_filtered %>%
  separate_longer_delim(`AMR genotypes`, delim = ",") %>%
  separate_wider_delim(
    `AMR genotypes`,
    delim = "=",
    names = c("gene", "detection")
  )

# Enlever les donnees avec des gènes trop niches (apparaissent moins de 10)

genes_to_remove <- NCBI_genes %>%
  distinct(`BioSample`, gene) %>%
  count(gene) %>%
  # Changer parametre à côté de n pour seuil de fois que le gêne doit être la pour être gardé
  filter(n < 10)


antibio_to_keep <- NCBI_genes %>%
  distinct(BioSample, Antibiotic) %>%
  count(Antibiotic) %>%
  # Changer n pour nombre d'antibiotiques à garder
  slice_max(n, n = 25, with_ties = FALSE)

NCBI_genes_filtered <- NCBI_genes %>%
  filter(!(gene %in% genes_to_remove$gene)) %>%
  filter(Antibiotic %in% antibio_to_keep$Antibiotic) %>%
  distinct(BioSample, Antibiotic, gene, .keep_all = TRUE)