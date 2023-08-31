function createNavbar() {
    const navbar = document.createElement('nav');
    navbar.classList.add('navbar');

    const homepageLink = document.createElement('a');
    homepageLink.href = '/index.html';
    homepageLink.textContent = 'Homepage';
    navbar.appendChild(homepageLink);

    const worksTableLink = document.createElement('a');
    worksTableLink.href = '/works_table.html';
    worksTableLink.textContent = 'Works Table';
    navbar.appendChild(worksTableLink);

    const aboutMeLink = document.createElement('a');
    aboutMeLink.href = '/about.html';
    aboutMeLink.textContent = 'About Me';
    navbar.appendChild(aboutMeLink);

    document.body.insertBefore(navbar, document.querySelector('.content'));
}

function createFooter() {
    const hr = document.createElement('hr');
    const footer = document.createElement('footer');
    footer.classList.add('footer');

    const text = document.createTextNode('Version 0.3.0 | Mr. Nattakarn Khumsupha.');
    footer.appendChild(text);

    document.body.appendChild(hr);
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