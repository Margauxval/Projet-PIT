# Projet-PIT : Apprenti Bashicien (fork)
Ce projet est un jeu en bash inspiré du modèle demandé.

Structure :
projet-pit/
├─ modules/
│  ├─ arcane1.sh
│  ├─ arcane2.sh
│  ├─ arcane3.sh
│  ├─ arcane4.sh
│  ├─ arcane5.sh
├─ start.sh

Usage :
chmod +x start.sh modules/*.sh
./start.sh

Chaque arcane donne 3 vies. Une erreur fait perdre une vie. Si tu perds toutes les vies dans un arcane, le script te renverra à l'arcane précédent automatiquement.
