#!/usr/bin/env bash
SANCTUAIRE=./elements
mkdir -p "$SANCTUAIRE"
for e in feu.txt eau.txt air.txt terre.txt; do
  [ ! -f "$SANCTUAIRE/$e" ] && echo "$e" > "$SANCTUAIRE/$e"
done

echo "Arcane II prêt. Les quatre pierres élémentaires ont été dispersées dans $SANCTUAIRE"
echo "Quand tu penses avoir réuni les pierres, lance : ./modules/verify_arcane2.sh"
