# ==========================================
# Script de Vérification Pré-Déploiement
# État Indépendant du Nord
# ==========================================

Clear-Host

Write-Host ""
Write-Host "╔══════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║   État Indépendant du Nord - Vérification du Site   ║" -ForegroundColor Yellow
Write-Host "╚══════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

$allGood = $true
$warnings = @()

# Vérification des fichiers principaux
Write-Host "📋 Vérification des fichiers..." -ForegroundColor White
Write-Host ""

$files = @{
    "index.html" = "Page principale"
    "style.css" = "Feuille de styles"
    "script.js" = "Scripts JavaScript"
    "README.md" = "Documentation"
}

foreach ($file in $files.Keys) {
    if (Test-Path $file) {
        Write-Host "  ✅ $file" -ForegroundColor Green -NoNewline
        Write-Host " - $($files[$file])" -ForegroundColor Gray
    }
    else {
        Write-Host "  ❌ $file manquant !" -ForegroundColor Red
        $allGood = $false
    }
}

Write-Host ""

# Vérification des images
Write-Host "🖼️  Vérification des images..." -ForegroundColor White
Write-Host ""

$logo = Test-Path "assets\logo.png"
$bg = (Test-Path "assets\background.png") -or (Test-Path "assets\background.jpg")

if ($logo) {
    $logoSize = (Get-Item "assets\logo.png").Length / 1KB
    Write-Host "  ✅ logo.png" -ForegroundColor Green -NoNewline
    Write-Host " - $([math]::Round($logoSize, 2)) KB" -ForegroundColor Gray
}
else {
    Write-Host "  ❌ logo.png manquant dans assets/" -ForegroundColor Red
    $allGood = $false
}

if ($bg) {
    if (Test-Path "assets\background.jpg") {
        $bgSize = (Get-Item "assets\background.jpg").Length / 1KB
        Write-Host "  ✅ background.jpg" -ForegroundColor Green -NoNewline
        Write-Host " - $([math]::Round($bgSize, 2)) KB" -ForegroundColor Gray
    }
    else {
        $bgSize = (Get-Item "assets\background.png").Length / 1KB
        Write-Host "  ✅ background.png" -ForegroundColor Green -NoNewline
        Write-Host " - $([math]::Round($bgSize, 2)) KB" -ForegroundColor Gray
    }
}
else {
    Write-Host "  ❌ background.jpg/png manquant dans assets/" -ForegroundColor Red
    $allGood = $false
}

Write-Host ""

# Vérification des liens Discord
Write-Host "🔗 Vérification des liens Discord..." -ForegroundColor White
Write-Host ""

$scriptContent = Get-Content "script.js" -Raw

if ($scriptContent -match "discord\.gg/paleto-repair") {
    Write-Host "  ⚠️  Paleto Repair: Lien par défaut détecté" -ForegroundColor Yellow
    $warnings += "Modifiez le lien Discord pour Paleto Repair dans script.js"
}
else {
    Write-Host "  ✅ Paleto Repair: Lien personnalisé" -ForegroundColor Green
}

if ($scriptContent -match "discord\.gg/stags-restaurant") {
    Write-Host "  ⚠️  Stags: Lien par défaut détecté" -ForegroundColor Yellow
    $warnings += "Modifiez le lien Discord pour Stags dans script.js"
}
else {
    Write-Host "  ✅ Stags: Lien personnalisé" -ForegroundColor Green
}

if ($scriptContent -match "discord\.gg/ltd-paleto") {
    Write-Host "  ⚠️  LTD Paleto: Lien par défaut détecté" -ForegroundColor Yellow
    $warnings += "Modifiez le lien Discord pour LTD Paleto dans script.js"
}
else {
    Write-Host "  ✅ LTD Paleto: Lien personnalisé" -ForegroundColor Green
}

Write-Host ""

# Vérification Git
Write-Host "🔧 Vérification Git..." -ForegroundColor White
Write-Host ""

try {
    $gitVersion = git --version 2>$null
    if ($gitVersion) {
        Write-Host "  ✅ Git installé: $gitVersion" -ForegroundColor Green
    }
}
catch {
    Write-Host "  ❌ Git n'est pas installé !" -ForegroundColor Red
    Write-Host "     Téléchargez-le sur https://git-scm.com/" -ForegroundColor Yellow
    $allGood = $false
}

Write-Host ""

# Résumé
Write-Host "═══════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

if ($allGood -and $warnings.Count -eq 0) {
    Write-Host "  🎉 PARFAIT ! Tout est prêt pour le déploiement !" -ForegroundColor Green
    Write-Host ""
    Write-Host "  Prochaine étape:" -ForegroundColor White
    Write-Host "  → Double-cliquez sur deploy.ps1" -ForegroundColor Yellow
    Write-Host "  → Ou suivez le guide dans QUICK_START.md" -ForegroundColor Yellow
}
elseif ($allGood -and $warnings.Count -gt 0) {
    Write-Host "  ⚠️  PRESQUE PRÊT ! Quelques avertissements:" -ForegroundColor Yellow
    Write-Host ""
    foreach ($warning in $warnings) {
        Write-Host "  • $warning" -ForegroundColor Yellow
    }
    Write-Host ""
    Write-Host "  Vous pouvez déployer maintenant et modifier plus tard," -ForegroundColor White
    Write-Host "  ou corriger ces points avant de continuer." -ForegroundColor White
}
else {
    Write-Host "  ❌ DES PROBLÈMES ONT ÉTÉ DÉTECTÉS" -ForegroundColor Red
    Write-Host ""
    Write-Host "  Corrigez les erreurs ci-dessus avant de déployer." -ForegroundColor White
}

Write-Host ""
Write-Host "═══════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# Tester le site localement
Write-Host "💡 Conseil:" -ForegroundColor Cyan
Write-Host "   Pour tester le site localement, ouvrez index.html" -ForegroundColor White
Write-Host "   dans votre navigateur avant de déployer." -ForegroundColor White
Write-Host ""

# Statistiques du site
Write-Host "📊 Statistiques du site:" -ForegroundColor Cyan
$htmlLines = (Get-Content "index.html").Count
$cssLines = (Get-Content "style.css").Count
$jsLines = (Get-Content "script.js").Count
$totalLines = $htmlLines + $cssLines + $jsLines

Write-Host "   HTML: $htmlLines lignes | CSS: $cssLines lignes | JS: $jsLines lignes" -ForegroundColor Gray
Write-Host "   Total: $totalLines lignes de code" -ForegroundColor Gray
Write-Host ""

Write-Host "Respect • Honneur • Patrie 🏔️" -ForegroundColor Cyan
Write-Host ""

Read-Host "Appuyez sur Entrée pour fermer"
