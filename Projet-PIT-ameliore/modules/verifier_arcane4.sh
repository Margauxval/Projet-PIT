#!/usr/bin/env bash
# Vérification de l'Arcane 4 — Les Fichiers Corrompus
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VIES_FILE="$DIR/.vies_arcane4"
VIES=$(cat "$VIES_FILE")

# -------------------------------
# Fonction de nettoyage de l'Arcane 3 (précédent)
cleanup_prev() {
    echo "Nettoyage des artefacts de l'Arcane 3..."
    rm -rf "$DIR/runes"
    rm -f "$DIR/runes.txt"
}
# -------------------------------

success=1

# Recherche des fichiers corrompus
if find "$DIR" -type f -name "*.corrupt" | grep -q .; then
    success=0
fi

if [ $success -eq 1 ]; then
    echo
    echo "Les forces mystiques t'accordent leur faveur !"
    echo "Tu as triomphé de l'Arcane 4 — Les Fichiers Corrompus."
    echo "Le voile se lève... L'Arcane 5 t'appelle."
    bash "$DIR/arcane5.sh"
    exit 0
else
    VIES=$((VIES - 1))
    echo "$VIES" > "$VIES_FILE"
    echo "L'incantation échoue... Vies restantes : $VIES"
    if [ $VIES -le 0 ]; then
        cleanup_prev   # Nettoie l'Arcane 3
        echo "Tes pouvoirs t'abandonnent. Tu es renvoyé à l'Arcane 3."
        bash "$DIR/arcane3.sh"
    else
        echo "Tente à nouveau, mage persévérant. Corrige ton œuvre et relance : bash modules/verifier_arcane4.sh"
    fi
fi
