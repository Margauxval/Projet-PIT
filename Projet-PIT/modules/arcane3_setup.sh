#!/usr/bin/env bash
PARCHEMIN=./parchemin.txt
RUNES=./runes.txt
[ ! -f "$PARCHEMIN" ] && echo -e "ligne1
rune1
ligne3
rune2" > "$PARCHEMIN"

echo "Arcane III prêt. Le parchemin est dans $PARCHEMIN"
echo "Quand tu penses avoir extrait toutes les runes, lance : ./modules/verify_arcane3.sh"
