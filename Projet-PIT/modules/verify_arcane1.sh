#!/usr/bin/env bash
SANCTUAIRE="$(dirname "$0")/../sanctuaire"
GRIMOIRE=.grimoire_secret.txt
if [ -f "$SANCTUAIRE/$GRIMOIRE" ] && grep -q "catulus" "$SANCTUAIRE/$GRIMOIRE"; then
echo "✔ Félicitations ! Tu as appris le mot magique : catulus"
exit 0
else
echo "❌ Échec : le grimoire n'a pas encore été trouvé ou lu correctement."
exit 1
fi
