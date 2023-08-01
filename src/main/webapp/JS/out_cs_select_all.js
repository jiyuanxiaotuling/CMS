    // 获取元素
    var checkAll = document.getElementById("select-all");
    var checkboxes = document.querySelectorAll(".ck_out_cs");

    // 绑定事件
    checkAll.addEventListener("change", function() {
    checkboxes.forEach(function(checkbox) {
        checkbox.checked = checkAll.checked;
    });
});

    checkboxes.forEach(function(checkbox) {
    checkbox.addEventListener("change", function() {
        // 如果有任何一个 checkbox 没有被勾选，则取消 "全选" 的勾选状态
        checkAll.checked = checkboxes.every(function(item) {
            return item.checked;
        });
    });
});
