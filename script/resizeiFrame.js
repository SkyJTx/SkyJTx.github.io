function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.documentElement.scrollHeight + 'px';
    var windowWidth = window.innerWidth;
    var iframeDocument = obj.contentDocument || obj.contentWindow.document;
    iframeDocument.body.style.fontSize = windowWidth / 50 + 'px';
}