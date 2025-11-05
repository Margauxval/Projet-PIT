#!/usr/bin/env bash
# generate_seed.sh <out_file>
set -euo pipefail
out="${1:-seed.conf}"
# paramètres modifiables
BOMB_TIME=600     # seconds par défaut
MAX_ERRORS=3

# Liste des modules (les fichiers correspondants dans modules/)
MODULES=(arcane1 arcane2 arcane3 arcane4 arcane5)
# par défaut active tous les modules ; tu peux randomiser
ACTIVE=(arcane1 arcane2 arcane3 arcane4 arcane5)

# écrire le seed
cat > "$out" <<EOF
BOMB_TIME=$BOMB_TIME
MAX_ERRORS=$MAX_ERRORS
ACTIVE_MODULES=(${ACTIVE[@]})
EOF
echo "Seed générée dans $out"
