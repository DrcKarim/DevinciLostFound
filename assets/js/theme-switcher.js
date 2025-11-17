/**
 * Theme Switcher - Light/Dark Mode
 * Handles toggling between light and dark themes with localStorage persistence
 */

const THEME_KEY = 'enquete-theme';
const LIGHT_THEME = 'light';
const DARK_THEME = 'dark';

/**
 * Initialize theme on page load
 */
function initTheme() {
    const savedTheme = localStorage.getItem(THEME_KEY);
    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    const theme = savedTheme || (prefersDark ? DARK_THEME : LIGHT_THEME);
    
    setTheme(theme);
}

/**
 * Set the theme and update DOM
 */
function setTheme(theme) {
    // Update data attribute
    document.documentElement.setAttribute('data-theme', theme);
    document.body.setAttribute('data-theme', theme);
    
    // Update localStorage
    localStorage.setItem(THEME_KEY, theme);
    
    // Update button icon
    const themeToggle = document.getElementById('themeToggle');
    if (themeToggle) {
        const icon = themeToggle.querySelector('i');
        if (theme === DARK_THEME) {
            icon.classList.remove('fa-moon');
            icon.classList.add('fa-sun');
            themeToggle.title = 'Switch to light mode';
        } else {
            icon.classList.remove('fa-sun');
            icon.classList.add('fa-moon');
            themeToggle.title = 'Switch to dark mode';
        }
    }
}

/**
 * Toggle between light and dark themes
 */
function toggleTheme() {
    const currentTheme = document.documentElement.getAttribute('data-theme') || LIGHT_THEME;
    const newTheme = currentTheme === LIGHT_THEME ? DARK_THEME : LIGHT_THEME;
    setTheme(newTheme);
}

/**
 * Setup event listeners
 */
function setupThemeListeners() {
    const themeToggle = document.getElementById('themeToggle');
    if (themeToggle) {
        themeToggle.addEventListener('click', toggleTheme);
    }

    // Listen to system theme changes
    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
        const newTheme = e.matches ? DARK_THEME : LIGHT_THEME;
        setTheme(newTheme);
    });
}

// Initialize when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
        initTheme();
        setupThemeListeners();
    });
} else {
    initTheme();
    setupThemeListeners();
}
