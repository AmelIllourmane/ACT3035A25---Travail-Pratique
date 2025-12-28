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

# STATISTIQUES DESCRIPTIVES DES VARIABLES NUMÉRIQUES
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


# TABLEAUX DE FRÉQUENCES VARIABLES CATÉGORIELLES 

# Tableau de fréquence pour la gravité des collisions 
collisions_clean %>%
  count(GRAVITE) %>%
  mutate(pourcentage = n / sum(n) * 100)
  # Ça nous donne le nombre de collisions par gravité et la proportion de chaque gravité 
  # On remarque que la majorité des accidents observés entrainent uniquement des dommages matériels , tandis que les accidents graves et mortels demeurent très rares, 
  # représentant seulement 1 a 2 % des observations. 

# Tableau de fréquence pour la météo 
collisions_clean %>%
  count(COND_METEO) %>%
  mutate(pourcentage = n / sum(n) * 100)
  # Ça nous donne le nombre d'accidents pour chaque condition météorologique et la porportion de chaque condition 
  # Le tableau de fréquence des conditions météorologiques montre que 70% des accidents surviennent sous des conditions météorologiques favorables à la
  # conduite, soit des conditions claires. Les conditions météorologiques plus défavorables (pluie, neige, verglas, brouillard) représentent une proportion
  # plus faible des accidents, ce qui implique que le volume de circulation est plus élevé lorsque les conditions sont normales, donc plus de risque d'accident.

# Tableau de fréquence pour l'état de la surface 
collisions_clean %>%
  count(ETAT_SURFACE) %>%
  mutate(pourcentage = n / sum(n) * 100)
  # Ça nous donne le nombre d'accidents pour chaque état de la surface de la route
  # La distribution montre que 66% des accidents ont lieu sur une chaussée sèche tandis que les surfaces mouillées représentent 18% de la proportion. 
  # Les conditions hivernales telles que la neige et la glace constituent qaund à elles environ 15% des accidents. Bien que la majorité des accidents surviennet
  # sur des surfaces sèches les conditions défavorables mériteraient une attention particulière car elle pourraient être associées à une plus grande gravité
  # des accidents.

# Tableau de fréquence pour la catégorie de la route 
collisions_clean %>%
  count(CATEG_ROUTE) %>%
  mutate(pourcentage = n / sum(n) * 100)
   # Ça nous donne le nombre d'accidents pour chaque catégorie de la route
   # La distribution montre que les accidents surviennent majoritairement sur des artères principales, qui représentent environ 55 % des observations de collisions. 
   # Les rues résidentielles constituent la deuxieme catégorie la plus fréquente avec environ 33% des accidents. On remarque que les accidents surviennent sur des 
   # voies à usage quotidien ou fortement fréquentées. 


# 1. HISTOGRAMMES ET GRAPHIQUES DE DENSITÉ VARIABLES NUMÉRIQUES  

library(tidyverse)

# Histogramme vitesse autorisée 
ggplot(collisions_clean, aes(x = VITESSE_AUTOR)) +
  geom_histogram(binwidth = 10, fill = "blue", color = "white") +
  labs( title = "Distribution de la vitesse autorisée",
    x = "Vitesse autorisée (km/h)",
    y = "Nombre d'accidents"
  )

# Graphique de densité vitesse autorisée 
ggplot(collisions_clean, aes(x = VITESSE_AUTOR)) +
  geom_density(fill = "blue", alpha = 0.5) +
  labs( title = "Densité de la vitesse autorisée",
    x = "Vitesse autorisée (km/h)",
    y = "Densité"
  )

# 2. BOITES À MOUSTACHES (BOXPLOTS)

# Boxplot vitesse par gravité
ggplot(collisions_clean, aes(x = GRAVITE, y = VITESSE_AUTOR)) +
  geom_boxplot(fill = "red") +
  labs( title = "Vitesse autorisée selon la gravité de l'accident",
    x = "Gravité",
    y = "Vitesse autorisée (km/h)"
  )

# 3. GRAPHIQUES DE CORRÉLATION ET GRAPHIQUES POUR VARIABLES CATÉGORIELLES

# Corrélation entre variables numériques 
collisions_clean %>%
  select(
    VITESSE_AUTOR,
    NB_VEH_IMPLIQUES_ACCDN,
    nb_automobile_camion_leger,
    nb_motocyclette ) %>%
  cor() %>%
  heatmap(Rowv = NA, Colv = NA)

# Distribution de la gravité 
ggplot(collisions_clean, aes(x = GRAVITE)) + geom_bar() +
  labs( title = "Distribution de la gravité des accidents",
    x = "Gravité",
    y = "Nombre d'accidents"
  )

# Gravité vs vitesse autorisée 
ggplot(collisions_clean, aes(x = VITESSE_AUTOR, y = NB_VEH_IMPLIQUES_ACCDN, color = GRAVITE)) + geom_point()

# Vitesse vs nombre motos impliquées
ggplot(collisions_clean,aes(x = VITESSE_AUTOR, y = nb_motocyclette, color = GRAVITE)) + geom_point()

# Gravité selon conditions météo 
ggplot(collisions_clean, aes(x = COND_METEO, fill = GRAVITE)) + geom_bar(position = "fill")

# Gravité selon nombre de véhicules impliqués
ggplot(collisions_clean, aes(x = NB_VEH_IMPLIQUES_ACCDN , fill = GRAVITE)) + geom_bar(position = "fill")

# Gravité selon catégorie de route 
ggplot(collisions_clean, aes(x = CATEG_ROUTE , fill = GRAVITE)) + geom_bar(position = "fill")




