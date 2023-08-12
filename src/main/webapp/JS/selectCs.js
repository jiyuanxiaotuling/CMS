function selectAllCs() {
    // 获取全选复选框的状态
    var isChecked = document.getElementById("select_all_cs").checked;

    // 获取所有行的复选框
    var checkboxes = document.getElementsByName("row-checkbox-cs");
    //显示隐藏的btn
    var btn = document.getElementById("deleteCheckedCs");
    if(isChecked){
        btn.style.display = "block";
    }else
    {
        btn.style.display = "none";
    }
    // 设置所有行复选框的状态与全选复选框一致
    checkboxes.forEach(function(checkbox) {
        checkbox.checked = isChecked;
    });
}
function selectAllEm() {
    // 获取全选复选框的状态
    var isChecked = document.getElementById("select_all_em").checked;

    // 获取所有行的复选框
    var checkboxes = document.getElementsByName("row-checkbox-em");


    // 设置所有行复选框的状态与全选复选框一致
    checkboxes.forEach(function(checkbox) {
        checkbox.checked = isChecked;
    });
}
function selectAllSe() {
    // 获取全选复选框的状态
    var isChecked = document.getElementById("select_all_se").checked;

    // 获取所有行的复选框
    var checkboxes = document.getElementsByName("row-checkbox-se");


    // 设置所有行复选框的状态与全选复选框一致
    checkboxes.forEach(function(checkbox) {
        checkbox.checked = isChecked;
    });
}
function showCsBtn(){
    var checkboxes = document.getElementsByName("row-checkbox-cs");
    var btn = document.getElementById("deleteCheckedCs");
    var showbtn = false;
    for (let i = 0; i < checkboxes.length; i++) {
        if(checkboxes[i].checked){
            showbtn = true;
            break;
        }
    }
    if (showbtn) {
        btn.style.display = "block";
    } else {
        btn.style.display = "none";
        //取消全选
        document.getElementById("select_all_cs").checked = false;
    }
}
function DeleteAllCs() {
    // 获取所有行的复选框
    var checkboxes = document.getElementsByName("row-checkbox-cs");
    var select_id = [];
    // 遍历复选框，执行相应的操作
    checkboxes.forEach(function(checkbox) {
        if (checkbox.checked) {
            var row = checkbox.parentNode.parentNode;
            var id = row.cells[1].innerText; // 获取ID列的值,插入队列
            select_id.push(id);
        }
    });
    if(confirm("确定要删除选中客户的记录吗？")){
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "deleteCheckedCsServlet", true); // 替换为后端接口的URL
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
                // 处理 Servlet 返回的数据
                console.log("删除成功！");
            }
        };
        xhr.send("idss=" + encodeURIComponent(select_id.join(","))); // 将ID作为参数发送到后端
    }
}