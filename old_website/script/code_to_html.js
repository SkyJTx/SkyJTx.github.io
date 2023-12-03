function importPrism() {
    const prismScript = document.createElement('script');
    const prismCSS = document.createElement('link');
    prismScript.src = 'https://cdnjs.cloudflare.com/ajax/libs/prism/1.24.1/prism.min.js';
    prismCSS.rel = 'stylesheet';
    prismCSS.href = 'https://cdnjs.cloudflare.com/ajax/libs/prism/1.24.1/themes/prism.min.css';
    document.head.appendChild(prismCSS);
    document.body.appendChild(prismScript);
}

/**
 * load code from file to html and highlight it with prism
 * @param {string} contentID 
 * @param {string} filePath 
 */
function loadCode(contentID, filePath) {
    const codeContainer = document.getElementById(contentID);

    fetch(filePath)
        .then(response => response.text())
        .then(code => {codeContainer.textContent = code;})
        .catch(error => {console.error('Error fetching code:', error);});
}
  