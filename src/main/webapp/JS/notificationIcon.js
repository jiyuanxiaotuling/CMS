//控制消息图标的状态
function notificationIcon() {
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


                var tongzhi = document.getElementById('tongzhi');

                // 根据活动信息更改图标外观
                if (activity === "noActivity") {
                    // 设置通知元素为激活状态的外观
                    tongzhi.classList.remove('active');
                } else {
                    tongzhi.classList.add('active');
                }

            }
        }
    };

    // 发送请求
    xhr.send();
}