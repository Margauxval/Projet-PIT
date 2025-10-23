# Projet-PIT
Faire un jeu pour apprendre à utiliser les commandes UNIX
# Jeu UNIX : Apprenti Bashicien

## Principe

Tu incarnes un **apprenti mage du système UNIX**.  
Chaque commande correcte est un **sort réussi**.  
Chaque erreur de syntaxe ou de logique provoque un **“échec magique”** (le terminal t’envoie un message d’erreur mystérieux et tu recommences à l’étape 1).  

**Ton but** : obtenir le titre **Bashicien** en réussissant une série d’épreuves, chacune correspondant à un concept Unix (fichiers, redirections, pipes, processus, variables, etc.).

---

## Structure du jeu

Le jeu se découpe en **5 niveaux**, chacun représentant un cercle de magie ou “arcane”.  
Chaque arcane introduit de nouvelles commandes et mécaniques.

### Arcane I — L’Arcane de la Découverte

> “Tout mage commence dans l’ombre. Pour trouver la lumière, il faut explorer les profondeurs d’UNIX.”

Le jeune apprenti se réveille dans le **Sanctuaire du Terminal**.  
Son grimoire de magix a disparu. Il doit apprendre à explorer son environnement, à lire les signes cachés et à retrouver son premier sort.

**Objectif :**  
- Explorer les répertoires du sanctuaire.  
- Trouver le fichier caché `.grimoire_secret.txt`.  
- Lire son contenu pour apprendre le mot magique : `catulus`, le sort de révélation.

**Sort final :**  
- Le joueur découvre un **Spectre du Néant**, créature invisible.  
- Pour le vaincre, il doit révéler ce qui est caché.

**Commandes à utiliser :**  
ls, ls -a, cd, cat, pwd


> “Le Spectre se dissipe dans la brume. Le grimoire réapparaît entre tes mains.”

---

### Arcane II — L’Arcane des Éléments

> “Les quatre forces du monde reposent dans les fichiers. Seul celui qui sait les rassembler peut invoquer la vraie puissance.”

Le mage doit retrouver les **pierres élémentaires** : `feu.txt`, `eau.txt`, `air.txt`, `terre.txt`, dispersées dans le répertoire.  
Les réunir permet d’équilibrer la magie d’UNIX.

**Objectif :**  
- Créer un réceptacle `elements/`.  
- Y placer les quatre fichiers élémentaires.

**Sort final :**  
- Un **Golem chaotique** surgit, créé par le déséquilibre des éléments.  
- Le mage doit unir les quatre pierres pour le dissoudre.

**Commandes à utiliser :**  
mkdir, mv


> “Les pierres fusionnent dans une lumière aveuglante. Le Golem se désintègre en poussière numérique.”

---

### Arcane III — L’Arcane de la Transmutation

> “Les mots ont un pouvoir. Transforme-les, filtre-les, combine-les — et ils deviendront magix.”

Le mage découvre un vieux **parchemin de runes** : `parchemin.txt`.  
Certaines lignes renferment des secrets interdits : il faut les extraire avec discernement.

**Objectif :**  
- Trouver toutes les lignes contenant le mot `rune`.  
- Les enregistrer dans un nouveau fichier `runes.txt`.

**Sort final :**  
- Un **Esprit des Mots** surgit du parchemin, distordant les textes du sanctuaire.  
- Le mage canalise les flux de données pour reformer les runes.

**Commandes à utiliser :**  
cat, grep, |, >


> “Les runes brillent d’une lumière dorée. L’Esprit s’incline et disparaît dans les lignes du code.”

---

### Arcane IV — L’Arcane du Nettoyage

> “Toute création engendre des impuretés. Seul celui qui sait purifier le système peut empêcher la corruption.”

Le sanctuaire est envahi par des artefacts corrompus, fichiers maudits dispersés dans l’arborescence.  
Le mage doit les localiser et les détruire avant qu’ils ne contaminent tout le système.

**Objectif :**  
- Trouver tous les fichiers contenant `corrompu` dans leur nom.  
- Les supprimer proprement.

**Sort final :**  
- Un **Ver de Données** se nourrit des fichiers infectés et s’étend dans les sous-dossiers.  
- Le mage récite la Formule de Purge.

**Commandes à utiliser :**  
find, rm


> “Le Ver hurle et se dissout dans le néant du Shell. Le sanctuaire retrouve sa clarté.”

---

### Arcane V — L’Arcane de la Convergence

> “Le vrai pouvoir ne réside pas dans la création, mais dans la maîtrise. Scelle ton savoir dans une archive éternelle.”

Ayant vaincu la corruption, le mage doit maintenant rassembler toute sa connaissance pour affronter la **dernière entité** :  
le **Daemon Suprême**, esprit du système UNIX lui-même.

**Objectif :**  
- Créer une grande archive magique contenant les éléments et les runes.  
- Préparer la compression ultime.

**Sort final :**  
- Le Daemon Suprême émerge du Kernel.  
- Le mage scelle tout son savoir dans une archive sacrée.

**Commandes à utiliser :**  
tar -czvf

> “Le Daemon est enfermé dans l’archive. Le terminal se tait. Le titre de Maître du Bashicien t’est décerné.”
---

## Épilogue — Le Maître Bashicien

Les lignes de commande deviennent des **incantations**. Le terminal, ton grimoire.  
Tu n’es plus un apprenti. Tu es désormais...  

# **Le Maître Bashicien, Archimage du Système UNIX**

