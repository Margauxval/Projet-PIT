#!/usr/bin/env bash
# Arcane 3 — Les Runes Éparses
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LEVEL="$DIR/recueil"
VIES_FILE="$DIR/.vies_arcane3"

cleanup() {
    echo "Nettoyage des artefacts de l'Arcane 3..."
    rm -rf "$DIR/runes"       # Si dossier runes/ utilisé
    rm -f "$DIR/runes.txt"    # Si fichier runes.txt généré
}

rm -rf "$LEVEL"
mkdir -p "$LEVEL"
echo 3 > "$VIES_FILE"

for i in 1 2 3; do echo -e "rune: alpha\ntexte ordinaire" > "$LEVEL/parchemin$i.txt"; done

echo
echo "=== Arcane 3 — Les Runes Éparses ==="
echo "Un gobelin a désordonné ton recueil de runes !!"
echo "Ta mission : Extraire toutes les lignes contenant 'rune' depuis les parchemins et les réunir dans un dossier nommé 'runes'."
echo
echo "Tu disposes de 3 vies. Une erreur t'en fera perdre une."
echo "Quand tu penses avoir réussi, invoque :"
echo "  bash modules/verifier_arcane3.sh"

