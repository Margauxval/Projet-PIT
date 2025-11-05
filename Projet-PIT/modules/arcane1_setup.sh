#!/usr/bin/env bash
SANCTUAIRE=./sanctuaire
GRIMOIRE=.grimoire_secret.txt

mkdir -p "$SANCTUAIRE"
[ ! -f "$SANCTUAIRE/$GRIMOIRE" ] && echo "catulus" > "$SANCTUAIRE/$GRIMOIRE"

echo "Arcane I prêt."
echo "Ton grimoire de Bashicien recueillant toutes tes formules magiques s'est volatilisé ! Il faut que tu le retrouves"
echo "Explore le sanctuaire : $SANCTUAIRE"
echo "Quand tu penses avoir trouvé le grimoire, lance : ./modules/verify_arcane1.sh"
