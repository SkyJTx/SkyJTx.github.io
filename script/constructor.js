let nav = {Home: "/index.html", Works: "/works_table.html", About: "/about.html"}
let theme = localStorage.getItem('theme');

if (theme == null) {
    theme = 1;
    localStorage.setItem('theme', 1);
}

function createBG(){
    const container = document.createElement('div');
    const bg = document.createElement('div');
    container.classList.add('container');
    bg.classList.add('background');
    container.appendChild(bg);
    document.body.appendChild(container);
}

function toggleThemeMode() {
    const root = document.documentElement;
    if (theme == 1) {
        root.style.setProperty('--main-color-background', '#303030');
        root.style.setProperty('--main-color-navbar', '#292929');
        root.style.setProperty('--main-color-hover', '#646464');
        root.style.setProperty('--main-color-highlight', '#f48517');
        root.style.setProperty('--main-color-header', '#ffb900');
        root.style.setProperty('--main-color-text', '#ffd7aa');
        root.style.setProperty('--main-color-border', '#ffd7aa');
        root.style.setProperty('--main-color-a', '#ffffff');
        root.style.setProperty('--main-color-box', '#161616');
        root.style.setProperty('--main-color-shadow', '#000000');
        root.style.setProperty('--main-color-scheme', 'dark');
        theme = 0;
        localStorage.setItem('theme', 0);
        const themeToggleIcon = document.querySelector('.theme-toggle-button');
        themeToggleIcon.textContent = '🌙';
    } else if (theme == 0) {
        root.style.setProperty('--main-color-background', '#2d545e');
        root.style.setProperty('--main-color-navbar', '#f0f0f0');
        root.style.setProperty('--main-color-hover', '#e1b382');
        root.style.setProperty('--main-color-highlight', '#f48517');
        root.style.setProperty('--main-color-header', '#f48517');
        root.style.setProperty('--main-color-text', '#292929');
        root.style.setProperty('--main-color-border', '#e1b382');
        root.style.setProperty('--main-color-a', '#292929');
        root.style.setProperty('--main-color-box', '#ffffff');
        root.style.setProperty('--main-color-shadow', '#000000');
        root.style.setProperty('--main-color-scheme', 'light');
        theme = 1;
        localStorage.setItem('theme', 1);
        const themeToggleIcon = document.querySelector('.theme-toggle-button');
        themeToggleIcon.textContent = '☀️';
    }
}

function createThemeToggle() {
    const themeToggle = document.createElement('div');
    const themeToggleIcon = document.createElement('div');
    themeToggle.classList.add('theme-toggle');
    themeToggleIcon.classList.add('theme-toggle-button');
    themeToggleIcon.textContent = '🌙';
    themeToggle.appendChild(themeToggleIcon);
    document.body.appendChild(themeToggle);
    themeToggle.addEventListener('click', () => {
        toggleThemeMode();
    });
}

function createNavbar(nav_dict = nav) {
    const nav = document.createElement('nav');
    nav.classList.add('navbar');
    const ul = document.createElement('ul');

    for (let key in nav_dict) {
        const li = document.createElement('li');
        const link = document.createElement('a');
        link.href = nav_dict[key];
        link.textContent = key;
        li.appendChild(link);
        ul.appendChild(li);
    }

    nav.appendChild(ul);

    document.body.insertBefore(nav, document.querySelector('.content'));
}

function setActiveNav(nav_name) {
    const nav = document.querySelector('nav');
    const nav_links = nav.querySelectorAll('a');
    nav_links.forEach((link) => {
        if (link.textContent == nav_name) {
            link.classList.add('active');
        }
    });
}

function createFooter() {
    const footer = document.createElement('footer');
    footer.classList.add('footer');

    const text = document.createTextNode('Version 0.4.0 | Mr. Nattakarn Khumsupha.');
    footer.appendChild(text);

    document.body.appendChild(footer);
}

function createHeader(headerText) {
    const header = document.createElement('header');
    const headerH1 = document.createElement('h1');
    const hr = document.createElement('hr');
    headerH1.textContent = headerText;
    header.appendChild(headerH1);
    document.body.insertBefore(header, document.querySelector('.content'));
    document.body.insertBefore(hr, document.querySelector('.content'));
}

/**
 * Iterate through all specified elements with class name "content" and set the class name of the element to "content content-<element>"
 * @param {string} element 
 */
function setContentClass(element) {
    const content = document.querySelectorAll('.content');
    content.forEach((content) => {
        content.classList.add(`content-${element}`);
    });
}