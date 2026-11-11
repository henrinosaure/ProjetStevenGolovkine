#install.packages("FactoMineR")
#install.packages("factoextra")

library(FactoMineR)
library(factoextra)
library(dplyr)

donnees <- read.csv("Data/banque_entrainement.csv") %>%
  select(-Resistance.phenotype) %>%
  mutate(across(everything(), as.factor))

acm <- MCA(donnees, graph = FALSE)

fviz_mca_biplot(acm, repel = TRUE)