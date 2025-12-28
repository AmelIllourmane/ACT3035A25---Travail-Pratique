# ACT3035A25---Travail-Pratique
Travail pratique --

## Description du projet 
Ce dépot contient mon travail pratique du cours ACT3035. 
L'objectif de ce projet est de réaliser une analyse de données à des fins actuarielles, incluant l'acquisition des données, le nettoyage, l'analyse exploratoire et la modélisation. 


## Jeu de données
Le jeu de données utilisé provient du portail Données Québec et concerne les collisions routières sur le territoire de la ville de Montréal. Il contient des informations détaillées sur les accidents de la route, notamment la date, le lieu, le type de collision ainsi que plusieurs caractéristiques de l'environnement routier. 
Ce jeu de données est pertinent pour une analyse actuarielle puisqu'il permet d'évaluer le risque et la fréquence des collisions routières en fonction de différents facteurs explicatifs. Il se prête donc bien à l'utilisation de modèles actuariels, tels que la régression logistique et les modèles linéaires afin d'analyser le risque de collisions routières.  

En raison de la taille importante du fichier, les données brutes ne sont pas incluses directement dans ce dépot. Elles peuvent être téléchargées à partir du portail Données Québec.
Les données sont accessibles publiquement à l'adresse suivante: https://www.donneesquebec.ca/recherche/dataset/vmtl-collisions-routieres/resource/05deae93-d9fc-4acb-9779-e0942b5e962f 

Le fichier CSV doit être téléchargé manuellement et placé dans le dossier data/raw avant d'exécuter un script. 

## Structure du projet
Le dépot est organisé de la façon suivante:
 - data/: données brutes et transformées
 - src/: scripts R pour les différentes étapes de l'analyse
 - docs/: rapport final
 - results/: graphiques et tableaux générés

### Description des scripts 
  ##### 1. Acquisition des données: 
Ce script documente l'acquisition du jeu de données utilisé pour le projet. Comme indiqué précédemment, les données ont été téléchargées manuellement
à partir du portail Données Québec, puis importées dans l'environnement R. Aucune transformation n'est effectuée à cette étape, afin de conserver les
données brutes dans leur format initial.
  
  ##### 2. Nettoyage et préparation des données
Ce script réalise les étapes de transformation du processus ETL. Les variables pertinentes pour l'analyse sont sélectionnées, les valeurs manquantes 
sont traitées, et les variables codées numériquement sont transformées en facteurs. Le jeu de données ainsi nettoyé est ensuite sauvegardé dans le dossier data/processed. 

  ##### 3. Analyse exploratoire des données
Une analyse exploratoire est  réalisée afin d’examiner la distribution des variables et les relations potentielles entre celles-ci.  
Des tableaux de fréquences sont produits pour les variables catégorielles (gravité, conditions météorologiques, état de la surface et catégorie de route).  
Des visualisations (histogrammes, densités, boxplots et nuages de points) permettent quand à elles d’explorer les variables numériques, soit la vitesse autorisée et le nombre de véhicules impliqués.
L’analyse ne permet toutefois pas directement de faire des relations simples et linéaires entre les variables explicatives et la gravité, ce qui justifie l’utilisation de modèles statistiques pour l’étape de modélisation.

  ##### 5. Modélisation statistique
La modélisation vise à estimer la probabilité qu’une collision routière soit grave ou non en fonction de caractéristiques observées liées à l’environnement routier et à d’autres conditions externes.
Des modèles statistiques adaptés à une variable réponse binaire sont utilisés afin d’évaluer l’influence des variables retenues. La variable réponse est la gravité de l’accident. On construit donc deux modèles actuariels qu'on va ensuite comparer. 

   ###### -   Modèle 1 : Régression logistique  
Choix du modèle: La variable réponse gravite a été transformée en une variable binaire gravite_binaire (collision grave vs non grave).
Dans ce contexte, la régression logistique est un modèle approprié, car : 
la variable à prédire est binaire ; 
elle permet d’estimer la probabilité qu’une collision soit grave ; 
elle est largement utilisée en actuariat pour la sélection des risques et l’analyse d’événements rares.

Le modèle de régression logistique montre que la gravité des collisions est principalement influencée par la vitesse autorisée, le type de véhicules impliqués et certaines caractéristiques de la route. Une vitesse plus élevée est associée à une probabilité accrue de collisions graves. La présence de motocyclettes augmente le risque de gravité, ce qui reflète la vulnérabilité des usagers. Les conditions météorologiques ne ressortent pas comme un facteur significatif une fois les autres variables prises en compte. D’un point de vue actuariel, ces résultats permettent d’identifier des facteurs utiles pour la prévention et la tarification.

   ###### -   Modèle 2 : Modèle linéaire généralisé (GLM)



   

  ##### 6. Comparaison et interprétation des modèles 



