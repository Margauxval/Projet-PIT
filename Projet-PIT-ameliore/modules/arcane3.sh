#!/usr/bin/env bash
# Arcane III — Les Runes Éparses
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LEVEL="$DIR/arcane3_level"
RUNES_DIR="$LEVEL/runes"
VIES=3

rm -rf "$LEVEL"
mkdir -p "$LEVEL" "$RUNES_DIR"

# create files with and without runes
echo -e "une ligne\nrune: alpha\nautre ligne" > "$LEVEL/parchemin1.txt"
echo -e "rune: beta\nligne" > "$LEVEL/parchemin2.txt"
echo -e "simple ligne" > "$LEVEL/parchemin3.txt"
echo -e "rune: gamma\nrune: delta" > "$LEVEL/parchemin4.txt"

echo
echo "=== Arcane III — Les Runes Éparses ==="
echo "Quête : extraire toutes les lignes contenant 'rune' depuis les parchemins vers le dossier 'runes/'."
echo "Commandes : extraire <parchemin>, verifier, aide, quitter"
echo "Tu as $VIES vies. Une erreur coûte une vie."
echo

lose_life() {
  VIES=$((VIES-1))
  echo "Erreur ! Vies restantes : $VIES"
  if [ $VIES -le 0 ]; then
    echo "Toutes les vies perdues. Retour à l'Arcane II..."
    bash "$DIR/arcane2.sh"
    exit 0
  fi
}

while [ $VIES -gt 0 ]; do
  read -rp "arcane3>> " line
  cmd=( $line )
  case "${cmd[0]:-}" in
    extraire)
      file="${cmd[1]:-}"
      if [ -z "$file" ]; then
        echo "Précise le parchemin à extraire."
        continue
      fi
      src="$LEVEL/$file"
      if [ ! -f "$src" ]; then
        echo "Parchemin introuvable."
        lose_life
        continue
      fi
      grep -i "rune" "$src" > "$RUNES_DIR/$file.runes" || true
      echo "Lignes avec runes extraites dans $RUNES_DIR/$file.runes"
      ;;
    verifier)
      # we expect at least the lines from parchemin1,2,4 (parchemin3 has none)
      count=0
      for f in "$RUNES_DIR"/*.runes 2>/dev/null; do
        [ -s "$f" ] && count=$((count+1))
      done
      if [ $count -ge 3 ]; then
        echo
        echo "✔ Tu as extrait suffisament de runes. L'Arcane III succombe à ta volonté."
        echo "→ Lancement de l'Arcane IV..."
        bash "$DIR/arcane4.sh"
        exit 0
      else
        echo "Il te manque des runes. Continue ton extraction."
        lose_life
      fi
      ;;
    aide|help|\?)
      echo "extraire <parchemin> — extrait les lignes contenant 'rune' du parchemin donné"
      echo "verifier — vérifie si tu as assez de runes pour réussir"
      echo "quitter"
      ;;
    quitter|exit)
      echo "Tu quittes l'Arcane III."
      exit 0
      ;;
    *)
      echo "Incantation inconnue."
      lose_life
      ;;
  esac
done
