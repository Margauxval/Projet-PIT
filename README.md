# Projet-PIT
Faire un jeu pour apprendre à utiliser les commandes UNIX
# Jeu UNIX : Apprenti Bashicien

## Principe

Tu incarnes un **apprenti mage du système UNIX**.  
Chaque commande correcte est un **sort réussi**.  
Chaque erreur de vérification provoque un **“échec magique”** (le terminal t’envoie un message d’erreur mystérieux et tu perds une vie). Lorsque tu as utilisé toutes tes vies tu retourne à l'épreuve précedente.

**Ton but** : obtenir le titre **Bashicien** en réussissant une série d’épreuves, chacune correspondant à un concept Unix.

---

## Structure du jeu

Le jeu se découpe en **5 niveaux**, chacun représentant un cercle de magie ou “arcane”.  
Chaque arcane introduit de nouvelles commandes et mécaniques.

### Arcane I — L’Arcane de la Découverte

Le jeune apprenti se réveille dans le **Sanctuaire du Terminal**.  
Son grimoire de magix a disparu. Il doit apprendre à explorer son environnement, à lire les signes cachés et à retrouver son premier sort.

**Objectif :**  
- Explorer les répertoires du sanctuaire.  
- Trouver le fichier caché `.grimoire_secret.txt`.  
- Lire son contenu pour apprendre le mot magique : `catulus`, le sort de révélation.

**Sort final :**  
Pour passer à l'étape suivante, l'apprenti doit révéler ce qui est caché.

**Commandes à utiliser :**  
ls, ls -a, cd, cat, pwd


> Le mot magique à entrer lors de la vérification est "catulus"

---

### Arcane II — L’Arcane des Éléments

Le mage doit retrouver les **pierres élémentaires** : `feu.txt`, `eau.txt`, `air.txt`, `terre.txt`, dispersées dans le répertoire.  
Les réunir permet d’équilibrer la magie d’UNIX.

**Objectif :**  
- Créer un dossier receptacle  
- Y placer les quatre fichiers élémentaires.

**Sort final :**  
Les quatres éléments sont déplacés dans le réceptacle.

**Commandes à utiliser :**  
mkdir, mv


> Lancement de la vérification

---

### Arcane III — L’Arcane de la Transmutation

Le mage découvre un vieux **parchemin de runes** : `parchemin.txt`.  
Certaines lignes renferment des secrets interdits : il faut les extraire avec discernement.

**Objectif :**  
- Trouver toutes les lignes contenant le mot `rune`.  
- Les enregistrer dans un nouveau fichier `runes.txt`.
- déplacer le fichier dans un dossier runes

**Sort final :**   
- Le mage canalise les flux de données pour reformer les runes.

**Commandes à utiliser :**  
cat, grep, |, >


> Lancement de la vérification

---

### Arcane IV — L’Arcane du Nettoyage

Le sanctuaire est envahi par des artefacts corrompus, fichiers maudits dispersés dans l’arborescence.  
Le mage doit les localiser et les détruire avant qu’ils ne contaminent tout le système.

**Objectif :**  
- Trouver tous les fichiers contenant `corrompu` dans leur nom.  
- Les supprimer proprement.

**Sort final :**    
- Le mage récite la Formule de Purge.

**Commandes à utiliser :**  
find, rm


> Lancement de la vérification

---

### Arcane V — L’Arcane de la Convergence

Ayant vaincu la corruption, le mage doit maintenant rassembler toute sa connaissance pour devenir **Maître Bashicien**.

**Objectif :**  
- Créer une grande archive magique contenant les éléments et les runes.  
- Préparer la compression ultime.

**Sort final :**   
- Le mage scelle tout son savoir dans une archive sacrée.

**Commandes à utiliser :**  
tar -czvf

> Lancement de la vérification
---

## Épilogue — Le Maître Bashicien

Les lignes de commande deviennent des **incantations**. Le terminal, ton grimoire.  
Tu n’es plus un apprenti. Tu es désormais...  

# **Le Maître Bashicien, Archimage du Système UNIX**

