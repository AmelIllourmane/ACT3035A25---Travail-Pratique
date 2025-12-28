# Analyse actuarielle des collisions routières au Québec 

## 1. Introduction 
Les collisions routières représentent un enjeu majeur de sécurité publique et constituent des coûts importants pour les assureurs automobiles. 
La gravité des accidents influence directement les indemnisations versées, tant en ce qui concerne les dommages corporels que matériels. À
Dans une perspective actuarielle, il est donc essentiel de comprendre les facteurs associés à la gravité pour évaluer le risque futur. 

Dans ce projet, on analyse un jeu de données public portant sur les collisions routières survenues au Québec. À partir de ces données, on réalise un processus
d'axtraction, de transformation et d'analyse exploratoire afin de mieux comprendre les caractéristiques des accidents et les potentielles relations entre les variables. 
L'objectif principal est de modéliser la gravité des collisions en fonction de variables liées à l'environnement routier et à diverses conditions externes.  


## 2. Description des données 
Les données utilisées dans ce projet proviennent du portail Données Québec, qui met à disposition des jeux de données publics gouvernementaux. 
Le jeu de données retenu porte plus précisément sur les collisions routières survenues sur le territoire de la ville de Montréal. 
Ces données ont été obtenues par téléchargement manuel à partir du site officiel de Données Québec, à l'adresse suivante :
https://www.donneesquebec.ca/recherche/dataset/vmtl-collisions-routieres/resource/05deae93-d9fc-4acb-9779-e0942b5e962f 

Le jeu de données contient des informations détaillées sur chaque collision, incluant des variables liées à la date et l'heure de l'accident, à 
l'environnement routier, aux conditions météorologiques, au type de route, ainsi qu'au  nombre et au type de véhicules impliqués. 
Il comprend également une variable indiquant la gravité de l'accident, qui constitue la variable d'intérêt principale dans le cadre de cette analyse.
Le nombre d'observations est largement suffisant pour permettre une analyse statistique et une modélisation pertinente. Les données sont réalistes et 
permettentd'illustrer un défi actuariel lié à l'assurance automobile.


## 3. Processus ETL 
### Extraction des données 
Les données ont été obtenues par téléchargement manuel à partir de Données Québec. Le jeu de données à été téléchargé sous forme de fichier CSV et enregistré dans un dossier data/raw , sans aucune modification pour conserver les données brutes.
L'importation des données dans l'environnement R a ensuite été réalisée à l'aide des fonctions du package readr.

### Tranformation des données 
La transformation consiste à préparer les données pour l'analyse et la modélisation actuarielle.
Dans le cadre de ce projet, seules certaines variables ont été retenues afin de concentrer l'analyse sur les facteurs les plus pertinents pour l'étude 
de la gravité des collisions. Les variables retenues décrivent notamment le moment de l'accident, l'environnment routier, l'état de la route et les véhicules exposés dans l'accident. 
On a supprimé les observations incomplètes pour traiter les valeurs manquantes.
Les variables catégorielles ont quant à elles été transformées et codées afin de les rendre plus faciles à lire et afin de mieux les exploiter dans les analyses. 

### Chargement des données 
Suite à l'étape du nettoyage  et de tranformation, le jeu de données final a été sauvegardé dans le dossier data/processed.
Ce fichier constitue la version à utiliser pour l'analyse exploratoire. 


## 4. Analyse exploratoire des données 
Une analyse exploratoire des données a été réalisée afin de mieux comprendre la structure du jeu de données, la distribution des variables et les relations potentielles entre celles-ci, avant toute modélisation actuarielle.

### Distribution de la variable GRAVITE
La variable GRAVITE a d’abord été analysée à l’aide de tableaux de fréquences et de graphiques en barres. Les résultats montrent que la majorité des accidents sont de gravité faible, tandis que les accidents graves sont relativement rares. 

### Analyse des variables numériques
La distribution de la vitesse autorisée (VITESSE_AUTOR) a été étudiée à l’aide d’un histogramme et d’un graphique de densité.
Les vitesses se concentrent principalement autour de 50 km/h, ce qui reflète un contexte majoritairement urbain des accidents observés.
Le nombre de véhicules impliqués dans un accident (NB_VEH_IMPLIQUES_ACCDN) présente une distribution très concentrée autour de 1 et 2 véhicules, les accidents impliquant un grand nombre de véhicules sont très rares.

### Analyse des variables catégorielles
Des tableaux de fréquences ont été produits pour les variables catégorielles suivantes : "Gravité", "Conditions météorologiques ", "État de la surface de la chaussée" , "Catégorie de route" .
L’analyse montre que :
-	Les accidents surviennent majoritairement lors de conditions météorologiques normales (temps clair ou couvert).
-	La surface de la chaussée est le plus souvent sèche lors des accidents.
-	Certaines catégories de routes comme les artères principales concentrent une part importante des accidents.

