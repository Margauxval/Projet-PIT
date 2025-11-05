#!/usr/bin/env bash
# arcane1.sh - Arcane de la Découverte
set -euo pipefail
SANCTUAIRE="${SANDBOX_DIR:-./sanctuaire}"
GRIMOIRE=".grimoire_secret.txt"

mkdir -p "$SANCTUAIRE"
# Crée le grimoire si absent
if [ ! -f "$SANCTUAIRE/$GRIMOIRE" ]; then
  echo "catulus" > "$SANCTUAIRE/$GRIMOIRE"
fi

echo
echo "Arcane I — L'Arcane de la Découverte"
echo "Objectif : explorer le sanctuaire et lire le grimoire caché ($GRIMOIRE)."
echo "Le savoir dort dans les ombres... à toi de découvrir comment le réveiller."
echo

attempts=0
while true; do
  read -r -p "arcane1>> " cmd
  [ -z "$cmd" ] || continue
  if [[ "$cmd" =~ (;|\&\&|\|\||`|\$\(.*\)) ]]; then
    echo "Incantation interdite détectée."
    return 1
  fi
  (cd "$SANCTUAIRE" && bash -c "$cmd") 2>&1 || {
    echo "Échec d'exécution."
    return 1
  }
  # vérifier si le joueur a lu le grimoire
  if (cd "$SANCTUAIRE" && bash -c "cat $GRIMOIRE" 2>/dev/null | grep -q catulus); then
    echo
    echo "✔ Le Spectre se dissipe. Tu as appris le mot magique : catulus"
    return 0
  fi
  attempts=$((attempts+1))
  if [ $attempts -ge 8 ]; then
    echo "Trop d'essais ratés — échec magique."
    return 1
  fi
  echo "Indice : essaie 'ls -a' puis 'cat .grimoire_secret.txt'"
done
