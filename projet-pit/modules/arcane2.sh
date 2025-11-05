#!/usr/bin/env bash
# arcane2.sh - Arcane des Élément
set -euo pipefail
SANCTUAIRE="${SANDBOX_DIR:-./sanctuaire}"
ELEMENTS=(feu.txt eau.txt air.txt terre.txt)

mkdir -p "$SANCTUAIRE"
# créer éléments dispersés si absents
for f in "${ELEMENTS[@]}"; do
  if [ ! -f "$SANCTUAIRE/$f" ]; then
    echo "Pierre de ${f%%.*}" > "$SANCTUAIRE/$f"
  fi
done

echo
echo "Arcane II — L'Arcane des Éléments"
echo "Objectif : créer un réceptacle 'elements/' et y placer : ${ELEMENTS[*]}"
echo "Commandes autorisées : mkdir, mv, ls"
echo

attempts=0
while true; do
  read -r -p "arcane2>> " cmd
  [ -z "$cmd" ] || continue
  if [[ "$cmd" =~ (;|\&\&|\|\||`|\$\(.*\)) ]]; then
    echo "Incantation interdite."
    return 1
  fi
  (cd "$SANCTUAIRE" && bash -c "$cmd") 2>&1 || {
    echo "Échec d'exécution."
    return 1
  }
  # vérification : dossier elements et tous les fichiers dedans
  if [ -d "$SANCTUAIRE/elements" ]; then
    ok=true
    for f in "${ELEMENTS[@]}"; do
      if [ ! -f "$SANCTUAIRE/elements/$f" ]; then ok=false; break; fi
    done
    if $ok; then
      echo
      echo "✔ Les pierres sont réunies. Le Golem se désintègre."
      return 0
    fi
  fi
  attempts=$((attempts+1))
  if [ $attempts -ge 8 ]; then
    echo "Trop d'essais — échec magique."
    return 1
  fi
  echo "Indice : mkdir elements && mv <fichier> elements/"
done
