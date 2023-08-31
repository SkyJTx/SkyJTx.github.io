let nav = {Home: "/index.html", Works: "/works_table.html", About: "/about.html"}

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

function createFooter() {
    const hr = document.createElement('hr');
    const footer = document.createElement('footer');
    footer.classList.add('footer');

    const text = document.createTextNode('Version 0.4.0 | Mr. Nattakarn Khumsupha.');
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
