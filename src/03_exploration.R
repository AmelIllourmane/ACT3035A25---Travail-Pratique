# ---Description
# Ce script réalise l'analyse exploratoire des données de collisions routières nettoyées.
# Il vise à décrire les principales caractéristiques des variables, à analyser les distributions , à produire des statistiques
# descriptives et des visualisations afin de mieux comprendre la structure des données avant la modélisation actuarielle. 


#---CODE---
# Chargement des données nettoyées

library(tidyverse)
collisions_clean <- read_csv("data/processed/collisions_nettoyees.csv")

dim(collisions_clean)
str(collisions_clean)

# 
