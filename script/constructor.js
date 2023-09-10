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
    root.style.setProperty('--main-color-background', '#0e1117');
    root.style.setProperty('--main-color-navbar', '#424242');
    root.style.setProperty('--main-color-hover', '#646464');
    root.style.setProperty('--main-color-highlight', '#f48517');
    root.style.setProperty('--main-color-header', '#ffb900');
    root.style.setProperty('--main-color-text', '#ffd7aa');
    root.style.setProperty('--main-color-border', '#ffd7aa');
    root.style.setProperty('--main-color-a', '#ffffff');
    root.style.setProperty('--main-color-box', '#363636');
    root.style.setProperty('--main-color-shadow', '#000000');
    root.style.setProperty('--main-color-navbar-text', '#ffffff');
    root.style.setProperty('--main-color-scheme', 'dark');
    themeToggleIcon.textContent = '🌙';
}

function setLightTheme() {
    const root = document.documentElement;
    const themeToggleIcon = document.querySelector('.theme-toggle-button');
    root.style.setProperty('--main-color-background', '#0e1117');
    root.style.setProperty('--main-color-navbar', '#f0f0f0');
    root.style.setProperty('--main-color-hover', '#dddddd');
    root.style.setProperty('--main-color-highlight', '#f48517');
    root.style.setProperty('--main-color-header', '#ffb900');
    root.style.setProperty('--main-color-text', '#f46655');
    root.style.setProperty('--main-color-border', '#e1b382');
    root.style.setProperty('--main-color-a', '#292929');
    root.style.setProperty('--main-color-box', '#ffffff');
    root.style.setProperty('--main-color-shadow', '#000000');
    root.style.setProperty('--main-color-navbar-text', '#000000');
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
    const random = Math.floor(Math.random()*6);
    bg.style.backgroundImage = `url("/asset/pictures/BG/${random}.png")`;
    container.appendChild(bg);
    document.body.appendChild(container);
}

/**
 * 
 * @param {Dictionary} nav_dict name, href
 */
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

/**
 * Set Active Navbar Link
 * @param {string} nav_name Current Active Top-Level Website's Name
 */
function setActiveNav(nav_name) {
    const nav = document.querySelector('nav');
    const nav_links = nav.querySelectorAll('a');
    nav_links.forEach((link) => {
        if (link.textContent == nav_name) {
            link.classList.add('active');
        }
    });
}

/**
 * Create Contact by Reading from JSON
 * JSON Format:
 * {
 *  Name: {
 *      href: Path
 *      img: localFilePath
 * }
 */
function createContact() {
    const article = document.createElement('article');
    article.classList.add('contact');
    const ul = document.createElement('ul');
    fetch('/asset/contact.json')
        .then((response) => {
            if (!response.ok) {
                throw new Error('HTTP error, status = ' + response.status);
            }
            return response.text();
        })
        .then((text) => {
            const contact = JSON.parse(text);
            for (let key in contact) {
                const li = document.createElement('li');
                const link = document.createElement('a');
                const img = document.createElement('img');
                const p = document.createElement('p');
                img.src = contact[key]['img'];
                img.alt = "icon by Icons8"
                link.href = contact[key]['href'];
                link.target = '_blank';
                link.rel = 'noopener noreferrer';
                p.textContent = key;
                link.appendChild(img);
                link.appendChild(p);
                li.appendChild(link);
                ul.appendChild(li);
            }
        })
        .catch((err) => {
            console.error(err);
        });
    const head = document.createElement('h2');
    head.textContent = 'Connect with me';
    article.appendChild(head)
    article.appendChild(ul);
    document.body.appendChild(article);
}

function createFooter() {
    const footer = document.createElement('footer');
    footer.classList.add('footer');
    const text = document.createTextNode('Version 0.4.2 - Updated 2023-09-04. icon by ');
    const a = document.createElement('a');
    a.href = 'https://icons8.com';
    a.target = '_blank';
    a.rel = 'noopener noreferrer';
    a.textContent = 'Icons8';
    const end = document.createTextNode('.');
    footer.appendChild(text);
    footer.appendChild(a);
    footer.appendChild(end);
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
    headerH1.textContent = headerText;
    header.appendChild(headerH1);
    document.body.insertBefore(header, document.querySelector('.content'));
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

function setFlavicon() {
    const head = document.querySelector('head');

    const link_icon = document.createElement('link');
    link_icon.rel = 'icon';
    link_icon.href = '/asset/pictures/Logo/122151189_724130148449581_319263467210893066_n.jpg';
    link_icon.type = 'image/jpg';
    link_icon.sizes = '16x16';
    head.appendChild(link_icon);
}

/*Run Function on Start*/

createBG();
setFlavicon();
createNavbar();
