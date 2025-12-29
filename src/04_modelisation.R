#---Description
# Ce script vise à modéliser la gravité des collisions routières à partir des données nettoyées.
# Il utilise deux modèles actuariels: 
    # 1. La régression logistique 
    # 2. Le modèle linéaire 

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

dim(X_train)
dim(X_test)

    # Modèle de régression logistique
modele_logistique <- glm( gravite_binaire ~ .,
  data = cbind(X_train, gravite_binaire = Y_train),
  family = binomial()
)

summary(modele_logistique)

    # Prédiction sur l'échantillon test 
Y_pred <- predict( modele_logistique,
  newdata = X_test,
  type = "response"
)

    # Classification 
Y_pred_class <- ifelse(Y_pred > 0.5, 1, 0)
   
    #Évaluation du modèle 
table(Y_test, Y_pred_class)


# MODÈLE LINÉAIRE GÉNÉRALISÉ

    #Construction du modèle linéaire 
modele_lineaire <- lm(
  gravite_binaire ~ 
    VITESSE_AUTOR +
    NB_VEH_IMPLIQUES_ACCDN +
    CD_COND_METEO +
    CD_ETAT_SURFC +
    CD_CATEG_ROUTE +
    nb_automobile_camion_leger +
    nb_motocyclette,
  data =  (cbind(X_train, gravite_binaire = Y_train))
)

summary(modele_lineaire)

    # Prédiction sur l'échantillon test 
y_pred_lm <- predict(modele_lineaire, newdata = X_test)

    # Classification 
y_pred_lm_class <- ifelse(y_pred_lm > 0.5, 1, 0)


