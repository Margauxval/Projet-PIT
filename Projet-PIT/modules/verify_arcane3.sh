#!/usr/bin/env bash
PARCHEMIN=./parchemin.txt
RUNES=./runes.txt
grep 'rune' "$PARCHEMIN" > "$RUNES"
count=$(wc -l < "$RUNES")
if [ $count -ge 2 ]; then
echo "✔ Les runes ont été extraites avec succès."
exit 0
else
echo "❌ Échec : toutes les runes n'ont pas été extraites."
exit 1
fi
