#!/usr/bin/env bash
# Arcane 2 — Les Éléments Dispersés
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LEVEL="$DIR/elements"
VIES_FILE="$DIR/.vies_arcane2"

cleanup() {
    echo "Nettoyage des artefacts de l'Arcane 2..."
    rm -rf "$DIR/receptacle"
    rm -f "$DIR/feu.txt" "$DIR/eau.txt" "$DIR/air.txt" "$DIR/terre.txt"
}

rm -rf "$LEVEL"
mkdir -p "$LEVEL"
echo 3 > "$VIES_FILE"

mkdir -p "$LEVEL/haunt"
for e in feu eau air terre; do echo "Élément : $e" > "$LEVEL/haunt/$e.txt"; done

echo
echo "=== Arcane 2 — Les Éléments Dispersés ==="
echo "Un elfe maléfique a dispersé les éléments à travers le sanctuaire pour te jouer un tour !"
echo "Ta mission : Rassembler les quatre éléments — feu, eau, air et terre — dans un dossier nommé 'receptacle'."
echo
echo "Tu disposes de 3 vies. Une erreur t'en fera perdre une."
echo "Quand tu penses avoir réussi, invoque :"
echo "  bash modules/verifier_arcane2.sh"

