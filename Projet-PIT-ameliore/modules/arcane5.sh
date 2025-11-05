#!/usr/bin/env bash
# Arcane V — L'Archive Finale
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LEVEL="$DIR/arcane5_level"
VIES=3
ARCHIVE="$DIR/arcane_final.tar.gz"

rm -rf "$LEVEL"
mkdir -p "$LEVEL/assets"
echo "page1" > "$LEVEL/assets/letter.txt"
echo "sigil" > "$LEVEL/assets/sigil.txt"
echo "notes" > "$LEVEL/notes.txt"

echo
echo "=== Arcane V — L'Archive Finale ==="
echo "Quête : créer l'archive finale contenant 'assets/' et 'notes.txt'."
echo "Commandes : archiver, verifier, aide, quitter"
echo "Tu as $VIES vies. Une erreur coûte une vie."
echo

lose_life() {
  VIES=$((VIES-1))
  echo "Erreur ! Vies restantes : $VIES"
  if [ $VIES -le 0 ]; then
    echo "Toutes les vies perdues. Retour à l'Arcane IV..."
    bash "$DIR/arcane4.sh"
    exit 0
  fi
}

while [ $VIES -gt 0 ]; do
  read -rp "arcane5>> " cmd
  case "$cmd" in
    archiver)
      tar -czf "$ARCHIVE" -C "$LEVEL" .
      echo "Archive créée : $ARCHIVE"
      ;;
    verifier)
      if [ -f "$ARCHIVE" ]; then
        tmpdir="$(mktemp -d)"
        tar -xzf "$ARCHIVE" -C "$tmpdir"
        if [ -d "$tmpdir/assets" ] && [ -f "$tmpdir/notes.txt" ]; then
          rm -rf "$tmpdir"
          echo
          echo "✔ Tu as créé l'archive finale. L'Ordre te reconnaît comme Apprenti accompli."
          echo "=== FIN DU JEU ==="
          exit 0
        else
          rm -rf "$tmpdir"
          echo "L'archive ne contient pas les éléments requis."
          lose_life
        fi
      else
        echo "Aucune archive trouvée. Utilise 'archiver' pour la créer."
        lose_life
      fi
      ;;
    aide|help|\?)
      echo "archiver — crée l'archive finale (tar.gz)"
      echo "verifier — vérifie le contenu de l'archive"
      echo "quitter"
      ;;
    quitter|exit)
      echo "Tu quittes l'Arcane V."
      exit 0
      ;;
    *)
      echo "Incantation floue."
      lose_life
      ;;
  esac
done
