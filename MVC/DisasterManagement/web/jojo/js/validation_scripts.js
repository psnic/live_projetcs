/*!
 * Start Bootstrap - SB Admin v7.0.7 (https://startbootstrap.com/template/sb-admin)
 * Copyright 2013-2023 Start Bootstrap
 * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
 */
// 
// Scripts
// 

$(document).ready(function () {
    $('input.onlyDigits').keyup(function () {
        if (this.value.match(/[^0-9 \s]/)) {
            this.value = this.value.replace(/[^0-9 \s]*$/, '');
        }
    });
    $('input.onlyDigitsFloat').keyup(function () {
// Replace any non-digit or non-decimal point character with an empty string
        this.value = this.value.replace(/[^0-9.]/g, '');
        // Ensure that there is at most one decimal point in the input
        var decimalCount = this.value.split('.').length - 1;
        if (decimalCount > 1) {
            var parts = this.value.split('.');
            this.value = parts[0] + '.' + parts.slice(1).join('');
        }
    });


    $('body').on('keyup', 'input.onlyDigits', function (r) {
        if (this.value.match(/[^0-9 \s]/)) {
            this.value = this.value.replace(/[^0-9 \s]*$/, '');
        }
    });
});
function getMaxCurrentDate() {
    var casedate = document.getElementById('inputDate');
    var maxDate = new Date();
    maxDate.setFullYear(maxDate.getFullYear());
    casedate.setAttribute("max", maxDate.toISOString().split('T')[0]);
    casedate.removeAttribute("min");
}
function validateImageFileType(inputFile) {
    var allowedExtensions = /(\.jpg|\.jpeg)$/i;
    if (!allowedExtensions.exec(inputFile.value)) {
        alert('Invalid file type. Only JPG and JPEG files are allowed.');
        inputFile.value = '';
        return false;
    }
    return true;
}
function upload2mb(iid) {
    var fileInput = document.getElementById(iid);
    if (fileInput.files[0].size > (2000000)) {
        alert('File Size exceeded. Limit is 2 MB');
        fileInput.value = '';
        return false;
    }
}
