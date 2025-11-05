#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
chmod +x "$SCRIPT_DIR"/modules/*.sh
echo "=== Projet-PIT : Apprenti Bashicien ==="
echo "Le jeu commence... Prépare-toi, jeune mage !"
bash "$SCRIPT_DIR"/modules/arcane1.sh
