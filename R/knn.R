library(class)

entrainement <- read.csv("Data/banque_entrainement")
validation <- read.csv("Data/banque_validation")

kknn(
  entrainement,
  validation,
)