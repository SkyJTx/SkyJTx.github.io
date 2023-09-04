/*Define Variables*/

let nav = {Home: "/index.html", Works: "/works_table.html", About: "/about.html"}
let darkTheme = localStorage.getItem('darkTheme');

if (darkTheme === null) {
    darkTheme = true;
    localStorage.setItem('darkTheme', darkTheme.toString());
} else {
    darkTheme = darkTheme === 'true';
}

/*Define Functions*/

function setDarkTheme() {
    const root = document.documentElement;
    const themeToggleIcon = document.querySelector('.theme-toggle-button');
    root.style.setProperty('--main-color-background', '#303030');
    root.style.setProperty('--main-color-navbar', '#424242');
    root.style.setProperty('--main-color-hover', '#646464');
    root.style.setProperty('--main-color-highlight', '#f48517');
    root.style.setProperty('--main-color-header', '#ffb900');
    root.style.setProperty('--main-color-text', '#ffd7aa');
    root.style.setProperty('--main-color-border', '#ffd7aa');
    root.style.setProperty('--main-color-a', '#ffffff');
    root.style.setProperty('--main-color-box', '#363636');
    root.style.setProperty('--main-color-shadow', '#000000');
    root.style.setProperty('--main-color-scheme', 'dark');
    themeToggleIcon.textContent = '🌙';
}

function setLightTheme() {
    const root = document.documentElement;
    const themeToggleIcon = document.querySelector('.theme-toggle-button');
    root.style.setProperty('--main-color-background', '#2d545e');
    root.style.setProperty('--main-color-navbar', '#f0f0f0');
    root.style.setProperty('--main-color-hover', '#bbbbbb');
    root.style.setProperty('--main-color-highlight', '#f48517');
    root.style.setProperty('--main-color-header', '#ffb900');
    root.style.setProperty('--main-color-text', '#f46655');
    root.style.setProperty('--main-color-border', '#e1b382');
    root.style.setProperty('--main-color-a', '#292929');
    root.style.setProperty('--main-color-box', '#ffffff');
    root.style.setProperty('--main-color-shadow', '#000000');
    root.style.setProperty('--main-color-scheme', 'light');
    themeToggleIcon.textContent = '☀️';
}


function toggleThemeMode() {
    if (darkTheme) {
        setDarkTheme();
    } else {
        setLightTheme();
    }
    darkTheme = !darkTheme;
    console.log(darkTheme.toString());
    localStorage.setItem('darkTheme', darkTheme.toString());
}

function createThemeToggle() {
    const themeToggle = document.createElement('div');
    const themeToggleIcon = document.createElement('button');
    themeToggle.classList.add('theme-toggle');
    themeToggleIcon.classList.add('theme-toggle-button');
    themeToggleIcon.textContent = '🌙';
    themeToggleIcon.addEventListener('click', () => {
        toggleThemeMode();
    });
    themeToggle.appendChild(themeToggleIcon);
    document.body.appendChild(themeToggle);
}

function createBG(){
    const container = document.createElement('div');
    const bg = document.createElement('div');
    container.classList.add('container');
    bg.classList.add('background');
    container.appendChild(bg);
    document.body.appendChild(container);
}

function createNavbar(nav_dict = nav) {
    createBG();
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

    const text = document.createTextNode('Version 0.4.0 Best Viewed on Non-Webkit Browser (Any Browser Except Browsers on Apple Product)');
    footer.appendChild(text);

    document.body.appendChild(footer);

    /*create theme toggle*/
    createThemeToggle();
    if (!darkTheme) {
        setDarkTheme();
    } else {
        setLightTheme();
    }
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