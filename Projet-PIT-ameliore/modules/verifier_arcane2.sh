#!/usr/bin/env bash
# Vérification de l'Arcane 2 — Les Éléments Dispersés
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VIES_FILE="$DIR/.vies_arcane2"
VIES=$(cat "$VIES_FILE")

# -------------------------------
# Fonction de nettoyage de l'Arcane 2
cleanup() {
    echo "Nettoyage des artefacts de l'Arcane 2..."
    rm -rf "$DIR/receptacle"
    rm -f "$DIR/elements/haunt"/*.txt 2>/dev/null || true
}
# -------------------------------

# -------------------------------
# Fonction de nettoyage de l'Arcane 1 (précédent)
cleanup_prev() {
    echo "Nettoyage des artefacts de l'Arcane 1..."
    rm -f "$DIR/bibliotheque_magique/.grimoire_secret.txt"
}
# -------------------------------

success=0
# Vérifie que TOUS les éléments sont bien dans le dossier receptacle/
if [ -d "$DIR/receptacle" ]; then
    if [ -f "$DIR/receptacle/feu.txt" ] &&
       [ -f "$DIR/receptacle/eau.txt" ] &&
       [ -f "$DIR/receptacle/air.txt" ] &&
       [ -f "$DIR/receptacle/terre.txt" ]; then
        success=1
    fi
fi

if [ $success -eq 1 ]; then
    echo
    echo "Les forces mystiques t'accordent leur faveur !"
    echo "Tu as triomphé de l'Arcane 2 — Les Éléments Dispersés."
    echo "Le voile se lève... L'Arcane 3 t'appelle."
    bash "$DIR/arcane3.sh"
    exit 0
else
    VIES=$((VIES - 1))
    echo "$VIES" > "$VIES_FILE"
    echo "L'incantation échoue... Vies restantes : $VIES"
    if [ $VIES -le 0 ]; then
        cleanup        # Nettoie l'Arcane 2
        cleanup_prev   # Nettoie l'Arcane 1
        echo "Tes pouvoirs t'abandonnent. Tu es renvoyé à l'Arcane 1."
        bash "$DIR/arcane1.sh"
    else
        echo "Tente à nouveau, mage persévérant. Corrige ton œuvre et relance : bash modules/verifier_arcane2.sh"
    fi
fi
