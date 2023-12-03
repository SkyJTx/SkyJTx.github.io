function loadFile(filePath, callback) {
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            callback(xhr.responseText);
        }
    };
    xhr.open("GET", filePath, true);
    xhr.send();
}
  
function convertMarkdownToHTML(markdownText) {
    return marked.parse(markdownText);
}
  
function displayMarkdownAsHTML(elementId, markdownFilePath) {
    const targetElement = document.getElementById(elementId);
    loadFile(markdownFilePath, function(markdownText) {
        const html = convertMarkdownToHTML(markdownText);
        targetElement.innerHTML = html;
    });
}

function displayTextAsHTML(elementId, textFilePath) {
    const targetElement = document.getElementById(elementId);
    loadFile(textFilePath, function(Text) {
        const html = Text;
        targetElement.innerHTML = html;
    });
}