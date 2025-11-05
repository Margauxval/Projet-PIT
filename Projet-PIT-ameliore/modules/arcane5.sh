#!/usr/bin/env bash
# Arcane 5 — L'Archive Finale
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LEVEL="$DIR/arcane5_env"
VIES_FILE="$DIR/.vies_arcane5"

rm -rf "$LEVEL"
mkdir -p "$LEVEL"
echo 3 > "$VIES_FILE"

echo "artefact du savoir" > "$LEVEL/artefact.txt"
echo "souvenir" > "$LEVEL/memoire.txt"

echo
echo "=== Arcane 5 — L'Archive Finale ==="
echo "Mission : Créer une archive 'finale.tar.gz' contenant tous les artefacts de ton sanctuaire."
echo
echo "Tu disposes de 3 vies. Une erreur t'en fera perdre une."
echo "Tu peux utiliser librement le terminal pour accomplir ta quête."
echo "Quand tu penses avoir réussi, invoque :"
echo "  bash modules/verifier_arcane5.sh"
echo
echo "Ton sanctuaire de travail : $LEVEL"
cd "$LEVEL"
$SHELL
