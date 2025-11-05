#!/usr/bin/env bash
# countdown.sh <time_file> - décrémente le fichier de temps chaque seconde
set -euo pipefail
timefile="${1:-time}"
while true; do
  if [ ! -f "$timefile" ]; then sleep 1; continue; fi
  t=$(cat "$timefile" 2>/dev/null || echo 0)
  if ! [[ "$t" =~ ^-?[0-9]+$ ]]; then t=0; fi
  if [ "$t" -le 0 ]; then
    echo "0" > "$timefile"
    exit 0
  fi
  t=$((t-1))
  echo "$t" > "$timefile"
  sleep 1
done
