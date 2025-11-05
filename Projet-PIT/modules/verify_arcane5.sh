#!/usr/bin/env bash
ARCHIVE=./connaissance.tar.gz
ELEMENTS=./elements
RUNES=./runes.txt
if [ -f "$ARCHIVE" ]; then
 echo "✔ L'archive magique est créée. Le Daemon est scellé !"
 exit 0
else
 echo "❌ Échec : l'archive n'existe pas encore."
 exit 1
fi
