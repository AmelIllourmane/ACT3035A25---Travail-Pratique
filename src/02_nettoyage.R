# ---Description
# Ce script effectue le nettoyage et la préparation des données de collisions routières en vue de l’analyse exploratoire et
# de la modélisation actuarielle.


#---CODE---
# Chargement de la librairie nécessaire 
Library(tidyverse)
#Lecture des données brutes 
collisions_raw <- read_csv("data/raw/collisions_routieres.csv")
View(collisions_raw)


