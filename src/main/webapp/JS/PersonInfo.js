function showSuccessMessage() {
    var successMessage = document.getElementById("success");
    successMessage.style.display = "block";
    setTimeout(function() {
        successMessage.style.display = "none";
    }, 3000);
}
function showFailedMessage() {
    var successMessage = document.getElementById("failed");
    successMessage.style.display = "block";
    setTimeout(function() {
        successMessage.style.display = "none";
    }, 3000);
}