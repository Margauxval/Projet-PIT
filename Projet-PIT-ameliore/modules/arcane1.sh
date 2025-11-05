#!/usr/bin/env bash
# Arcane I — L'Arcane de la Découverte
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SANCTUAIRE="$DIR/arcane1_sanctuaire"
GRIMOIRE="$SANCTUAIRE/.grimoire_secret.txt"
VIES=3
SECRET="catulus"

mkdir -p "$SANCTUAIRE"
if [ ! -f "$GRIMOIRE" ]; then
  echo "$SECRET" > "$GRIMOIRE"
fi

echo
echo "=== Arcane I — L'Arcane de la Découverte ==="
echo "Apprenti mage, tu te réveilles dans le sanctuaire du terminal."
echo "Ton grimoire a disparu. Découvre le mot magique caché dans le sanctuaire."
echo "Tu as $VIES vies. Une erreur fait perdre une vie."
echo

while [ $VIES -gt 0 ]; do
  read -rp "arcane1>> " cmd
  case "$cmd" in
    lire|lire\ grimoire|regarder|lire\ grimoire\ secret)
      echo "Tu ouvres ton grimoire..."
      echo "Contenu :"
      sed -n '1,3p' "$GRIMOIRE"
      ;;
    mot|mot\ magique|deviner|essayer*)
      # prompt for guess
      read -rp "Quel est le mot magique ? " guess
      if [ "$guess" = "$SECRET" ]; then
        echo
        echo "✔ Le Spectre se dissipe. Tu as appris le mot magique : $SECRET"
        echo "→ Lancement de l'Arcane II..."
        bash "$DIR/arcane2.sh"
        exit 0
      else
        VIES=$((VIES-1))
        echo "Incantation ratée ! Vies restantes : $VIES"
        [ $VIES -le 0 ] && echo "Tu as tout perdu... Retour au début du jeu." && exit 1
      fi
      ;;
    aide|help|\?)
      echo "Commandes possibles : lire, mot, deviner, aide, quitter"
      ;;
    quitter|exit)
      echo "Tu abandonnes l'Arcane I."
      exit 0
      ;;
    *)
      echo "Une énergie chaotique perturbe ton incantation !"
      VIES=$((VIES-1))
      echo "Vies restantes : $VIES"
      [ $VIES -le 0 ] && echo "Tu as tout perdu... Retour au début du jeu." && exit 1
      ;;
  esac
done
