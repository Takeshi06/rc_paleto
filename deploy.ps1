# ==========================================
# Script de Déploiement GitHub Pages
# État Indépendant du Nord
# ==========================================

Write-Host "================================================" -ForegroundColor Cyan
Write-Host "   Déploiement - État Indépendant du Nord" -ForegroundColor Yellow
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

# Vérifier si les images sont présentes
Write-Host "Vérification des images..." -ForegroundColor White

$logoExists = Test-Path "assets\logo.png"
$bgExists = (Test-Path "assets\background.png") -or (Test-Path "assets\background.jpg")

if (-not $logoExists) {
    Write-Host "❌ ATTENTION: logo.png manquant dans assets/" -ForegroundColor Red
    Write-Host "   Ajoutez votre logo avant de continuer!" -ForegroundColor Yellow
}
else {
    Write-Host "✅ logo.png trouvé" -ForegroundColor Green
}

if (-not $bgExists) {
    Write-Host "❌ ATTENTION: background.jpg/png manquant dans assets/" -ForegroundColor Red
    Write-Host "   Ajoutez votre arrière-plan avant de continuer!" -ForegroundColor Yellow
}
else {
    Write-Host "✅ background.png trouvé" -ForegroundColor Green
}

Write-Host ""

# Si les images manquent, demander confirmation
if (-not $logoExists -or -not $bgExists) {
    $continue = Read-Host "Voulez-vous continuer quand même? (o/N)"
    if ($continue -ne "o" -and $continue -ne "O") {
        Write-Host "Déploiement annulé. Ajoutez vos images et relancez le script." -ForegroundColor Yellow
        exit
    }
}

# Demander le nom d'utilisateur GitHub
Write-Host "Configuration Git" -ForegroundColor Cyan
Write-Host "-----------------" -ForegroundColor Cyan
$username = Read-Host "Entrez votre nom d'utilisateur GitHub"

if ([string]::IsNullOrWhiteSpace($username)) {
    Write-Host "❌ Nom d'utilisateur invalide!" -ForegroundColor Red
    exit
}

# Demander le nom du repository
$repoName = Read-Host "Nom du repository (défaut: rc_paleto)"
if ([string]::IsNullOrWhiteSpace($repoName)) {
    $repoName = "rc_paleto"
}

Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "Configuration:" -ForegroundColor White
Write-Host "  GitHub User: $username" -ForegroundColor Yellow
Write-Host "  Repository: $repoName" -ForegroundColor Yellow
Write-Host "  URL finale: https://$username.github.io/$repoName/" -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

$confirm = Read-Host "Confirmer et continuer? (o/N)"
if ($confirm -ne "o" -and $confirm -ne "O") {
    Write-Host "Déploiement annulé." -ForegroundColor Yellow
    exit
}

Write-Host ""
Write-Host "🚀 Démarrage du déploiement..." -ForegroundColor Green
Write-Host ""

# Initialiser Git si nécessaire
if (-not (Test-Path ".git")) {
    Write-Host "Initialisation de Git..." -ForegroundColor White
    git init
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Erreur lors de l'initialisation de Git" -ForegroundColor Red
        exit
    }
    Write-Host "✅ Git initialisé" -ForegroundColor Green
}

# Ajouter tous les fichiers
Write-Host "Ajout des fichiers..." -ForegroundColor White
git add .
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erreur lors de l'ajout des fichiers" -ForegroundColor Red
    exit
}
Write-Host "✅ Fichiers ajoutés" -ForegroundColor Green

# Créer le commit
Write-Host "Création du commit..." -ForegroundColor White
git commit -m "Initial commit: Site État Indépendant du Nord - Paleto Bay"
if ($LASTEXITCODE -ne 0) {
    Write-Host "⚠️ Aucun changement à commiter ou erreur" -ForegroundColor Yellow
}
else {
    Write-Host "✅ Commit créé" -ForegroundColor Green
}

# Renommer la branche en main
Write-Host "Configuration de la branche main..." -ForegroundColor White
git branch -M main
Write-Host "✅ Branche configurée" -ForegroundColor Green

# Ajouter le remote
Write-Host "Ajout du repository distant..." -ForegroundColor White
$remoteUrl = "https://github.com/$username/$repoName.git"

# Supprimer l'ancien remote s'il existe
git remote remove origin 2>$null

git remote add origin $remoteUrl
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erreur lors de l'ajout du remote" -ForegroundColor Red
    exit
}
Write-Host "✅ Remote ajouté: $remoteUrl" -ForegroundColor Green

# Pousser sur GitHub
Write-Host ""
Write-Host "📤 Push vers GitHub..." -ForegroundColor White
Write-Host "   (Vous devrez peut-être vous authentifier)" -ForegroundColor Yellow
Write-Host ""

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "================================================" -ForegroundColor Green
    Write-Host "   ✅ DÉPLOIEMENT RÉUSSI!" -ForegroundColor Green
    Write-Host "================================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Prochaines étapes:" -ForegroundColor Cyan
    Write-Host "1. Allez sur: https://github.com/$username/$repoName" -ForegroundColor White
    Write-Host "2. Cliquez sur 'Settings' > 'Pages'" -ForegroundColor White
    Write-Host "3. Dans 'Source', sélectionnez 'main' branch" -ForegroundColor White
    Write-Host "4. Cliquez sur 'Save'" -ForegroundColor White
    Write-Host ""
    Write-Host "Votre site sera disponible à:" -ForegroundColor Cyan
    Write-Host "https://$username.github.io/$repoName/" -ForegroundColor Green
    Write-Host ""
    Write-Host "⏱️ Le déploiement peut prendre 1-2 minutes." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Respect • Honneur • Patrie 🏔️" -ForegroundColor Cyan
}
else {
    Write-Host ""
    Write-Host "❌ Erreur lors du push vers GitHub" -ForegroundColor Red
    Write-Host ""
    Write-Host "Vérifiez:" -ForegroundColor Yellow
    Write-Host "- Que le repository existe sur GitHub" -ForegroundColor White
    Write-Host "- Vos identifiants GitHub" -ForegroundColor White
    Write-Host "- Votre connexion internet" -ForegroundColor White
}

Write-Host ""
Read-Host "Appuyez sur Entrée pour fermer"
