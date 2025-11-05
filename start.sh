#!/usr/bin/env bash
# start - Lance la bombe Projet-PIT (Arcanes)
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
MODULE_DIR="$ROOT/modules"
SANDBOX="$ROOT/sanctuaire"
TIME_FILE="$ROOT/time"
SEED_FILE="$ROOT/seed.conf"

# initialisation
mkdir -p "$SANDBOX"
: > "$TIME_FILE"

echo "=== Projet-PIT : Apprenti Bashicien ==="
echo "Initialisation..."
bash "$ROOT/generate_seed.sh" "$SEED_FILE"

# lire la config
source "$SEED_FILE"

echo "Bombe prête. Durée: $BOMB_TIME secondes. Erreurs autorisées: $MAX_ERRORS"
echo "$BOMB_TIME" > "$TIME_FILE"

# lancer le compte à rebours en arrière-plan
bash "$ROOT/countdown.sh" "$TIME_FILE" &

ERRORS=0
for module in "${ACTIVE_MODULES[@]}"; do
  module_script="$MODULE_DIR/$module.sh"
  if [ ! -x "$module_script" ]; then
    echo "Module manquant: $module"
    exit 1
  fi
  echo
  printf ">>> Lancement du module : %s\n" "$module"
  # exécuter le module dans un sous-shell, avec SANDBOX fourni
  SANDBOX_DIR="$SANDBOX" bash "$module_script"
  rc=$?
  if [ $rc -ne 0 ]; then
    ERRORS=$((ERRORS+1))
    echo "Erreur comptée ! Total erreurs: $ERRORS / $MAX_ERRORS"
    if [ $ERRORS -ge $MAX_ERRORS ]; then
      echo "La bombe explose. ÉCHEC."
      exit 2
    fi
  else
    echo "Module $module désamorcé."
  fi
done

# fin : vérifier temps
if [ -s "$TIME_FILE" ]; then
  rem=$(cat "$TIME_FILE")
  if [ "$rem" -le 0 ]; then
    echo "Temps écoulé. La bombe explose."
    exit 3
  fi
fi

echo
echo "Toutes les épreuves réussies. Tu obtiens le titre : Maître Bashicien !"
exit 0
