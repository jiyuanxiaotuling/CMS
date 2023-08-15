const checkboxs = document.querySelectorAll(".ck_out_cs");
const selectedFields = [];
checkboxs.forEach(function (checkbox){
    if(checkbox.checked){
        const label = checkbox.nextElementSibling;
        selectedFields.push(label.textContent);
    }
})
const table = document.getElementById('cs_table');
const workbook = XLSX.utils.book_new();
const worksheet = XLSX.utils.table_to_sheet(table);

// 删除不需要导出的列
for (let i = worksheet['!cols'].length - 1; i >= 0; i--) {
    const column = worksheet['!cols'][i];
    const columnName = XLSX.utils.encode_col(i);

    if (selectedFields.indexOf(columnName) === -1) {
        worksheet['!cols'].splice(i, 1);
        delete worksheet[columnName + '1'];
    }
}
// 删除第一行
const firstRowKey = Object.keys(worksheet).find(key => key.endsWith('1'));
delete worksheet[firstRowKey];

// 将工作表添加到工作簿中，并将工作簿导出为 Excel 文件
XLSX.utils.book_append_sheet(workbook, worksheet, '客户信息');
XLSX.writeFile(workbook, '客户信息.xlsx');