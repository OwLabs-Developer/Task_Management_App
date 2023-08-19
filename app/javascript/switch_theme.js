const themeSwitch = document.getElementById('themeSwitch');
const themeLabel = document.querySelector('.form-check-label');
const navbar = document.querySelector('.navbar');

// Function to set the theme preference in local storage
function setThemePreference(theme) {
    localStorage.setItem('theme', theme);
}

// Function to get the theme preference from local storage
function getThemePreference() {
    return localStorage.getItem('theme');
}

// Function to set the switch state in local storage
function setSwitchState(state) {
    localStorage.setItem('switchState', state);
}

// Function to get the switch state from local storage
function getSwitchState() {
    return localStorage.getItem('switchState');
}

// Function to apply the saved theme preference and switch state
function applyThemePreference() {
    const savedTheme = getThemePreference();
    const savedSwitchState = getSwitchState();

    if (savedTheme === 'dark-theme') {
        document.body.classList.add('dark-theme');
        navbar.classList.add('dark-theme');
        themeSwitch.checked = true;
        if (savedSwitchState === 'checked') {
            navbar.style.backgroundColor = 'rgb(27, 37, 41)';
            themeLabel.textContent = 'Light Theme';
        }
    } else {
        themeSwitch.checked = false;
        if (savedSwitchState === 'checked') {
            navbar.style.backgroundColor = 'white';
            themeLabel.textContent = 'Dark Theme';
        }
    }
}

// Apply the saved theme preference and switch state on page load
applyThemePreference();

themeSwitch.addEventListener('change', () => {
    document.body.classList.toggle('dark-theme');
    navbar.classList.toggle('dark-theme');

    if (document.body.classList.contains('dark-theme')) {
        setThemePreference('dark-theme');
        setSwitchState('checked');
        themeLabel.textContent = 'Light Theme';
        navbar.style.backgroundColor = 'rgb(27, 37, 41)';
    } else {
        setThemePreference('light-theme');
        setSwitchState('checked');
        themeLabel.textContent = 'Dark Theme';
        navbar.style.backgroundColor = 'white';
    }
});

