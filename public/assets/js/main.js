document.addEventListener('DOMContentLoaded', () => {
    document.body.classList.remove('no-js');

    const cards = document.querySelectorAll('.reveal-card');
    const triggerSection = document.querySelector('#secondary-news');

    if (!cards.length || !triggerSection) {
        return;
    }

    const revealCards = () => {
        cards.forEach((card, index) => {
            setTimeout(() => {
                card.classList.add('visible');
            }, index * 120);
        });
    };

    const sectionTop = triggerSection.getBoundingClientRect().top;
    const viewportHeight = window.innerHeight;

    if (sectionTop < viewportHeight) {
        revealCards();
        return;
    }

    const observer = new IntersectionObserver(
        (entries, obs) => {
            entries.forEach((entry) => {
                if (entry.isIntersecting) {
                    revealCards();
                    obs.unobserve(entry.target);
                }
            });
        },
        {
            root: null,
            threshold: 0.1,
        }
    );

    observer.observe(triggerSection);
});