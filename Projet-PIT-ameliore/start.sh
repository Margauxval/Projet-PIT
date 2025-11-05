#!/usr/bin/env bash

set -euo pipefail
# Active trois options importantes pour rendre le script plus sûr :
# -e : quitte le script dès qu’une commande renvoie une erreur.
# -u : provoque une erreur si une variable non initialisée est utilisée.
# -o pipefail : fait échouer tout pipeline si une commande échoue, pas seulement la dernière.

echo "=== Projet-PIT : L'Apprenti Bashicien ==="
echo "Prépare-toi, jeune mage... L'Arcane I t'attend."

bash modules/arcane1.sh
# Exécute le script situé dans le dossier "modules", nommé "arcane1.sh".

