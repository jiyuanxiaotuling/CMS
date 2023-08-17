//备份恢复

document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("backupBtn").addEventListener("click", function() {
        window.location.href = "BackupRestoreServlet?action=backup";
        showNotification("备份已完成");
    });

    document.getElementById("importBtn").addEventListener("click", function() {
        var fileInput = document.createElement("input");
        fileInput.type = "file";
        fileInput.accept = ".sql";

        fileInput.addEventListener("change", function(event) {
            var file = event.target.files[0];
            var formData = new FormData();
            formData.append("backupFile", file);

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "BackupRestoreServlet?action=import");
            xhr.onload = function() {
                if (xhr.status === 200) {
                    // Restore operation successful
                    showNotification("恢复已完成");
                } else {
                    // Restore operation failed
                    showNotification("恢复失败");
                }
            };
            xhr.send(formData);
        });

        fileInput.click();
    });

    function showNotification(message) {
        alert(message); // 这里使用了简单的 alert 提示框作为示例
    }

    document.getElementById("intervalSubmit").addEventListener("submit", function(event) {
        event.preventDefault();

        var interval = document.getElementById("backupInterval").value;

        function performBackup() {

            window.location.href = "BackupRestoreServlet?action=backup";
            showNotification("备份已完成");
        }

// 转换时间单位为毫秒
        function convertToMilliseconds(interval) {
            var milliseconds = 0;
                    milliseconds = interval * 1000 * 60 * 60 * 24;
            return milliseconds;
        }

        var backupTimer = setInterval(performBackup, convertToMilliseconds(interval));

    });
});