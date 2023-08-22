function loadMarkdownFile(filePath, callback) {
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
    loadMarkdownFile(markdownFilePath, function(markdownText) {
        const html = convertMarkdownToHTML(markdownText);
        targetElement.innerHTML = html;
    });
}
  