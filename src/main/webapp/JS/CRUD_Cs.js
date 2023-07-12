function add_cs() {
    document.getElementById("Cs_id").value = null;
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
function print_cs_table(){
    var printContents = document.getElementById("cs_table").outerHTML;
    var originalContents = document.body.innerHTML;
    document.body.innerHTML = printContents;
    window.print();
    document.body.innerHTML = originalContents;
}
function print_cs(i){
    var t = document.getElementById("cs_table");
    var row = t.rows[i];
    var rowData = '';
    rowData += '<tr><td>ID:</td><td>' + row.cells[0].innerText + '</td></tr>';
    rowData += '<tr><td>姓名:</td><td>' + row.cells[1].innerText + '</td></tr>';
    rowData += '<tr><td>性别:</td><td>' + row.cells[2].innerText + '</td></tr>';
    rowData += '<tr><td>电话:</td><td>' + row.cells[3].innerText + '</td></tr>';
    rowData += '<tr><td>邮箱:</td><td>' + row.cells[4].innerText + '</td></tr>';
    rowData += '<tr><td>地址:</td><td>' + row.cells[5].innerText + '</td></tr>';
    rowData += '<tr><td>类别:</td><td>' + row.cells[6].innerText + '</td></tr>';
    rowData += '<tr><td>描述:</td><td>' + row.cells[7].innerText + '</td></tr>';
    var printView = '<table>' + rowData + '</table>';
    var printWindow = window.open('', '', 'height=500,width=800');
    printWindow.document.write('<html><head><title>打印表格</title></head><body>' + printView + '</body></html>');
    printWindow.document.close();
    printWindow.print();
    printWindow.close();
    // document.body.classList.add("modal-open");
    // var modalContent = document.getElementById("modal").innerHTML;
    // var originalContent = document.body.innerHTML;
    // document.body.innerHTML = modalContent;
    // window.print();
    // document.body.innerHTML = originalContent;
}