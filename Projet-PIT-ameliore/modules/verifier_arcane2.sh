#!/usr/bin/env bash
# Vérification de l'Arcane 2 — Les Éléments Dispersés
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LEVEL="$DIR/arcane2_env"
VIES_FILE="$DIR/.vies_arcane2"
VIES=$(cat "$VIES_FILE")

success=1
for e in feu eau air terre; do if ! find "$DIR" -type f -path "*/receptacle/$e.txt" | grep -q .; then success=0; fi; done

if [ $success -eq 1 ]; then
  echo
  echo "✨ Les forces mystiques t'accordent leur faveur !"
  echo "✔ Tu as triomphé de l'Arcane 2 — Les Éléments Dispersés."
  echo "→ Le voile se lève... L'Arcane 3 t'appelle."
  bash "$DIR/arcane3.sh"
  exit 0
else
  VIES=$((VIES - 1))
  echo "$VIES" > "$VIES_FILE"
  echo "❌ L'incantation échoue... Vies restantes : $VIES"
  if [ $VIES -le 0 ]; then
    echo "💀 Tes pouvoirs t'abandonnent. Tu es renvoyé à l'Arcane 1."
    bash "$DIR/arcane1.sh"
  else
    echo "↻ Tente à nouveau, mage persévérant. Corrige ton œuvre et relance : bash modules/verifier_arcane2.sh"
  fi
fi
