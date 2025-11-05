#!/usr/bin/env bash
# Arcane 2 — Les Éléments Dispersés
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LEVEL="$DIR/arcane2_env"
VIES_FILE="$DIR/.vies_arcane2"

rm -rf "$LEVEL"
mkdir -p "$LEVEL"
echo 3 > "$VIES_FILE"

mkdir -p "$LEVEL/haunt"
for e in feu eau air terre; do echo "Élément : $e" > "$LEVEL/haunt/$e.txt"; done

echo
echo "=== Arcane 2 — Les Éléments Dispersés ==="
echo "Mission : Rassembler les quatre éléments — feu, eau, air et terre — dans un dossier nommé 'receptacle'."
echo
echo "Tu disposes de 3 vies. Une erreur t'en fera perdre une."
echo "Tu peux utiliser librement le terminal pour accomplir ta quête."
echo "Quand tu penses avoir réussi, invoque :"
echo "  bash modules/verifier_arcane2.sh"
echo
echo "Ton sanctuaire de travail : $LEVEL"

