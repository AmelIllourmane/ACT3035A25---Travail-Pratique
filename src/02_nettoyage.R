# ---Description
# Ce script effectue le nettoyage et la préparation des données de collisions routières en vue de l’analyse exploratoire et
# de la modélisation actuarielle.


#---CODE---
# Chargement de la librairie nécessaire 
Library(tidyverse)

#Lecture des données brutes 
collisions_raw <- read_csv("data/raw/collisions_routieres.csv")
View(collisions_raw)

# Sélection des variables pertinentes
names(collisions_raw)
vars_selectionnees <- c(
    # Variable réponse
  "GRAVITE",
    # Temps
  "AN",
  "HEURE_ACCDN",
    # Environnement
  "CD_COND_METEO",
  "CD_ETAT_SURFC",
    # Route
  "VITESSE_AUTOR",
  "CD_CATEG_ROUTE",
    # Exposition
  "NB_VEH_IMPLIQUES_ACCDN",
    # Véhicules
  "nb_automobile_camion_leger",
  "nb_motocyclette"
)


