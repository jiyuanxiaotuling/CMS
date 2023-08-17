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
    //添加背景灰度
    let overlay = document.createElement("div");
    overlay.className = "modal-overlay";
    document.body.appendChild(overlay);
    // 禁用页面的滚动条
    document.body.classList.add("modal-open");
}
function add_em() {
    document.getElementById("em_id").value = null;
    document.getElementById("em_name").value = null;
    var select_sex = document.getElementById("em_gender");
    select_sex.options[0].selected = true;
    document.getElementById("em_age").value = null;
    document.getElementById("em_position").value = null;
    document.getElementById("em_department").value = null;
    document.getElementById("em_phone").value = null;
    document.getElementById("em_email").value = null;
    document.getElementById("em_modal").style.display = "block";
    document.getElementById("em_submit_btn").style.display = "block";
    document.getElementById("em_modify_btn").style.display = "none";
    //添加背景灰度
    let overlay = document.createElement("div");
    overlay.className = "modal-overlay";
    document.body.appendChild(overlay);
    // 禁用页面的滚动条
    document.body.classList.add("modal-open");
}
function add_se() {
    document.getElementById("se_id").value = null;
    document.getElementById("se_time").value = null;
    document.getElementById("se_kind").value = null;
    document.getElementById("se_priority").value = null;
    document.getElementById("se_status").value = null;
    document.getElementById("se_content").value =null;
    document.getElementById("se_feedback").value = null;
    document.getElementById("se_satisfaction").value = null;
    document.getElementById("cs_id1").value = null;
    document.getElementById("em_id1").value = null;
    document.getElementById("se_modal").style.display = "block";
    document.getElementById("se_submit_btn").style.display = "block";
    document.getElementById("se_modify_btn").style.display = "none";
    //添加背景灰度
    let overlay = document.createElement("div");
    overlay.className = "modal-overlay";
    document.body.appendChild(overlay);
    // 禁用页面的滚动条
    document.body.classList.add("modal-open");
}
function add_ac() {
    document.getElementById("Ac_id").value = null;
    document.getElementById("Ac_name").value = null;
    document.getElementById("Ac_kind").value = null;
    document.getElementById("Ac_content").value = null;
    document.getElementById("Ac_address").value = null;
    document.getElementById("Ac_btime").value =null;
    document.getElementById("Ac_etime").value = null;
    document.getElementById("em-ac_id").value = null;
    document.getElementById("ac_modal").style.display = "block";
    document.getElementById("ac_submit_btn").style.display = "block";
    document.getElementById("ac_modify_btn").style.display = "none";
    //添加背景灰度
    let overlay = document.createElement("div");
    overlay.className = "modal-overlay";
    document.body.appendChild(overlay);
    // 禁用页面的滚动条
    document.body.classList.add("modal-open");
}
function closeModal() {
    document.getElementById("modal").style.display = "none";
    document.getElementById("cs_submit_btn").style.display = "none";
    document.getElementById("cs_modify_btn").style.display = "none";
    let overlay = document.querySelector(".modal-overlay");
    document.body.removeChild(overlay);
    document.body.classList.add("modal-open");
}
function closeEmModal() {
    document.getElementById("em_modal").style.display = "none";
    document.getElementById("em_submit_btn").style.display = "none";
    document.getElementById("em_modify_btn").style.display = "none";
    let overlay = document.querySelector(".modal-overlay");
    document.body.removeChild(overlay);
    document.body.classList.add("modal-open");
}
function closeSeModal() {
    document.getElementById("se_modal").style.display = "none";
    document.getElementById("se_submit_btn").style.display = "none";
    document.getElementById("se_modify_btn").style.display = "none";
    let overlay = document.querySelector(".modal-overlay");
    document.body.removeChild(overlay);
    document.body.classList.add("modal-open");
}
function closeAcModal() {
    document.getElementById("ac_modal").style.display = "none";
    document.getElementById("ac_submit_btn").style.display = "none";
    document.getElementById("ac_modify_btn").style.display = "none";
    let overlay = document.querySelector(".modal-overlay");
    document.body.removeChild(overlay);
    document.body.classList.add("modal-open");
}
function closePtModal() {
    document.getElementById("ac_modal1").style.display = "none";
    document.getElementById("ac_cs+_btn").style.display = "none";
    document.getElementById("ac_cs-_btn").style.display = "none";
    let overlay = document.querySelector(".modal-overlay");
    document.body.removeChild(overlay);
    document.body.classList.add("modal-open");
}
function modify_cs(i){
    var t = document.getElementById("cs_table");
    document.getElementById("Cs_id").value = t.rows[i].cells[1].innerText;
    document.getElementById("Cs_name").value = t.rows[i].cells[2].innerText;
    var select_sex = document.getElementById("Cs_sex");
    var sex = t.rows[i].cells[3].innerText;
    for(var j = 0; j < select_sex.options.length; j++){
        if(select_sex.options[j].value === sex){
            select_sex.options[j].selected = true;
        }
    }
    document.getElementById("phone").value = t.rows[i].cells[4].innerText;
    document.getElementById("email").value = t.rows[i].cells[5].innerText;
    document.getElementById("address").value = t.rows[i].cells[6].innerText;
    var select_kind = document.getElementById("kind");
    var kind = t.rows[i].cells[7].innerText;
    for(var j = 0; j < select_kind.options.length; j++){
        if(select_kind.options[j].value === kind){
            select_kind.options[j].selected = true;
        }
    }
    document.getElementById("remark").value = t.rows[i].cells[8].innerText;
    document.getElementById("modal").style.display = "block";
    document.getElementById("cs_submit_btn").style.display = "none";
    document.getElementById("cs_modify_btn").style.display = "block";
    let overlay = document.createElement("div");
    overlay.className = "modal-overlay";
    document.body.appendChild(overlay);
    // 禁用页面的滚动条
    document.body.classList.add("modal-open");
}
function modify_em(i){
    var t = document.getElementById("em_table");
    document.getElementById("em_id").value = t.rows[i].cells[1].innerText;
    document.getElementById("em_name").value = t.rows[i].cells[2].innerText;
    var select_sex = document.getElementById("em_gender");
    var sex = t.rows[i].cells[3].innerText;
    for(var j = 0; j < select_sex.options.length; j++){
        if(select_sex.options[j].value === sex){
            select_sex.options[j].selected = true;
        }
    }
    document.getElementById("em_age").value = t.rows[i].cells[4].innerText;
    document.getElementById("em_position").value = t.rows[i].cells[5].innerText;
    document.getElementById("em_department").value = t.rows[i].cells[6].innerText;
    document.getElementById("em_phone").value = t.rows[i].cells[7].innerText;
    document.getElementById("em_email").value = t.rows[i].cells[8].innerText;
    document.getElementById("em_modal").style.display = "block";
    document.getElementById("em_submit_btn").style.display = "none";
    document.getElementById("em_modify_btn").style.display = "block";
    let overlay = document.createElement("div");
    overlay.className = "modal-overlay";
    document.body.appendChild(overlay);
    // 禁用页面的滚动条
    document.body.classList.add("modal-open");
}
function modify_se(i){
    var t = document.getElementById("se_table");
    document.getElementById("se_id").value = t.rows[i].cells[1].innerText;
    document.getElementById("se_time").value = t.rows[i].cells[2].innerText;
    document.getElementById("se_kind").value = t.rows[i].cells[3].innerText;
    document.getElementById("se_priority").value = t.rows[i].cells[4].innerText;
    document.getElementById("se_status").value = t.rows[i].cells[5].innerText;
    document.getElementById("se_content").value = t.rows[i].cells[6].innerText;
    document.getElementById("se_feedback").value = t.rows[i].cells[7].innerText;
    document.getElementById("se_satisfaction").value = t.rows[i].cells[8].innerText;
    document.getElementById("cs_id1").value = t.rows[i].cells[9].innerText;
    document.getElementById("em_id1").value = t.rows[i].cells[10].innerText;
    document.getElementById("se_modal").style.display = "block";
    document.getElementById("se_submit_btn").style.display = "none";
    document.getElementById("se_modify_btn").style.display = "block";
    let overlay = document.createElement("div");
    overlay.className = "modal-overlay";
    document.body.appendChild(overlay);
    // 禁用页面的滚动条
    document.body.classList.add("modal-open");
}
function modify1_pt(i){
    var t = document.getElementById("ac_table");
    document.getElementById("ac-cs").value = t.rows[i].cells[1].innerText;
    document.getElementById("ac_modal1").style.display = "block";
    document.getElementById("ac_cs-_btn").style.display = "none";
    document.getElementById("ac_cs+_btn").style.display = "block";
    var selectElement = document.getElementById("ac-cs_id");
    let overlay = document.createElement("div");
    overlay.className = "modal-overlay";
    document.body.appendChild(overlay);
    // 禁用页面的滚动条
    document.body.classList.add("modal-open");
}
function modify2_pt(i){
    var t = document.getElementById("ac_table");
    document.getElementById("ac-cs").value = t.rows[i].cells[1].innerText;
    document.getElementById("ac_modal1").style.display = "block";
    document.getElementById("ac_cs+_btn").style.display = "none";
    document.getElementById("ac_cs-_btn").style.display = "block";
    var selectElement = document.getElementById("ac-cs_id");
    selectElement.innerHTML = "";

    // 获取多行内容
    var multiLineContent = t.rows[i].cells[9].innerText;
    var lines = multiLineContent.split("\n");

    // 生成下拉列表选项
    for (var j = 0; j < lines.length; j++) {
        var option = document.createElement("option");
        option.value = lines[j].trim();
        option.text = lines[j].trim(); // 去除行首尾的空白字符
        selectElement.appendChild(option);
    }
    let overlay = document.createElement("div");
    overlay.className = "modal-overlay";
    document.body.appendChild(overlay);
    // 禁用页面的滚动条
    document.body.classList.add("modal-open");
}
function modify_ac(i){
    var t = document.getElementById("ac_table");
    document.getElementById("Ac_id").value = t.rows[i].cells[1].innerText;
    document.getElementById("Ac_name").value = t.rows[i].cells[2].innerText;
    document.getElementById("Ac_kind").value = t.rows[i].cells[3].innerText;
    document.getElementById("Ac_content").value = t.rows[i].cells[4].innerText;
    document.getElementById("Ac_address").value = t.rows[i].cells[5].innerText;
    document.getElementById("Ac_btime").value = t.rows[i].cells[6].innerText;
    document.getElementById("Ac_etime").value = t.rows[i].cells[7].innerText;
    document.getElementById("em_id").value = t.rows[i].cells[8].innerText;
    // 获取"em_id"下拉栏元素
    var emIdDropdown = document.getElementById("em-ac_id");
// 获取第9列文本内容
    var textContent = t.rows[i].cells[8].innerText;

// 遍历下拉栏选项，找到与文本内容匹配的选项并设置为选中状态
    for (var j = 0; j < emIdDropdown.options.length; j++) {
        var option = emIdDropdown.options[j];
        if (option.text === textContent) {
            option.selected = true;
            break;
        }
    }
    document.getElementById("ac_modal").style.display = "block";
    document.getElementById("ac_submit_btn").style.display = "none";
    document.getElementById("ac_modify_btn").style.display = "block";
    let overlay = document.createElement("div");
    overlay.className = "modal-overlay";
    document.body.appendChild(overlay);
    // 禁用页面的滚动条
    document.body.classList.add("modal-open");
}
function delete_cs(i){
    var t = document.getElementById("cs_table");
    var id = t.rows[i].cells[1].innerText;
    var name = t.rows[i].cells[2].innerText;
    if (confirm("确定要删除客户 " + name + " 的记录吗？")) {
        window.location.href = "deleteServlet?action=delete&id=" + id;
    }
}
function delete_em(i){
    var t = document.getElementById("em_table");
    var id = t.rows[i].cells[1].innerText;
    var name = t.rows[i].cells[2].innerText;
    if (confirm("确定要删除员工 " + name + " 的记录吗？")) {
        window.location.href = "deleteEmServlet?action=delete&em_id=" + id;
    }
}
function delete_se(i){
    var t = document.getElementById("se_table");
    var cs_id = t.rows[i].cells[9].innerText;
    if (confirm("确定要删除客户" + cs_id+ " 的请求吗？")) {
        window.location.href = "deleteSeServlet?action=delete&cs_id=" + cs_id;
    }
}
function delete_ac(i) {
    var t = document.getElementById("ac_table");
    var ac_id = t.rows[i].cells[1].innerText;
    if (confirm("确定要删除市场活动" + ac_id + " 的请求吗？")) {
        window.location.href = "deleteAcServlet?action=delete&ac_id=" + ac_id;
    }
}
function print_cs_table(){
    var printContents = document.getElementById("cs_table").outerHTML;
    var originalContents = document.body.innerHTML;
    document.body.innerHTML = printContents;
    window.print();
    document.body.innerHTML = originalContents;
}
function print_em_table(){
    var printContents = document.getElementById("em_table").outerHTML;
    var originalContents = document.body.innerHTML;
    document.body.innerHTML = printContents;
    window.print();
    document.body.innerHTML = originalContents;
}
function print_se_table(){
    var printContents = document.getElementById("se_table").outerHTML;
    var originalContents = document.body.innerHTML;
    document.body.innerHTML = printContents;
    window.print();
    document.body.innerHTML = originalContents;
}
function print_ac_table(){
    var printContents = document.getElementById("ac_table").outerHTML;
    var originalContents = document.body.innerHTML;
    document.body.innerHTML = printContents;
    window.print();
    document.body.innerHTML = originalContents;
}
function print_cs(i){
    var t = document.getElementById("cs_table");
    var row = t.rows[i];
    var rowData = '';
    rowData += '<tr><td>ID:</td><td>' + row.cells[1].innerText + '</td></tr>';
    rowData += '<tr><td>姓名:</td><td>' + row.cells[2].innerText + '</td></tr>';
    rowData += '<tr><td>性别:</td><td>' + row.cells[3].innerText + '</td></tr>';
    rowData += '<tr><td>电话:</td><td>' + row.cells[4].innerText + '</td></tr>';
    rowData += '<tr><td>邮箱:</td><td>' + row.cells[5].innerText + '</td></tr>';
    rowData += '<tr><td>地址:</td><td>' + row.cells[6].innerText + '</td></tr>';
    rowData += '<tr><td>类别:</td><td>' + row.cells[7].innerText + '</td></tr>';
    rowData += '<tr><td>描述:</td><td>' + row.cells[8].innerText + '</td></tr>';
    rowData += '<tr><td>添加时间:</td><td>' + row.cells[9].innerText + '</td></tr>';
    var printView = '<table>' + rowData + '</table>';
    var printWindow = window.open('', '', 'height=1000,width=1600');
    printWindow.document.write('<html><head><title>打印表格</title></head><body>' + printView + '</body></html>');
    printWindow.document.close();
    printWindow.print();
    printWindow.close();
}
function print_em(i){
    var t = document.getElementById("em_table");
    var row = t.rows[i];
    var rowData = '';
    rowData += '<tr><td>ID:</td><td>' + row.cells[1].innerText + '</td></tr>';
    rowData += '<tr><td>姓名:</td><td>' + row.cells[2].innerText + '</td></tr>';
    rowData += '<tr><td>性别:</td><td>' + row.cells[3].innerText + '</td></tr>';
    rowData += '<tr><td>年龄:</td><td>' + row.cells[4].innerText + '</td></tr>';
    rowData += '<tr><td>职位:</td><td>' + row.cells[5].innerText + '</td></tr>';
    rowData += '<tr><td>部门:</td><td>' + row.cells[6].innerText + '</td></tr>';
    rowData += '<tr><td>电话:</td><td>' + row.cells[7].innerText + '</td></tr>';
    rowData += '<tr><td>邮箱:</td><td>' + row.cells[8].innerText + '</td></tr>';
    var printView = '<table>' + rowData + '</table>';
    var printWindow = window.open('', '', 'height=1000,width=1600');
    printWindow.document.write('<html><head><title>打印表格</title></head><body>' + printView + '</body></html>');
    printWindow.document.close();
    printWindow.print();
    printWindow.close();
}
function print_se(i){
    var t = document.getElementById("se_table");
    var row = t.rows[i];
    var rowData = '';
    rowData += '<tr><td>ID:</td><td>' + row.cells[1].innerText + '</td></tr>';
    rowData += '<tr><td>时间:</td><td>' + row.cells[2].innerText + '</td></tr>';
    rowData += '<tr><td>类型:</td><td>' + row.cells[3].innerText + '</td></tr>';
    rowData += '<tr><td>优先级:</td><td>' + row.cells[4].innerText + '</td></tr>';
    rowData += '<tr><td>状态:</td><td>' + row.cells[5].innerText + '</td></tr>';
    rowData += '<tr><td>描述:</td><td>' + row.cells[6].innerText + '</td></tr>';
    rowData += '<tr><td>反馈:</td><td>' + row.cells[7].innerText + '</td></tr>';
    rowData += '<tr><td>满意度:</td><td>' + row.cells[8].innerText + '</td></tr>';
    rowData += '<tr><td>客户:</td><td>' + row.cells[9].innerText + '</td></tr>';
    rowData += '<tr><td>客服:</td><td>' + row.cells[10].innerText + '</td></tr>';
    var printView = '<table>' + rowData + '</table>';
    var printWindow = window.open('', '', 'height=1000,width=1600');
    printWindow.document.write('<html><head><title>打印表格</title></head><body>' + printView + '</body></html>');
    printWindow.document.close();
    printWindow.print();
    printWindow.close();
}
function print_ac(i){
    var t = document.getElementById("ac_table");
    var row = t.rows[i];
    var rowData = '';
    rowData += '<tr><td  style="text-align: center; font-size: 24px; font-weight: bold;">活动信息书</td></tr>';
    rowData += '<tr><td>活动ID:</td><td>' + row.cells[1].innerText + '</td></tr>';
    rowData += '<tr><td>活动名称:</td><td>' + row.cells[2].innerText + '</td></tr>';
    rowData += '<tr><td>活动类型:</td><td>' + row.cells[3].innerText + '</td></tr>';
    rowData += '<tr><td>活动内容:</td><td>' + row.cells[4].innerText + '</td></tr>';
    rowData += '<tr><td>活动地址:</td><td>' + row.cells[5].innerText + '</td></tr>';
    rowData += '<tr><td>开始时间:</td><td>' + row.cells[6].innerText + '</td></tr>';
    rowData += '<tr><td>结束时间:</td><td>' + row.cells[7].innerText + '</td></tr>';
    rowData += '<tr><td>负责人员:</td><td>' + row.cells[8].innerText + '</td></tr>';
    rowData += '<tr><td>参与顾客:</td><td>' + row.cells[9].innerText + '</td></tr>';
    var printView = '<table>' + rowData + '</table>';
    var printWindow = window.open('', '', 'height=1000,width=1600');
    printWindow.document.write('<html><head><title>活动信息书</title></head><body>' + printView + '</body></html>');
    printWindow.document.close();
    printWindow.print();
    printWindow.close();
}
function classifyCs(){
    var xhr = new XMLHttpRequest();
    var branch = document.getElementById("cs_classify_select").value;
    var keyword = document.getElementById("cs_classify_inner").value;
    xhr.open('POST', 'classifyCsServlet', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
            // 处理 Servlet 返回的数据
            console.log(this.responseText);
        }
    };
    xhr.send('branch=' + encodeURIComponent(branch) + '&keyword='  + encodeURIComponent(keyword));
    window.location.reload();
}
function classifyEm(){
    var xhr = new XMLHttpRequest();
    var branch = document.getElementById("em_classify_select").value;
    var keyword = document.getElementById("em_classify_inner").value;
    xhr.open('POST', 'classifyEmServlet', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
            // 处理 Servlet 返回的数据
            console.log(this.responseText);
        }
    };
    xhr.send('branch=' + encodeURIComponent(branch) + '&keyword='  + encodeURIComponent(keyword));
    window.location.reload();
}
function classifySe(){
    var xhr = new XMLHttpRequest();
    var branch = document.getElementById("se_classify_select").value;
    var keyword = document.getElementById("se_classify_inner").value;
    xhr.open('POST', 'classifySeServlet', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
            // 处理 Servlet 返回的数据
            console.log(this.responseText);
        }
    };
    xhr.send('branch=' + encodeURIComponent(branch) + '&keyword='  + encodeURIComponent(keyword));
    window.location.reload();
}
function classifyAc(){
    var xhr = new XMLHttpRequest();
    var branch = document.getElementById("ac_classify_select").value;
    var keyword = document.getElementById("ac_classify_inner").value;
    xhr.open('POST', 'classifyAcServlet', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
            // 处理 Servlet 返回的数据
            console.log(this.responseText);
        }
    };
    xhr.send('branch=' + encodeURIComponent(branch) + '&keyword='  + encodeURIComponent(keyword));
    window.location.reload();
}
function cs_refresh_page(){
    var xhr = new XMLHttpRequest();
    var branch = document.getElementById("cs_classify_select").value;
    var keyword = document.getElementById("cs_classify_inner").value;
    xhr.open('POST', 'classifyCsServlet', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
            // 处理 Servlet 返回的数据
            console.log(this.responseText);
        }
    };
    xhr.send('branch=' + encodeURIComponent(branch) + '&keyword='  + encodeURIComponent(keyword));
    window.location.reload();
}
function em_refresh_page(){
    var xhr = new XMLHttpRequest();
    var branch = document.getElementById("em_classify_select").value;
    var keyword = document.getElementById("em_classify_inner").value;
    xhr.open('POST', 'classifyEmServlet', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
            // 处理 Servlet 返回的数据
            console.log(this.responseText);
        }
    };
    xhr.send('branch=' + encodeURIComponent(branch) + '&keyword='  + encodeURIComponent(keyword));
    window.location.reload();
}
function se_refresh_page(){
    var xhr = new XMLHttpRequest();
    var branch = document.getElementById("se_classify_select").value;
    var keyword = document.getElementById("se_classify_inner").value;
    xhr.open('POST', 'classifySeServlet', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
            // 处理 Servlet 返回的数据
            console.log(this.responseText);
        }
    };
    xhr.send('branch=' + encodeURIComponent(branch) + '&keyword='  + encodeURIComponent(keyword));
    window.location.reload();
}
function ac_refresh_page(){
    var xhr = new XMLHttpRequest();
    var branch = document.getElementById("ac_classify_select").value;
    var keyword = document.getElementById("ac_classify_inner").value;
    xhr.open('POST', 'classifyAcServlet', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
            // 处理 Servlet 返回的数据
            console.log(this.responseText);
        }
    };
    xhr.send('branch=' + encodeURIComponent(branch) + '&keyword='  + encodeURIComponent(keyword));
    window.location.reload();
}

