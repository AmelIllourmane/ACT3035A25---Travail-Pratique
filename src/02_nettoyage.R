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
vars_selectionnees

#Création du jeu de données filtré 
collisions_processed <- collisions_raw %>%
  select(all_of(vars_selectionnees))
view(collisions_processed)

#Suppression des observations contenant des valeurs manquantes 
colSums(is.na(collisions_processed))
collisions_clean <- collisions_processed %>%
  drop_na()

#Dimensions avant et après le nettoyage
dim(collisions_processed)
dim(collisions_clean)
summary(collisions_clean)


#Encodage des variables catégorielles: j'ai trouvé la signification de chacun des codes dans le dictionnaire de données de la SAAQ 
     #Variable condition météo



    #Variable État de la surface 
collisions_clean <- collisions_clean %>%
  mutate(
    ETAT_SURFACE = case_when(
      CD_ETAT_SURFC == 11 ~ "Sèche",
      CD_ETAT_SURFC == 12 ~ "Mouillée",
      CD_ETAT_SURFC == 13 ~ "Mouillée",
      CD_ETAT_SURFC == 14 ~ "Enneigée",
      CD_ETAT_SURFC == 15 ~ "Enneigée",
      CD_ETAT_SURFC == 16 ~ "Enneigée",
      CD_ETAT_SURFC == 17 ~ "Enneigée",
      CD_ETAT_SURFC == 18 ~ "Glacée",
      CD_ETAT_SURFC == 19 ~ "Autre",
      CD_ETAT_SURFC == 20 ~ "Autre",
      CD_ETAT_SURFC == 99 ~ "Non précisé",
      TRUE ~ NA
    )
  )

    #Variable catégorie route



#Conversion des variables catégorielles en facteurs 
view(collisions_clean)
collisions_clean <- collisions_clean %>% 
  mutate(
    GRAVITE= as.factor(GRAVITE),
    CD_COND_METEO= as.factor(CD_COND_METEO),
    CD_ETAT_SURFC= as.factor(CD_ETAT_SURFC),
    CD_CATEG_ROUTE= as.factor(CD_CATEG_ROUTE)
  )

#Vérification 
str(collisions_clean)
summary(collisions_clean)

#Sauvegarde des données nettoyées
write_csv(
  collisions_clean, "data/processed/collisions_nettoyees.csv"
)




