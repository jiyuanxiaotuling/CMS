//查询是否有即将进行或者正在进行的活动
function checkActivity() {
    // 创建 XMLHttpRequest 对象
    var xhr = new XMLHttpRequest();

    // 设置请求方法和URL
    xhr.open('GET', 'CheckActivityServlet', true);

    // 设置回调函数，处理服务器端响应
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                // 处理服务器端返回的活动信息
                var activity = xhr.responseText;

                // 显示相应的弹窗内容
                if (activity === "hasFutureActivity") {
                    alert('有活动即将开始');
                } else if (activity === "hasDoingActivity") {
                    alert('有活动正在进行');
                } else if (activity === "noActivity") {
                    alert('最近没有活动');
                } else {
                    alert('活动信息获取失败');
                }
            }
        }
    };
    // 发送请求
    xhr.send();
}