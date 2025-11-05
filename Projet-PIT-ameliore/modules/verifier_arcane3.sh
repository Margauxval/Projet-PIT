#!/usr/bin/env bash
# Vérification de l'Arcane 3 — Les Runes Éparses
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LEVEL="$DIR/arcane3_env"
VIES_FILE="$DIR/.vies_arcane3"
VIES=$(cat "$VIES_FILE")

success=0
if find "$DIR" -type f -path "*/runes/*.txt" | grep -q .; then success=1; fi

if [ $success -eq 1 ]; then
  echo
  echo "✨ Les forces mystiques t'accordent leur faveur !"
  echo "✔ Tu as triomphé de l'Arcane 3 — Les Runes Éparses."
  echo "→ Le voile se lève... L'Arcane 4 t'appelle."
  bash "$DIR/arcane4.sh"
  exit 0
else
  VIES=$((VIES - 1))
  echo "$VIES" > "$VIES_FILE"
  echo "❌ L'incantation échoue... Vies restantes : $VIES"
  if [ $VIES -le 0 ]; then
    echo "💀 Tes pouvoirs t'abandonnent. Tu es renvoyé à l'Arcane 2."
    bash "$DIR/arcane2.sh"
  else
    echo "↻ Tente à nouveau, mage persévérant. Corrige ton œuvre et relance : bash modules/verifier_arcane3.sh"
  fi
fi
