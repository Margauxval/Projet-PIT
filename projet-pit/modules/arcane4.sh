#!/usr/bin/env bash
# arcane4.sh - Arcane du Nettoyage
set -euo pipefail
SANCTUAIRE="${SANDBOX_DIR:-./sanctuaire}"

mkdir -p "$SANCTUAIRE/dossier"
# créer fichiers corrompus
echo "corrompu" > "$SANCTUAIRE/artefact_corrompu_1.txt"
echo "corrompu" > "$SANCTUAIRE/dossier/corrompu_2.txt"

echo
echo "Arcane IV — L'Arcane du Nettoyage"
echo "Objectif : trouver tous les fichiers contenant 'corrompu' dans leur nom et les supprimer."
echo "La corruption rôde dans chaque recoin... il te faut trouver et purifier."
echo

attempts=0
while true; do
  read -r -p "arcane4>> " cmd
  [ -z "$cmd" ] || continue
  if [[ "$cmd" =~ (;|\&\&|\|\||`|\$\(.*\)) ]]; then
    echo "Incantation interdite."
    return 1
  fi
  (cd "$SANCTUAIRE" && bash -c "$cmd") 2>&1 || {
    echo "Échec d'exécution."
    return 1
  }
  # Vérifier qu'aucun fichier corrompu ne reste
  if ! find "$SANCTUAIRE" -name "*corrompu*" -print -quit | grep -q . ; then
    echo
    echo "✔ Le Ver hurle et se dissout. Le sanctuaire retrouve sa clarté."
    return 0
  fi
  attempts=$((attempts+1))
  if [ $attempts -ge 8 ]; then
    echo "Trop d'essais — échec magique."
    return 1
  fi
  echo "Indice : find . -name '*corrompu*' -delete"
done
