#!/usr/bin/env bash
# Vérification de l'Arcane 5 — L'Archive Finale
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LEVEL="$DIR/archive_magique"
VIES_FILE="$DIR/.vies_arcane5"
VIES=$(cat "$VIES_FILE")

success=0

#cherche si l'archive a été créée
if find "$DIR" -type f -name "finale.tar.gz" | grep -q .; then success=1; fi

if [ $success -eq 1 ]; then
  echo
  echo "Les forces mystiques t'accordent leur faveur !"
  echo "Tu as triomphé de l'Arcane 5 — L'Archive Finale."
  echo "Tu as accompli toutes les Arcanes ! L'Ordre t'accueille parmi les Mages accomplis."
  exit 0
else
  VIES=$((VIES - 1))
  echo "$VIES" > "$VIES_FILE"
  echo "L'incantation échoue... Vies restantes : $VIES"
  if [ $VIES -le 0 ]; then
    cleanup
    echo "Tes pouvoirs t'abandonnent. Tu es renvoyé à l'Arcane 4."
    bash "$DIR/arcane4.sh"
  else
    echo "Tente à nouveau, mage persévérant. Corrige ton œuvre et relance : bash modules/verifier_arcane5.sh"
  fi
fi
