# 🚀 Guide de Déploiement Rapide sur GitHub Pages

## Étape 1 : Ajouter vos Images ⚠️

**AVANT TOUT**, vous devez ajouter vos images dans le dossier `assets/` :

1. Prenez l'image du logo (l'écusson avec l'aigle)
2. Renommez-la en `logo.png`
3. Placez-la dans le dossier `assets/`

4. Prenez l'image d'arrière-plan (les montagnes et le village)
5. Renommez-la en `background.png`
6. Placez-la dans le dossier `assets/`

## Étape 2 : Configurer les Liens Discord 🔗

1. Ouvrez le fichier `script.js`
2. Trouvez ces lignes au début du fichier :

```javascript
const discordLinks = {
    'paleto-repair-discord': 'https://discord.gg/paleto-repair',
    'stags-discord': 'https://discord.gg/stags-restaurant',
    'ltd-paleto-discord': 'https://discord.gg/ltd-paleto'
};
```

3. Remplacez les liens par vos véritables liens Discord

## Étape 3 : Créer le Repository GitHub 📦

1. Allez sur [GitHub.com](https://github.com)
2. Cliquez sur le bouton **"New"** (ou "Nouveau repository")
3. Nommez votre repository : `rc_paleto` (ou autre nom)
4. Laissez-le **Public**
5. **NE COCHEZ PAS** "Initialize with README"
6. Cliquez sur **"Create repository"**

## Étape 4 : Pousser votre Code sur GitHub 💻

Ouvrez un terminal dans le dossier du projet et exécutez :

```bash
# Initialiser Git
git init

# Ajouter tous les fichiers
git add .

# Créer le premier commit
git commit -m "Initial commit: Site État Indépendant du Nord"

# Renommer la branche en main
git branch -M main

# Ajouter le lien vers votre repository (REMPLACEZ VOTRE_USERNAME)
git remote add origin https://github.com/VOTRE_USERNAME/rc_paleto.git

# Pousser le code sur GitHub
git push -u origin main
```

**⚠️ IMPORTANT** : Remplacez `VOTRE_USERNAME` par votre nom d'utilisateur GitHub !

## Étape 5 : Activer GitHub Pages 🌐

1. Sur GitHub, allez dans votre repository
2. Cliquez sur **"Settings"** (Paramètres)
3. Dans le menu de gauche, cliquez sur **"Pages"**
4. Dans **"Source"** (Source), sélectionnez **"main"** branch
5. Cliquez sur **"Save"** (Enregistrer)

## Étape 6 : Accéder à votre Site ✅

Votre site sera disponible à l'adresse :

```
https://VOTRE_USERNAME.github.io/rc_paleto/
```

**Note** : Le déploiement peut prendre 1-2 minutes. Soyez patient !

---

## 🔧 Mettre à Jour le Site

Pour mettre à jour votre site après des modifications :

```bash
# Ajouter les fichiers modifiés
git add .

# Créer un commit avec un message descriptif
git commit -m "Mise à jour: description de vos changements"

# Pousser sur GitHub
git push
```

Les changements seront automatiquement déployés sur GitHub Pages !

---

## ❓ Problèmes Courants

### Les images ne s'affichent pas
- Vérifiez que vos images sont bien dans `assets/logo.png` et `assets/background.png`
- Les noms de fichiers sont sensibles à la casse (minuscules uniquement)

### Le lien Discord ne fonctionne pas
- Vérifiez que vous avez bien modifié `script.js`
- Les liens Discord doivent commencer par `https://discord.gg/`

### Le site ne se charge pas
- Attendez 2-3 minutes après l'activation de GitHub Pages
- Videz le cache de votre navigateur (Ctrl + F5)
- Vérifiez que GitHub Pages est bien activé dans Settings > Pages

---

## 📞 Besoin d'Aide ?

Si vous rencontrez des problèmes :
1. Vérifiez bien chaque étape
2. Regardez les erreurs dans la console du navigateur (F12)
3. Consultez le README.md pour plus d'informations

**Respect • Honneur • Patrie** 🏔️
