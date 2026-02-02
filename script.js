// ===========================================
// ÉTAT INDÉPENDANT DU NORD - RECRUTEMENTS
// ===========================================

// Configuration des liens Discord
const discordLinks = {
    'paleto-repair-discord': 'https://discord.gg/paleto-repair',
    'stags-discord': 'https://discord.gg/stags-restaurant',
    'ltd-paleto-discord': 'https://discord.gg/ltd-paleto',
    'cooperative-discord': 'https://discord.gg/cooperative'
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
                    // Note: CSS handles hover, JS handles click feedback
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
// PARALLAX EFFECT
// ===========================================
function setupParallax() {
    const heroBg = document.querySelector('.hero-background');
    const heroContent = document.querySelector('.hero-content');
    const heroLogo = document.querySelector('.hero-logo');
    
    window.addEventListener('scroll', () => {
        const scrolled = window.scrollY;
        
        if (scrolled < window.innerHeight) {
            // Background moves slower than scroll
            if (heroBg) {
                heroBg.style.transform = `scale(1.05) translateY(${scrolled * 0.5}px)`;
            }
            // Content moves slightly faster/fades
            if (heroContent) {
                heroContent.style.transform = `translateY(${scrolled * 0.2}px)`;
                heroContent.style.opacity = 1 - (scrolled / 700);
            }
            // Logo parallax
            if (heroLogo) {
                heroLogo.style.transform = `translate(-50%, ${scrolled * 0.3}px)`;
            }
        }
    });
}

// ===========================================
// INITIALISATION
// ===========================================
document.addEventListener('DOMContentLoaded', () => {
    setupDiscordButtons();
    setupSmoothScroll();
    setupParallax();
    
    console.log('%c🏔️ État Indépendant du Nord', 'color: #ccb286; font-size: 20px; font-weight: bold; background: #1b3a2b; padding: 10px; border-radius: 5px;');
});
