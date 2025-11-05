#!/usr/bin/env bash
# Arcane 3 — Les Runes Éparses
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LEVEL="$DIR/arcane3_env"
VIES_FILE="$DIR/.vies_arcane3"

rm -rf "$LEVEL"
mkdir -p "$LEVEL"
echo 3 > "$VIES_FILE"

for i in 1 2 3; do echo -e "rune: alpha\ntexte ordinaire" > "$LEVEL/parchemin$i.txt"; done

echo
echo "=== Arcane 3 — Les Runes Éparses ==="
echo "Mission : Extraire toutes les lignes contenant 'rune' depuis les parchemins et les réunir dans un dossier nommé 'runes'."
echo
echo "Tu disposes de 3 vies. Une erreur t'en fera perdre une."
echo "Tu peux utiliser librement le terminal pour accomplir ta quête."
echo "Quand tu penses avoir réussi, invoque :"
echo "  bash modules/verifier_arcane3.sh"
echo
echo "Ton sanctuaire de travail : $LEVEL"
