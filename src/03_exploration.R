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

# Analyse des distributions
  # Les statistiques descriptives montrent que la vitesse autorisée moyenne est d'environ 46 km/h avec une médiane de 50 km/h , ce qui indique que la moitié
  # des collisions ont eu lieu sur des routes dont la limitation de vitesse est de 50 km/h ou moins. 
  # Le nombre de véhicules impliqués par collision est en moyenne proche de 2, ce qui indique que la majorité des accidents  sont des collisions entre 2 véhicules.
  # On remarque aussi que les automobiles et camions légers sont les types de véhicules les plus frequemment impliqués contrairement aux motocyclettes.

# Tableau de fréquence pour la gravité des collisions 
collisions_clean %>%
  count(GRAVITE) %>%
  mutate(pourcentage = n / sum(n) * 100)
  # Ça nous donne le nombre de collisions par gravité et la proportion de chaque gravité 

# Tableau de fréquence pour la météo 
collisions_clean %>%
  count(COND_METEO) %>%
  mutate(pourcentage = n / sum(n) * 100)
  # Ça nous donne le nombre d'accidents pour chaque condition météorologique et la porportion de chaque condition 
  # Le tableau de fréquences des conditions météorologiques montre que 70% des accidents surviennent sous des conditions météorologiques favorables à la
  # conduite, soit des conditions claires. Les conditions météorologiques plus défavorables (pluie, neige, verglas, brouillard) représentent une proportion
  # plus faible des accidents, ce qui implique que le volume de circulation est plus élevé lorsque les conditions sont normales, donc plus de risque d'accident.

# Tableau de fréquence pour l'état de la surface 
collisions_clean %>%
  count(ETAT_SURFACE) %>%
  mutate(pourcentage = n / sum(n) * 100)
  # Ça nous donne le nombre d'accidents pour chaque état de la surface de la route
  
# Tableau de fréquence pour la catégorie de la route 
collisions_clean %>%
  count(CATEG_ROUTE) %>%
  mutate(pourcentage = n / sum(n) * 100)







