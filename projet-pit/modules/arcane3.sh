#!/usr/bin/env bash
# arcane3.sh - Arcane de la Transmutation
set -euo pipefail
SANCTUAIRE="${SANDBOX_DIR:-./sanctuaire}"
PARCHEMIN="parchemin.txt"
RUNES="runes.txt"

mkdir -p "$SANCTUAIRE"
# créer parchemin si absent
if [ ! -f "$SANCTUAIRE/$PARCHEMIN" ]; then
  cat > "$SANCTUAIRE/$PARCHEMIN" <<'EOF'
Ligne 1: une ancienne rune apparait
Ligne 2: textes oubliés
Ligne 3: rune de protection
Ligne 4: instruction perdue
Ligne 5: rune finale
EOF
fi

echo
echo "Arcane III — L'Arcane de la Transmutation"
echo "Objectif : extraire toutes les lignes contenant 'rune' depuis $PARCHEMIN et les sauvegarder dans $RUNES"
echo "Le parchemin murmure... seuls les initiés savent filtrer ses secrets."
echo

attempts=0
while true; do
  read -r -p "arcane3>> " cmd
  [ -z "$cmd" ] || continue
  if [[ "$cmd" =~ (;|\&\&|\|\||`|\$\(.*\)) ]]; then
    echo "Incantation interdite."
    return 1
  fi
  (cd "$SANCTUAIRE" && bash -c "$cmd") 2>&1 || {
    echo "Échec d'exécution."
    return 1
  }
  if [ -f "$SANCTUAIRE/$RUNES" ] && grep -q "rune" "$SANCTUAIRE/$RUNES"; then
    echo
    echo "✔ Les runes brillent d'une lumière dorée. L'Esprit s'incline."
    return 0
  fi
  attempts=$((attempts+1))
  if [ $attempts -ge 8 ]; then
    echo "Trop d'essais — échec magique."
    return 1
  fi
  echo "Indice : cat parchemin.txt | grep rune > runes.txt"
done
