#---Description
# Ce script vise à modéliser la gravité des collisions routières à partir des données nettoyées.
# Il utilise deux modèles actuariels: 
    # 1. La régression logistique 
    # 2. Le modèle linéaire généralisé (GLM) 

#1. RÉGRESSION LOGISTIQUE

    # Prétraitement des données 
donnees <- collisions_clean %>%
  mutate(across(where(is.character), as.factor))

    # Création de la variable gravite_binaire
donnees <- donnees %>%
  mutate(gravite_binaire = ifelse(GRAVITE %in% c("Grave", "Mortel"), 1, 0))

    # Séparation X/Y (comme en cours)
Y <- donnees$gravite_binaire
X <- donnees %>%
  select(
    VITESSE_AUTOR,
    NB_VEH_IMPLIQUES_ACCDN,
    CD_COND_METEO,
    CD_ETAT_SURFC,
    CD_CATEG_ROUTE,
    nb_automobile_camion_leger,
    nb_motocyclette )

    # Séparation TRAIN/TEST (80% -20%)
set.seed(3035)

indice_repartition <- sample( 1:nrow(donnees), size = floor(0.8 * nrow(donnees)))

X_train <- X[indice_repartition,]
X_test  <- X[-indice_repartition,]

Y_train <- Y[indice_repartition]
Y_test  <- Y[-indice_repartition]

