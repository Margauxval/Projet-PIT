#!/usr/bin/env bash
SANCTUAIRE=./elements
for e in feu.txt eau.txt air.txt terre.txt; do
  [ ! -f "$SANCTUAIRE/$e" ] && echo "❌ Échec : toutes les pierres ne sont pas réunies." && exit 1
done
 echo "✔ Les pierres sont réunies, le Golem disparaît !"
 exit 0