function saveDivStates() {
    // 保存每个 div 的显示状态到 sessionStorage 中
    var divs = document.querySelectorAll('.main_content');
    for (var i = 0; i < divs.length; i++) {
        var id = divs[i].id;
        var isVisible = divs[i].style.display !== 'none';
        sessionStorage.setItem(id, isVisible);
    }
}

function restoreDivStates() {
    // 从 sessionStorage 中恢复每个 div 的显示状态
    var divs = document.querySelectorAll('.main_content');
    for (var i = 0; i < divs.length; i++) {
        var id = divs[i].id;
        var isVisible = sessionStorage.getItem(id);
        if (isVisible === 'true') {
            divs[i].style.display = 'block';
        } else {
            divs[i].style.display = 'none';
        }
    }
}
window.onload = function() {
    restoreDivStates();
};
// 在页面卸载时，保存每个 div 的显示状态
window.onunload = function() {
    saveDivStates();
};
function io_cs_table(event){
    event.stopPropagation(); // 防止事件冒泡
    var btn = document.getElementById("io_cs_table");
    if(btn.style.backgroundColor === "rgb(17, 116, 167)"){
        btn.style.backgroundColor = "rgb(69, 203, 255)";
    }else
    {
        btn.style.backgroundColor = "rgb(17, 116, 167)";
    }
    var io_div=document.getElementById("IO_div");
    if(io_div.style.display === "none"){
        io_div.style.display = "block";
    }else{
        io_div.style.display = "none";
    }
}
// 展示隐藏的导出页面
function show_out_cs(event)
{
    event.stopPropagation(); // 防止事件冒泡
    var out_cs = document.getElementById("out_cs");
    out_cs.style.display = "block";
    document.getElementById("IO_div").style.display = "none";
    document.getElementById("io_cs_table").style.backgroundColor = "rgb(69, 203, 255)";
    let overlay = document.createElement("div");
    overlay.className = "modal-overlay";
    document.body.appendChild(overlay);
    document.body.classList.add("modal-open");

}
function close_out_cs(){
    document.getElementById("out_cs").style.display = "none";
    let overlay = document.querySelector(".modal-overlay");
    document.body.removeChild(overlay);
    document.body.classList.add("modal-open");
}

