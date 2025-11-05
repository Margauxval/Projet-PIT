# Projet-PIT : Mode Libre
Version libre du jeu d'apprentissage Bash magique.

## Fonctionnement
- Chaque arcane crée un environnement (`arcaneX_env/`) avec les fichiers nécessaires.
- Le joueur peut utiliser le terminal normalement (`ls`, `mv`, `cat`, etc.).
- Quand il pense avoir accompli la mission, il lance :
  ```bash
  bash modules/verifier_arcaneX.sh
  ```
- Si la vérification réussit → passage à l'arcane suivant.
- Sinon → perte d'une vie. Si toutes sont perdues, retour à l'arcane précédent.

Chaque vérification fonctionne quel que soit le répertoire depuis lequel elle est lancée.
