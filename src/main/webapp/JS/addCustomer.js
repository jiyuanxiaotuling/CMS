function add_cs() {
    document.getElementById("modal").style.display = "block";
    document.body.classList.add("modal-open");
}

function closeModal() {
    document.getElementById("modal").style.display = "none";
    document.body.classList.add("modal-open");
}