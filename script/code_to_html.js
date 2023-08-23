function loadAndDisplayCode(contentID, filePath) {
    const codeContainer = document.getElementById(contentID);
  
    fetch(filePath)
      .then(response => response.text())
      .then(code => {
        codeContainer.textContent = code;
      })
      .catch(error => {
        console.error('Error fetching code:', error);
      });
  }
  