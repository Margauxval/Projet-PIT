#!/usr/bin/env bash
# Vérification de l'Arcane 1 — L'Arcane de la Découverte
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LEVEL="$DIR/bibliotheque_magique"
VIES_FILE="$DIR/.vies_arcane1"
VIES=$(cat "$VIES_FILE")                                      # Lit le nombre actuel de vies et le stocke dans la variable VIES.

success=0

# Recherche du grimoire secret contenant le mot magique "catulus"
for f in $(find "$DIR" -type f -name ".grimoire_secret.txt"); do if grep -q "catulus" "$f"; then success=1; fi; done

if [ $success -eq 1 ]; then
  echo
  echo "✨ Les forces mystiques t'accordent leur faveur !"
  echo "✔ Tu as triomphé de l'Arcane 1 — L'Arcane de la Découverte."
  echo "→ Le voile se lève... L'Arcane 2 t'appelle."
  bash "$DIR/arcane2.sh"
  exit 0
else
  VIES=$((VIES - 1))
  echo "$VIES" > "$VIES_FILE"                                # - Mise à jour du fichier de vies.
  echo "❌ L'incantation échoue... Vies restantes : $VIES"
  if [ $VIES -le 0 ]; then
    echo "💀 Tes pouvoirs t'abandonnent. Le jeu recommence depuis le début."
    bash "$DIR/arcane1.sh"
  else
    echo "↻ Tente à nouveau, mage persévérant. Corrige ton œuvre et relance : bash modules/verifier_arcane1.sh"
  fi
fi
