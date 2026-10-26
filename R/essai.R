install.packages("tidyverse")
library(tidyverse)

NCBI_AMR <- read_tsv("Data/NCBI_AMR.tsv")
NCBI_AST <- read_tsv("Data/NCBI_AST.tsv")

NCBI_AST_filtered <- NCBI_AST %>%
  filter(`#BioSample` %in% NCBI_AMR$`#BioSample`) %>%
  filter(`Resistance phenotype` %in% c("susceptible", "resistant")) %>%
  select(`#BioSample`, `Organism group`, Antibiotic, `Resistance phenotype`) %>%
  left_join(NCBI_AMR %>%
        select(`#BioSample`, `AMR genotypes`), by = "#BioSample")
