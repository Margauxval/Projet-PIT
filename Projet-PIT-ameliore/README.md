# Projet-PIT — Apprenti Bashicien  
*Jeu d’apprentissage des commandes UNIX sous forme de quête magique*

---

## Introduction

Bienvenue, jeune mage du Shell.  
Tu t’apprêtes à entreprendre le **Rituel du Bashicien**, une quête initiatique à travers les mystères du terminal UNIX.  
Chaque commande juste est un **sort réussi**, chaque erreur un **échec magique**.  

Ton objectif : maîtriser les cinq Arcanes et devenir **Maître Bashicien**.

---

## Installation & Démarrage du jeu

### 1. Clone le dépôt depuis GitHub
```bash
git clone https://github.com/Margauxval/Projet-PIT.git
cd Projet-PIT
```
### 2. Donne les droits d’exécution aux scripts
```bash
chmod +x start.sh modules/*.sh
```
### 3. Lance le jeu
```bash
bash start.sh
```
Le jeu commence directement dans ton terminal normal — aucune restriction d’environnement.
Tu es libre d’utiliser toutes les commandes UNIX.
Chaque Arcane te donne un objectif à accomplir manuellement, puis tu lances la **vérification** toi-même.

---

## Règles générales

- Tu disposes de **3 vies par Arcane**.
- Chaque échec à la vérification te fait **perdre 1 vie**.
- Si toutes les vies sont perdues : **retour à l’Arcane précédent**.
- Tu décides **quand vérifier ta réussite**
- Les vérifications fonctionnent depuis n’importe quel répertoire.
- Tes vies sont enregistrées automatiquement dans des fichiers internes

---

## Arcane I — L’Arcane de la Découverte

### Objectif
Trouver le fichier caché .grimoire_secret.txt et lire le mot magique catulus.

### Etapes
```bash
# Cherche le grimoire caché
find . -type f -name ".grimoire_secret.txt"

# Lis son contenu
cat ./chemin/vers/.grimoire_secret.txt

# Vérification
bash modules/verifier_arcane1.sh
```
Si le fichier contient le mot catulus, tu passes à l’Arcane II.

## Arcane II — L’Arcane des Éléments

### Objectif
Rassembler les fichiers feu.txt, eau.txt, air.txt, terre.txt dans un dossier receptacle/.

### Etapes
```bash
# Cherche les fichiers élémentaires
find . -type f \( -name "feu.txt" -o -name "eau.txt" -o -name "air.txt" -o -name "terre.txt" \)

# Crée le réceptacle et déplace les fichiers
mkdir -p receptacle
mv chemin/vers/feu.txt receptacle/
mv chemin/vers/eau.txt receptacle/
mv chemin/vers/air.txt receptacle/
mv chemin/vers/terre.txt receptacle/

# Vérifie leur présence
ls -la receptacle

# Vérification
bash modules/verifier_arcane2.sh
```
Si le fichier contient les 4 éléments, tu passes à l’Arcane III.

## Arcane III — L’Arcane de la Transmutation

### Objectif
Extraire toutes les lignes contenant rune dans un fichier runes.txt ou un dossier runes/.

### Etapes
```bash
# Trouve les parchemins
find . -type f -name "parchemin*.txt"

# Extrait les lignes contenant "rune"
grep -i "rune" $(find . -type f -name "parchemin*.txt") > runes.txt

# Vérifie le résultat
cat runes.txt

# Vérification
bash modules/verifier_arcane3.sh
```
Si toutes les runes ont été réunies, tu passes à l’Arcane IV.

## Arcane IV — L’Arcane du Nettoyage

### Objectif
Supprimer tous les fichiers corrompus (*corrupt* ou *.corrupt).

### Etapes
```bash
# Liste les fichiers corrompus
find . -type f -iname "*corrupt*"

# Supprime-les proprement
find . -type f -iname "*corrupt*" -exec rm -v {} \;

# Vérifie qu’il n’en reste plus
find . -type f -iname "*corrupt*" || echo "Le Sanctuaire est purifié."

# Vérification
bash modules/verifier_arcane4.sh
```
Si tout a été nettoyé, tu passes à l’Arcane V.

## Arcane V — L’Arcane de la Convergence

### Objectif
Créer une archive finale.tar.gz contenant tes artefacts magiques (receptacle/, runes.txt, etc.).

### Etapes
```bash
# Crée l’archive
tar -czf finale.tar.gz receptacle runes.txt

# Vérifie son contenu
tar -tzf finale.tar.gz

# Vérification
bash modules/verifier_arcane5.sh
```
Si tout a été archivé, tu as terminé le jeu.

Tu es maintenant un **Maître Bashicien**.


