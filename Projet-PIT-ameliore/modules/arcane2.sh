#!/usr/bin/env bash
# Arcane II — Les Éléments Dispersés
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LEVEL="$DIR/arcane2_level"
RECEPTACLE="$LEVEL/receptacle"
VIES=3
ELEMENTS=(feu eau air terre)

# prepare level
rm -rf "$LEVEL"
mkdir -p "$LEVEL" "$RECEPTACLE"
for e in "${ELEMENTS[@]}"; do
  echo "Element: $e" > "$LEVEL/$e.txt"
done
# scatter files into a subfolder 'haunt'
mkdir -p "$LEVEL/haunt"
for f in "$LEVEL"/*.txt; do
  mv "$f" "$LEVEL/haunt/$(basename "$f")"
done

echo
echo "=== Arcane II — Les Éléments Dispersés ==="
echo "Quête : rassembler les quatre éléments (feu, eau, air, terre) dans le receptacle."
echo "Tu as $VIES vies. Chaque erreur coûte une vie."
echo "Commandes : prendre <élément>, déposer <élément>, inventaire, aide, quitter"
echo

inventory=()

lose_life() {
  VIES=$((VIES-1))
  echo "Erreur ! Vies restantes : $VIES"
  if [ $VIES -le 0 ]; then
    echo "Toutes les vies perdues. Retour à l'Arcane I..."
    bash "$DIR/arcane1.sh"
    exit 0
  fi
}

while [ $VIES -gt 0 ]; do
  read -rp "arcane2>> " line
  cmd=( $line )
  case "${cmd[0]:-}" in
    prendre)
      item="${cmd[1]:-}"
      if [ -z "$item" ]; then
        echo "Précise quel élément prendre."
        continue
      fi
      src="$LEVEL/haunt/$item.txt"
      if [ -f "$src" ]; then
        inventory+=("$item")
        echo "Tu as pris : $item"
        rm -f "$src"
      else
        echo "Tu ne trouves pas $item ici."
        lose_life
      fi
      ;;
    deposer|déposer)
      item="${cmd[1]:-}"
      if [ -z "$item" ]; then
        echo "Précise quel élément déposer."
        continue
      fi
      # check in inventory
      found=0
      for i in "${!inventory[@]}"; do
        if [ "${inventory[i]}" = "$item" ]; then
          found=1
          unset 'inventory[i]'
          echo "Tu as déposé $item dans le receptacle."
          echo "Element: $item" > "$RECEPTACLE/$item.txt"
          break
        fi
      done
      if [ $found -eq 0 ]; then
        echo "Tu n'as pas $item dans ton inventaire."
        lose_life
      fi
      ;;
    inventaire)
      if [ ${#inventory[@]} -eq 0 ]; then
        echo "Ton inventaire est vide."
      else
        echo "Inventaire: ${inventory[*]}"
      fi
      ;;
    aide|help|\?)
      echo "prendre <élément> — prend un élément dans la zone"
      echo "deposer <élément> — dépose un élément dans le receptacle"
      echo "inventaire, aide, quitter"
      ;;
    quitter|exit)
      echo "Tu quittes l'Arcane II."
      exit 0
      ;;
    *)
      echo "Incantation incompréhensible."
      lose_life
      ;;
  esac

  # check victory
  success=1
  for e in "${ELEMENTS[@]}"; do
    if [ ! -f "$RECEPTACLE/$e.txt" ]; then
      success=0
      break
    fi
  done
  if [ $success -eq 1 ]; then
    echo
    echo "✔ Les éléments sont réunis. Tu maîtrises l'Arcane II."
    echo "→ Lancement de l'Arcane III..."
    bash "$DIR/arcane3.sh"
    exit 0
  fi
done
