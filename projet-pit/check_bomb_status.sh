#!/usr/bin/env bash
# check_bomb_status.sh - affiche le temps restant
timefile="${1:-time}"
if [ ! -f "$timefile" ]; then echo "Aucune bombe en cours."; exit 1; fi
t=$(cat "$timefile" || echo 0)
echo "Temps restant : ${t}s"
