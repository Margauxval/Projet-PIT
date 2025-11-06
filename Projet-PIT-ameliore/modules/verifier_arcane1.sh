#!/usr/bin/env bash
# Vérification de l'Arcane 1 — L'Arcane de la Découverte
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VIES_FILE="$DIR/.vies_arcane1"
VIES=$(cat "$VIES_FILE")

# -------------------------------
# Fonction de nettoyage
cleanup() {
    echo "Nettoyage des artefacts de l'Arcane 1..."
    rm -rf "$DIR/bibliotheque_magique"
}
# -------------------------------

# Le mot magique attendu (contenu dans le grimoire)
SECRET_WORD="catulus"

# Vérifie d'abord que le fichier existe
GRIMOIRE="$DIR/bibliotheque_magique/.grimoire_secret.txt"
if [ ! -f "$GRIMOIRE" ]; then
    echo "Le grimoire secret a disparu !"
    echo "Réinvoque l'arcane avec : bash modules/arcane1.sh"
    exit 1
fi

echo
echo "Entre le mot magique inscrit dans ton grimoire :"
read -r ANSWER

if [[ "$ANSWER" == "$SECRET_WORD" ]]; then
    echo
    echo "Les forces mystiques t'accordent leur faveur !"
    echo "Tu as triomphé de l'Arcane 1 — L'Arcane de la Découverte."
    echo "Le voile se lève... L'Arcane 2 t'appelle."
    bash "$DIR/arcane2.sh"
    exit 0
else
    VIES=$((VIES - 1))
    echo "$VIES" > "$VIES_FILE"
    echo
    echo "L'incantation échoue... Vies restantes : $VIES"
    if [ $VIES -le 0 ]; then
        cleanup
        echo "Tes pouvoirs t'abandonnent. Le jeu recommence depuis le début."
        bash "$DIR/arcane1.sh"
    else
        echo "Tente à nouveau, mage persévérant. Relis ton grimoire et relance : bash modules/verifier_arcane1.sh"
    fi
fi
