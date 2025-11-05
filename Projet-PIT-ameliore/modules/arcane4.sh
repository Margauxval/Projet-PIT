#!/usr/bin/env bash
# Arcane IV — Les Fichiers Corrompus
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LEVEL="$DIR/arcane4_level"
VIES=3

rm -rf "$LEVEL"
mkdir -p "$LEVEL"
# create files, mark some as CORROMPU
echo "important" > "$LEVEL/good1.txt"
echo "CORROMPU" > "$LEVEL/bad1.corrupt"
echo "CORROMPU" > "$LEVEL/bad2.corrupt"
echo "important" > "$LEVEL/good2.txt"

echo
echo "=== Arcane IV — Les Fichiers Corrompus ==="
echo "Quête : supprimer tous les fichiers corrompus (ceux finissant par .corrupt)."
echo "Commandes : supprimer <fichier>, lister, verifier, aide, quitter"
echo "Tu as $VIES vies. Une erreur coûte une vie."
echo

lose_life() {
  VIES=$((VIES-1))
  echo "Erreur ! Vies restantes : $VIES"
  if [ $VIES -le 0 ]; then
    echo "Toutes les vies perdues. Retour à l'Arcane III..."
    bash "$DIR/arcane3.sh"
    exit 0
  fi
}

while [ $VIES -gt 0 ]; do
  read -rp "arcane4>> " line
  cmd=( $line )
  case "${cmd[0]:-}" in
    supprimer)
      file="${cmd[1]:-}"
      if [ -z "$file" ]; then
        echo "Précise le fichier à supprimer."
        continue
      fi
      target="$LEVEL/$file"
      if [ -f "$target" ]; then
        rm -f "$target"
        echo "Fichier $file supprimé."
      else
        echo "Fichier introuvable."
        lose_life
      fi
      ;;
    lister)
      ls -la "$LEVEL"
      ;;
    verifier)
      shopt -s nullglob
      corrupt=( "$LEVEL"/*.corrupt )
      if [ ${#corrupt[@]} -eq 0 ]; then
        echo
        echo "✔ Les fichiers corrompus ont disparu. Tu maîtrises l'Arcane IV."
        echo "→ Lancement de l'Arcane V..."
        bash "$DIR/arcane5.sh"
        exit 0
      else
        echo "Il reste des fichiers corrompus :"
        printf '%s\n' "${corrupt[@]}"
        lose_life
      fi
      ;;
    aide|help|\?)
      echo "supprimer <fichier> — supprime le fichier indiqué dans le niveau"
      echo "lister — affiche les fichiers du niveau"
      echo "verifier — vérifie si tous les .corrupt ont été supprimés"
      echo "quitter"
      ;;
    quitter|exit)
      echo "Tu quittes l'Arcane IV."
      exit 0
      ;;
    *)
      echo "Incantation inattendue."
      lose_life
      ;;
  esac
done
