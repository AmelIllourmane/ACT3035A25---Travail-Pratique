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

# Statistiques descriptives des variables numériques 
collisions_clean %>%
  select(
    VITESSE_AUTOR,
    NB_VEH_IMPLIQUES_ACCDN,
    nb_automobile_camion_leger,
    nb_motocyclette
  ) %>%
  summary()
 
# Mesures de tendance centrale et de dispersion pour la vitesse et le nombre de vehiculés impliqués dans les accidents 
collisions_clean %>%
  summarise(
    moyenne_vitesse = mean(VITESSE_AUTOR, na.rm = TRUE),
    mediane_vitesse = median(VITESSE_AUTOR, na.rm = TRUE),
    ecart_type_vitesse = sd(VITESSE_AUTOR, na.rm = TRUE),
    
    moyenne_nb_veh = mean(NB_VEH_IMPLIQUES_ACCDN, na.rm = TRUE),
    mediane_nb_veh = median(NB_VEH_IMPLIQUES_ACCDN, na.rm = TRUE),
    ecart_type_nb_veh = sd(NB_VEH_IMPLIQUES_ACCDN, na.rm = TRUE)
  )

# 












