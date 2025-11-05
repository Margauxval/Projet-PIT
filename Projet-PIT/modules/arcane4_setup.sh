#!/usr/bin/env bash
SANCTUAIRE=./corruption
mkdir -p "$SANCTUAIRE"
for f in corrompu1.txt corrompu2.txt normal.txt; do
  [ ! -f "$SANCTUAIRE/$f" ] && echo "$f" > "$SANCTUAIRE/$f"
done

echo "Arcane IV prêt. Purifie le sanctuaire en supprimant les fichiers corrompus dans $SANCTUAIRE"
echo "Quand tu penses avoir nettoyé les fichiers corrompus, lance : ./modules/verify_arcane4.sh"
