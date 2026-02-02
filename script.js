// ===========================================
// ÉTAT INDÉPENDANT DU NORD - RECRUTEMENTS
// ===========================================

// Configuration des liens Discord
const discordLinks = {
    'paleto-repair-discord': 'https://discord.gg/paleto-repair',
    'stags-discord': 'https://discord.gg/stags-restaurant',
    'ltd-paleto-discord': 'https://discord.gg/ltd-paleto'
};

// ===========================================
// COPIE DU DISCORD
// ===========================================
function setupDiscordButtons() {
    const buttons = document.querySelectorAll('.discord-btn');
    
    buttons.forEach(button => {
        button.addEventListener('click', () => {
            const discordKey = button.getAttribute('data-discord');
            const discordLink = discordLinks[discordKey];
            
            if (discordLink) {
                navigator.clipboard.writeText(discordLink).then(() => {
                    showToast();
                    
                    // Effet visuel sur le bouton
                    button.style.transform = 'scale(0.95)';
                    setTimeout(() => {
                        button.style.transform = '';
                    }, 150);
                }).catch(err => {
                    console.error('Erreur:', err);
                });
            }
        });
    });
}

// ===========================================
// NOTIFICATION TOAST
// ===========================================
function showToast() {
    const toast = document.getElementById('toast');
    toast.classList.add('show');
    
    setTimeout(() => {
        toast.classList.remove('show');
    }, 3000);
}

// ===========================================
// SMOOTH SCROLL
// ===========================================
function setupSmoothScroll() {
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
}

// ===========================================
// INITIALISATION
// ===========================================
document.addEventListener('DOMContentLoaded', () => {
    setupDiscordButtons();
    setupSmoothScroll();
    
    console.log('%c🏔️ État Indépendant du Nord', 'color: #d4af37; font-size: 20px; font-weight: bold;');
});
