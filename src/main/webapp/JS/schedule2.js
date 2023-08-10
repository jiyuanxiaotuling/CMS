
var em_id = session.getAttribute("emId");
console.log(em_id);
var xhr = new XMLHttpRequest();
xhr.open("POST", "getDateServlet", true); // 替换为后端接口的URL
xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
xhr.onreadystatechange = function() {
    if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {

    }
};
xhr.send("em_id=" + encodeURIComponent(emId)); // 将ID作为参数发送到后端
// 从 sessionStorage 中获取存储的 JSON 字符串
var jsonString = sessionStorage.getItem("ac_ar");
// 将 JSON 字符串解析为 JavaScript 对象
var arrayList = JSON.parse(jsonString);
var divElement = document.querySelector('div');

divElement.addEventListener('click', function() {
    var dateValue = divElement.getAttribute('date');
    var dateParts = dateValue.split('/');
    var year = parseInt(dateParts[0]); // 年份
    var month = parseInt(dateParts[1]); // 月份
    var day = parseInt(dateParts[2]); // 日期
    console.log(year);
    for (var i = 0; i < arrayList.length; i++) {
        if(arrayList[5].getFullYear() === year && arrayList[5].getMonth() === month && arrayList[5].getDate() === day){
             console.log(dateValue); // 输出点击的 div 元素的 date 属性值
        }
    }

});