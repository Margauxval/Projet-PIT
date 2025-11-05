#!/usr/bin/env bash
# generate_seed.sh - génère la configuration de la bombe (seed)
set -euo pipefail
out="${1:-seed.conf}"

BOMB_TIME=600
MAX_ERRORS=3

MODULES=(arcane1 arcane2 arcane3 arcane4 arcane5)
ACTIVE=(arcane1 arcane2 arcane3 arcane4 arcane5)

cat > "$out" <<EOF
BOMB_TIME=$BOMB_TIME
MAX_ERRORS=$MAX_ERRORS
ACTIVE_MODULES=(${ACTIVE[@]})
EOF

echo "Seed générée : $out"
