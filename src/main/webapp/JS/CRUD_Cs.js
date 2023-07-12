function add_cs() {
    document.getElementById("Cs_id").value = "";
    document.getElementById("Cs_name").value = null;
    document.getElementById("Cs_sex").options[0].selected = true;
    document.getElementById("phone").value = null;
    document.getElementById("email").value = null;
    document.getElementById("address").value =null;
    document.getElementById("kind").options[0].selected = true;
    document.getElementById("remark").value = null;
    document.getElementById("modal").style.display = "block";
    document.getElementById("cs_submit_btn").style.display = "block";
    document.getElementById("cs_modify_btn").style.display = "none";
    // 禁用页面的滚动条
    document.body.classList.add("modal-open");
}

function closeModal() {
    document.getElementById("modal").style.display = "none";
    document.getElementById("cs_submit_btn").style.display = "none";
    document.getElementById("cs_modify_btn").style.display = "none";
    document.body.classList.add("modal-open");
}

function modify_cs(i){
    var t = document.getElementById("cs_table");
    document.getElementById("Cs_id").value = t.rows[i].cells[0].innerText;
    document.getElementById("Cs_name").value = t.rows[i].cells[1].innerText;
    var select_sex = document.getElementById("Cs_sex");
    var sex = t.rows[i].cells[2].innerText;
    for(var j = 0; j < select_sex.options.length; j++){
        if(select_sex.options[j].value === sex){
            select_sex.options[j].selected = true;
        }
    }
    document.getElementById("phone").value = t.rows[i].cells[3].innerText;
    document.getElementById("email").value = t.rows[i].cells[4].innerText;
    document.getElementById("address").value = t.rows[i].cells[5].innerText;
    var select_kind = document.getElementById("kind");
    var kind = t.rows[i].cells[6].innerText;
    for(var j = 0; j < select_kind.options.length; j++){
        if(select_kind.options[j].value === kind){
            select_kind.options[j].selected = true;
        }
    }
    document.getElementById("remark").value = t.rows[i].cells[7].innerText;
    document.getElementById("modal").style.display = "block";
    document.getElementById("cs_submit_btn").style.display = "none";
    document.getElementById("cs_modify_btn").style.display = "block";
    // 禁用页面的滚动条
    document.body.classList.add("modal-open");
}
function delete_cs(i){
    var t = document.getElementById("cs_table");
    var id = t.rows[i].cells[0].innerText;
    var name = t.rows[i].cells[1].innerText;
    if (confirm("确定要删除客户 " + name + " 的记录吗？")) {
        window.location.href = "deleteServlet?action=delete&id=" + id;
    }
}