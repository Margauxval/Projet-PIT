#!/usr/bin/env bash
# Arcane 1 — L'Arcane de la Découverte
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LEVEL="$DIR/arcane1_env"
VIES_FILE="$DIR/.vies_arcane1"

rm -rf "$LEVEL"
mkdir -p "$LEVEL"
echo 3 > "$VIES_FILE"

echo "catulus" > "$LEVEL/.grimoire_secret.txt"

echo
echo "=== Arcane 1 — L'Arcane de la Découverte ==="
echo "Mission : Découvrir le mot magique caché dans le grimoire secret de ton sanctuaire."
echo
echo "Tu disposes de 3 vies. Une erreur t'en fera perdre une."
echo "Tu peux utiliser librement le terminal pour accomplir ta quête."
echo "Quand tu penses avoir réussi, invoque :"
echo "  bash modules/verifier_arcane1.sh"
echo
echo "Ton sanctuaire de travail : $LEVEL"
cd "$LEVEL"
$SHELL
