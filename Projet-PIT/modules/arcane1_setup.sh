#!/usr/bin/env bash
SANCTUAIRE=./sanctuaire
GRIMOIRE=.grimoire_secret.txt
mkdir -p "$SANCTUAIRE"
if [ ! -f "$SANCTUAIRE/$GRIMOIRE" ]; then
echo "catulus" > "$SANCTUAIRE/$GRIMOIRE"
fi

echo "Arcane I prêt. Explore le sanctuaire : $SANCTUAIRE"
echo "Quand tu penses avoir trouvé le grimoire, lance : ./modules/verify_arcane1.sh"
