#!/usr/bin/env bash
# arcane5.sh - Arcane de la Convergence
set -euo pipefail
SANCTUAIRE="${SANDBOX_DIR:-./sanctuaire}"
ARCHIVE="archive_magique.tar.gz"

mkdir -p "$SANCTUAIRE"

echo
echo "Arcane V — L'Arcane de la Convergence"
echo "Objectif : créer une archive contenant 'elements/' et 'runes.txt' (tar -czvf ...)"
echo "Le dernier secret ne se révèle qu’à ceux qui savent tout assembler..."
echo

attempts=0
while true; do
  read -r -p "arcane5>> " cmd
  [ -z "$cmd" ] || continue
  if [[ "$cmd" =~ (;|\&\&|\|\||`|\$\(.*\)) ]]; then
    echo "Incantation interdite."
    return 1
  fi
  (cd "$SANCTUAIRE" && bash -c "$cmd") 2>&1 || {
    echo "Échec d'exécution."
    return 1
  }
  if [ -f "$SANCTUAIRE/$ARCHIVE" ]; then
    (cd "$SANCTUAIRE" && tar -tzf "$ARCHIVE" >/dev/null 2>&1) && {
      echo
      echo "✔ Le Daemon Suprême est scellé. Tu deviens Maître Bashicien !"
      return 0
    }
  fi
  attempts=$((attempts+1))
  if [ $attempts -ge 8 ]; then
    echo "Trop d'essais — échec magique."
    return 1
  fi
  echo "Indice : tar -czvf archive_magique.tar.gz elements runes.txt"
done