function out_cs(){
    const checkboxs = document.querySelectorAll(".ck_out_cs");
    const selectedFields = [];
    checkboxs.forEach(function (checkbox){
        if(checkbox.checked){
            const label = checkbox.nextElementSibling;
            selectedFields.push(label.textContent);
        }
    })

    const table = document.getElementById('cs_table');
    const workbook = XLSX.utils.table_to_book(table, {raw: true, harder: 1});
    const worksheet = workbook.Sheets[workbook.SheetNames[0]];

// Convert the worksheet to JSON
    let data = XLSX.utils.sheet_to_json(worksheet, {header: 1,range: 0});

// Filter the data to only include selected fields
    data = data.map(row => row.filter((_, index) => selectedFields.includes(data[0][index])));

// Create a new workbook and worksheet with the filtered data
    const newWorkbook = XLSX.utils.book_new();
    const newWorksheet = XLSX.utils.json_to_sheet(data);

// Append the worksheet to the workbook
    XLSX.utils.book_append_sheet(newWorkbook, newWorksheet, "Sheet1");

// Write the workbook to a file
    const outputType = document.querySelector('input[name="out_file_kind"]:checked').id;
    if (outputType === 'csv') {
        const csv = XLSX.utils.sheet_to_csv(newWorksheet);
        const bom = new Uint8Array([0xEF, 0xBB, 0xBF]); // 添加 BOM 标记
        const blob = new Blob([bom, csv], { type: 'text/csv;charset=utf-8;' });
        const filename = '客户信息.csv';
        if (navigator.msSaveBlob) { // IE 10+
            navigator.msSaveBlob(blob, filename);
        } else {
            const link = document.createElement("a");
            if (link.download !== undefined) { // feature detection
                // Browsers that support HTML5 download attribute
                const url = URL.createObjectURL(blob);
                link.setAttribute("href", url);
                link.setAttribute("download", filename);
                link.style.visibility = "hidden";
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
            }
        }
    } else {
        XLSX.writeFile(newWorkbook, '客户信息.xlsx');
    }

    document.getElementById("out_cs").style.display = "none";
    let overlay = document.querySelector(".modal-overlay");
    document.body.removeChild(overlay);
    document.body.classList.add("modal-open");
// 将工作表添加到工作簿中，并将工作簿导出为 Excel 文件
}
function show_importCs(){
    event.stopPropagation(); // 防止事件冒泡
    var importCs = document.getElementById("importCsDiv");
    importCs.style.display = "block";
    document.getElementById("IO_div").style.display = "none";
    document.getElementById("io_cs_table").style.backgroundColor = "rgb(69, 203, 255)";
    let overlay = document.createElement("div");
    overlay.className = "modal-overlay";
    document.body.appendChild(overlay);
    document.body.classList.add("modal-open");
}
function close_importCs(){
    var importCs = document.getElementById("importCsDiv");
    importCs.style.display = "none";
    let overlay = document.querySelector(".modal-overlay");
    document.body.removeChild(overlay);
    document.body.classList.add("modal-open");
}