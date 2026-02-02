# État Indépendant du Nord - Site de Recrutement

Site vitrine moderne pour les recrutements des entreprises de l'État Indépendant du Nord à Paleto Bay.

## 🏔️ Présentation

Ce site met en valeur trois entreprises qui recrutent activement :
- **Paleto Repair** - Garage mécanique
- **Stags** - Restaurant & Bar
- **LTD Paleto** - Magasin de proximité

## ✨ Fonctionnalités

- Design moderne et responsive
- Animations fluides au scroll
- Effet parallaxe sur le hero
- Particules animées en arrière-plan
- Boutons de copie Discord pour chaque entreprise
- Notifications toast élégantes
- Optimisé pour tous les appareils

## 🎨 Technologies

- HTML5
- CSS3 (animations, gradients, backdrop-filter)
- JavaScript vanilla (pas de framework)
- Font Awesome pour les icônes

## 📁 Structure du Projet

```
rc_paleto/
│
├── index.html          # Page principale
├── style.css           # Styles et animations
├── script.js           # Fonctionnalités interactives
├── assets/
│   ├── logo.png        # Logo de l'État Indépendant du Nord
│   └── background.png  # Image d'arrière-plan
└── README.md           # Ce fichier
```

## 🚀 Installation et Configuration

### 1. Ajouter les Images

**IMPORTANT:** Vous devez ajouter vos images dans le dossier `assets/` :

- Placez votre logo dans `assets/logo.png`
- Placez votre image d'arrière-plan dans `assets/background.png`

### 2. Configurer les Liens Discord

Ouvrez `script.js` et modifiez les liens Discord de vos entreprises :

```javascript
const discordLinks = {
    'paleto-repair-discord': 'https://discord.gg/VOTRE_LIEN_PALETO_REPAIR',
    'stags-discord': 'https://discord.gg/VOTRE_LIEN_STAGS',
    'ltd-paleto-discord': 'https://discord.gg/VOTRE_LIEN_LTD'
};
```

## 🌐 Déploiement sur GitHub Pages

### Méthode 1 : Via l'interface GitHub

1. **Créer un repository sur GitHub**
   - Allez sur GitHub et créez un nouveau repository
   - Nommez-le `rc_paleto` (ou un autre nom)
   - Ne cochez pas "Initialize with README"

2. **Pousser votre code**
   ```bash
   git init
   git add .
   git commit -m "Initial commit: Site de recrutement État Indépendant du Nord"
   git branch -M main
   git remote add origin https://github.com/VOTRE_USERNAME/rc_paleto.git
   git push -u origin main
   ```

3. **Activer GitHub Pages**
   - Allez dans les Settings de votre repository
   - Cliquez sur "Pages" dans le menu de gauche
   - Dans "Source", sélectionnez "main" branch
   - Cliquez sur "Save"
   - Votre site sera disponible à `https://VOTRE_USERNAME.github.io/rc_paleto/`

### Méthode 2 : Via la ligne de commande

```bash
# Initialiser Git (si pas déjà fait)
git init

# Ajouter tous les fichiers
git add .

# Créer le commit initial
git commit -m "Initial commit: Site de recrutement"

# Renommer la branche en main
git branch -M main

# Ajouter le remote (remplacez VOTRE_USERNAME)
git remote add origin https://github.com/VOTRE_USERNAME/rc_paleto.git

# Pousser sur GitHub
git push -u origin main
```

## 📝 Personnalisation

### Changer les Couleurs

Dans `style.css`, modifiez les variables CSS :

```css
:root {
    --color-primary: #2c5f7c;      /* Couleur principale */
    --color-accent: #f4a460;       /* Couleur d'accent */
    --color-garage: #e74c3c;       /* Couleur Paleto Repair */
    --color-restaurant: #f39c12;   /* Couleur Stags */
    --color-magasin: #27ae60;      /* Couleur LTD Paleto */
}
```

### Modifier le Texte

Tous les textes sont dans `index.html`. Vous pouvez facilement modifier :
- Le titre principal (Hero section)
- Les descriptions des entreprises
- Les informations de contact

### Ajouter d'Autres Entreprises

Pour ajouter une nouvelle entreprise, copiez une des cards existantes dans `index.html` et modifiez :
- Le titre (`card-title`)
- Le type (`card-type`)
- La description (`card-description`)
- Les tags (`card-tags`)
- Le lien Discord dans `script.js`

## 🎯 Améliorations Futures Possibles

- Formulaire de candidature intégré
- Section témoignages d'employés
- Galerie photos des entreprises
- Intégration d'une carte interactive
- Mode sombre/clair
- Multilingue (FR/EN)

## 📱 Compatibilité

- ✅ Chrome, Firefox, Safari, Edge (dernières versions)
- ✅ Responsive : Desktop, Tablette, Mobile
- ✅ Animations GPU-accelerated pour des performances optimales

## 🤝 Support

Pour toute question ou problème :
- Ouvrez une issue sur GitHub
- Contactez-nous sur Discord

## 📜 Licence

Ce projet est libre d'utilisation pour l'État Indépendant du Nord.

---

**Respect • Honneur • Patrie**

*État Indépendant du Nord - Paleto Bay, Blaine County*
