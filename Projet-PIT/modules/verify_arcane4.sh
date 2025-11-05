#!/usr/bin/env bash
SANCTUAIRE=./corruption
for f in $SANCTUAIRE/corrompu*.txt; do
  [ -f "$f" ] && echo "❌ Échec : le fichier corrompu $f existe encore." && exit 1
done
 echo "✔ Tous les fichiers corrompus ont été supprimés, le Ver disparaît !"
 exit 0
