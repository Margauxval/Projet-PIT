#!/usr/bin/env bash
# Arcane 1 — L'Arcane de la Découverte
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" # Définit la variable DIR comme le dossier où se trouve ce script.
                                                    # "$(dirname "${BASH_SOURCE[0]}")" récupère le chemin du script.
                                                    # "cd ... && pwd" convertit ce chemin en chemin absolu.
LEVEL="$DIR/receptacle"                             # Crée une variable LEVEL contenant le chemin vers un sous-dossier "receptacle"
                                                    # situé au même endroit que le script.
VIES_FILE="$DIR/.vies_arcane1"                      # Définit le chemin du fichier qui contiendra le nombre de vies du joueur.

rm -rf "$LEVEL"
mkdir -p "$LEVEL"
echo 3 > "$VIES_FILE"

echo "catulus" > "$LEVEL/.grimoire_secret.txt"

echo
echo "=== Arcane 1 — L'Arcane de la Découverte ==="
echo "Ton grimoire de bashicien contenant toutes tes formules magiques vient de se volatiliser !"
echo "Ta mission : Découvrir le mot magique caché dans le grimoire secret de ton sanctuaire."
echo
echo "Tu disposes de 3 vies. Une erreur t'en fera perdre une."
echo "Quand tu penses avoir réussi, invoque :"
echo "  bash modules/verifier_arcane1.sh"

