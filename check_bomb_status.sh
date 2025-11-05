#!/usr/bin/env bash
# check_bomb_status.sh <time_file>
timefile="${1:-time}"
if [ ! -f "$timefile" ]; then echo "No bomb running."; exit 1; fi
t=$(cat "$timefile" || echo 0)
echo "Temps restant : ${t}s"
