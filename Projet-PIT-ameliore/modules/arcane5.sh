#!/usr/bin/env bash
# Arcane 5 — L'Archive Finale
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LEVEL="$DIR/archive_magique"
VIES_FILE="$DIR/.vies_arcane5"

cleanup() {
    echo "Nettoyage des artefacts de l'Arcane 5..."
    # Supprime l’ancienne archive si elle existe
    rm -f "$DIR/finale.tar.gz"
    # Supprime les dossiers/fichiers temporaires utilisés pour l’archive
    rm -rf "$DIR/receptacle"
    rm -f "$DIR/runes.txt"

    # Recréation des fichiers nécessaires pour l’archive finale
    mkdir -p "$DIR/receptacle"
    touch "$DIR/receptacle/feu.txt" "$DIR/receptacle/eau.txt" "$DIR/receptacle/air.txt" "$DIR/receptacle/terre.txt"
    touch "$DIR/runes.txt"
}

rm -rf "$LEVEL"
mkdir -p "$LEVEL"
echo 3 > "$VIES_FILE"

echo "artefact du savoir" > "$LEVEL/artefact.txt"
echo "souvenir" > "$LEVEL/memoire.txt"

echo
echo "=== Arcane 5 — L'Archive Finale ==="
echo "Tu as parcouru tellement d'épreuves ce n'est pas le moment de tout oublier !"
echo "Mission : Créer une archive 'finale.tar.gz' contenant tous les artefacts de ton sanctuaire."
echo
echo "Tu disposes de 3 vies. Une erreur t'en fera perdre une."
echo "Quand tu penses avoir réussi, invoque :"
echo "  bash modules/verifier_arcane5.sh"


