var fileInput = document.querySelector('.file_input');
var fileNameInput = document.getElementById('.file_name');
fileInput.addEventListener('change', function(e) {
    // 获取选中的文件对象
    var file = e.target.files[0];
    // 提取文件名
    var fileName = file.name;
    // 将文件名设置为 file_input 元素的值
    fileNameInput.value = fileName;
});