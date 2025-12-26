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

#### Description des scripts 
  ##### 1. Acquisition des données: 
     # Ce script documente l'acquisition du jeu de données utilisé pour le projet. Comme indiqué précédemment, les données ont été téléchargées manuellement à partir du portail Données Québec, puis importées
     # dans l'environnement R. Aucune transformation n'est effectuée à cette étape, afin de conserver les données brutes dans leur format initial. Ce script permet aussi de faire une première vérification de
     # la structure du jeu de données.  
  
  ##### 2. Nettoyage et préparation des données
     
  ##### 3. Analyse exploratoire des données

  ##### 5. Modélisation statistique

  ##### 6. Comparaison et interprétation des modèles 



