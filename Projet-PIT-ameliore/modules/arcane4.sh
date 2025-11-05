#!/usr/bin/env bash
# Arcane 4 — Les Fichiers Corrompus
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LEVEL="$DIR/arcane4_env"
VIES_FILE="$DIR/.vies_arcane4"

rm -rf "$LEVEL"
mkdir -p "$LEVEL"
echo 3 > "$VIES_FILE"

for f in bon1.txt bon2.txt mauvais1.corrupt mauvais2.corrupt; do echo "fichier mystique" > "$LEVEL/$f"; done

echo
echo "=== Arcane 4 — Les Fichiers Corrompus ==="
echo "Mission : Purifier ton sanctuaire en supprimant tous les fichiers terminant par '.corrupt'."
echo
echo "Tu disposes de 3 vies. Une erreur t'en fera perdre une."
echo "Tu peux utiliser librement le terminal pour accomplir ta quête."
echo "Quand tu penses avoir réussi, invoque :"
echo "  bash modules/verifier_arcane4.sh"
echo
echo "Ton sanctuaire de travail : $LEVEL"

