install.packages("tidyverse")
library(tidyverse)

NCBI <- read_tsv("Data/NCBI.tsv")


unique(NCBI$Antibiotic)
unique(NCBI$`Resistance phenotype`)
unique(NCBI$`Organism group`)