### Relations entre variables
Des graphiques exploratoires ont été produits afin d’examiner les relations entre plusieurs variables :
- Gravité et vitesse autorisée (boxplots) : 
Les boxplots suggèrent une dispersion légèrement plus élevée des vitesses autorisées pour les accidents les plus graves, bien qu’aucune séparation nette ne soit observée entre les niveaux de gravité.
- Vitesse autorisée et nombre de véhicules impliqués (nuages de points) :
Les nuages de points ne révèlent pas de relation linéaire claire entre la vitesse autorisée et le nombre de véhicules impliqués, quelle que soit la gravité.
- Relation entre gravité et conditions météo : On remarque que la grande majorité, soit environ 70 % des accidents, se produisent lorsque les conditions météorologiques sont favorables (claires) . Les conditions météorologiques défavorables (pluie, neige, verglas, brouillard) sont quant à elles moins fréquentes, mais elles représentent une proportion plus élevée de collisions graves ou mortelles. 
- Relation entre gravité et nombre de véhicules impliquées dans l'accident :
La gravité des collisions tend à augmenter lorsque le nombre ed véhicules impliqués est plus élevé. On remarque que les accidents les plus graves sont ceux
avec des collisions autour de 10 véhicules. 
- Relation entre gravité et catégorie de la route : Les collisions sur des artères principales, autouroutes et bretelles d'autoroute sont associées à des niveaux
de gravité plus élevées selon les observations. Les routes résidentielles concentrent surtout des collisions d'une gravité faible. 

## 5. Définition du problème actuariel 
### Variable réponse
La variable réponse retenue pour la modélisation est la gravité de la collision (GRAVITE). Dans le cadre de ce projet, cette variable est considérée sous une forme binaire. On distingue donc les accidents graves des accidents non graves. Ce choix permet de simplifier l’analyse tout en conservant l’information essentielle liée à la sévérité des événements.

### Justification actuarielle 
D’un point de vue actuariel, la gravité d’un accident constitue un élément très important lors de l’évaluation du risque en assurance automobile. Les accidents graves sont généralement associés à des coûts beaucoup plus élevés, notamment en raison des dommages corporels et des indemnisations qui y sont associées. Modéliser la probabilité qu’un accident soit grave ou pas permet donc de mieux comprendre les facteurs de risque et d’estimer la tarification. 

### Objectif de la modélisation 
L’objectif de la modélisation est d’estimer la probabilité qu’une collision routière soit grave ou non en fonction des caractéristiques observées de l’accident.


## 6. Modélisation actuarielle 
La modélisation vise à estimer la gravité d'une collision routière en fonction de caractéristiques observées liées à l’environnement routier et à d’autres conditions externes. On construit donc deux modèles actuariels qu'on va ensuite comparer pour la variable reponse gravite

   ###### -   Modèle 1 : Régression logistique  
Choix du modèle: La variable réponse gravite a été transformée en une variable binaire gravite_binaire (collision grave vs non grave).
Dans ce contexte, la régression logistique est un modèle approprié, car : 
la variable à prédire est binaire ; 
elle permet d’estimer la probabilité qu’une collision soit grave ; 
elle est largement utilisée en actuariat pour la sélection des risques et l’analyse d’événements rares.

Le modèle de régression logistique montre que la gravité des collisions est principalement influencée par la vitesse autorisée, le type de véhicules impliqués et certaines caractéristiques de la route. Une vitesse plus élevée est associée à une probabilité accrue de collisions graves. La présence de motocyclettes augmente le risque de gravité, ce qui reflète la vulnérabilité des usagers. Les conditions météorologiques ne ressortent pas comme un facteur significatif une fois les autres variables prises en compte. D’un point de vue actuariel, ces résultats permettent d’identifier des facteurs utiles pour la prévention et la tarification.

Le tableau de classification montre que le modèle prédit systématiquement la classe des collisions non graves. On remarque une bonne performance globale en général sur les collisions non graves, mais les collisions graves ne sont pas correctement identifiées. Ce résultat est principalement dû à un fort déséquilibre des classes, les collisions graves représentant une trop faible proportion des observations.

   ###### -   Modèle 2 : Modèle linéaire 
On peut interpréter les coefficients de la manière suivante : Un coefficient positif indique que la variable augmente la gravité des collisions, un coefficient négatif indique une diminution de la gravité, les variables liées à la vitesse et à la présence de motocyclettes ont un effet positif sur la gravité.
Le modèle linéaire n’est pas le plus approprié dans ce contexte, car la variable réponse est binaire. Le modèle peut produire des prédictions inférieures à 0 ou supérieures à 1, ce qui ne correspond pas à une probabilité.


## 7. Comparaison des modèles , discussion et limites 






## 9. Conclusion 
