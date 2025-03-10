
function togglePasswordVisibility(formType) {
    if (formType === 'login') {
        var passwordField = document.getElementById('login-password');
        passwordField.type = document.getElementById('login-show-password').checked ? 'text' : 'password';
    } else if (formType === 'register') {
        var passwordField = document.getElementById('register-password');
        var confirmPasswordField = document.getElementById('confirm-password');
        var isChecked = document.getElementById('register-show-password').checked;
        passwordField.type = isChecked ? 'text' : 'password';
        confirmPasswordField.type = isChecked ? 'text' : 'password';
    }
}


let currentPdfIndex = 4;
let currentVideoIndex = 4;
const itemsToShow = 4;
const pdfItems = document.querySelectorAll('.pdf-item');
const videoItems = document.querySelectorAll('.video-item');
const showMorePdfButton = document.getElementById('show-more-pdf');
const showLessPdfButton = document.getElementById('show-less-pdf');
const showMoreVideoButton = document.getElementById('show-more-video');
const showLessVideoButton = document.getElementById('show-less-video');

function showInitialPdfItems() {
for (let i = 0; i < itemsToShow; i++) {
    pdfItems[i].style.display = 'block';
}
}

function showInitialVideoItems() {
for (let i = 0; i < itemsToShow; i++) {
    videoItems[i].style.display = 'block';
}
}

function showPdfItems() {
const endIndex = Math.min(currentPdfIndex + itemsToShow, pdfItems.length);
for (let i = currentPdfIndex; i < endIndex; i++) {
    pdfItems[i].style.display = 'block';
}
currentPdfIndex = endIndex;

if (currentPdfIndex >= pdfItems.length) {
    showMorePdfButton.style.display = 'none';
    showLessPdfButton.style.display = 'inline-block';
} else {
    showMorePdfButton.style.display = 'inline-block';
}
}

function hidePdfItems() {
for (let i = itemsToShow; i < pdfItems.length; i++) {
    pdfItems[i].style.display = 'none';
}
currentPdfIndex = itemsToShow;

showMorePdfButton.style.display = 'inline-block';
showLessPdfButton.style.display = 'none';
}

function showVideoItems() {
const endIndex = Math.min(currentVideoIndex + itemsToShow, videoItems.length);
for (let i = currentVideoIndex; i < endIndex; i++) {
    videoItems[i].style.display = 'block';
}
currentVideoIndex = endIndex;

if (currentVideoIndex >= videoItems.length) {
    showMoreVideoButton.style.display = 'none';
    showLessVideoButton.style.display = 'inline-block';
} else {
    showMoreVideoButton.style.display = 'inline-block';
}
}

function hideVideoItems() {
for (let i = itemsToShow; i < videoItems.length; i++) {
    videoItems[i].style.display = 'none';
}
currentVideoIndex = itemsToShow;

showMoreVideoButton.style.display = 'inline-block';
showLessVideoButton.style.display = 'none';
}

showMorePdfButton.addEventListener('click', showPdfItems);
showLessPdfButton.addEventListener('click', hidePdfItems);
showMoreVideoButton.addEventListener('click', showVideoItems);
showLessVideoButton.addEventListener('click', hideVideoItems);

showInitialPdfItems();
showInitialVideoItems();
