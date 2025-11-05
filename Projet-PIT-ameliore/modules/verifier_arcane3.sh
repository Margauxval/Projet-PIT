#!/usr/bin/env bash
# Vérification de l'Arcane 3 — Les Runes Éparses
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VIES_FILE="$DIR/.vies_arcane3"
VIES=$(cat "$VIES_FILE")

# -------------------------------
# Fonction de nettoyage de l'Arcane 3
cleanup() {
    echo "Nettoyage des artefacts de l'Arcane 3..."
    rm -rf "$DIR/runes"       # Supprime le dossier runes/ si utilisé
    rm -f "$DIR/runes.txt"    # Supprime le fichier runes.txt
}
# -------------------------------

# -------------------------------
# Fonction de nettoyage de l'Arcane 2 (précédent)
cleanup_prev() {
    echo "Nettoyage des artefacts de l'Arcane 2..."
    rm -rf "$DIR/receptacle"
    rm -f "$DIR/feu.txt" "$DIR/eau.txt" "$DIR/air.txt" "$DIR/terre.txt"
}
# -------------------------------

success=0

# Vérifie s’il existe au moins un fichier texte dans un sous-dossier "runes" du dossier $DIR.
if find "$DIR" -type f -path "*/runes/*.txt" | grep -q .; then
    success=1
fi

if [ $success -eq 1 ]; then
    echo
    echo "Les forces mystiques t'accordent leur faveur !"
    echo "Tu as triomphé de l'Arcane 3 — Les Runes Éparses."
    echo "Le voile se lève... L'Arcane 4 t'appelle."
    bash "$DIR/arcane4.sh"
    exit 0
else
    VIES=$((VIES - 1))
    echo "$VIES" > "$VIES_FILE"
    echo "L'incantation échoue... Vies restantes : $VIES"
    if [ $VIES -le 0 ]; then
        cleanup       # Nettoie l'Arcane 3
        cleanup_prev  # Nettoie l'Arcane 2 pour recommencer proprement
        echo "Tes pouvoirs t'abandonnent. Tu es renvoyé à l'Arcane 2."
        bash "$DIR/arcane2.sh"
    else
        echo "Tente à nouveau, mage persévérant. Corrige ton œuvre et relance : bash modules/verifier_arcane3.sh"
    fi
fi
