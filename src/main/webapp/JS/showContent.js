function showContent(id){
    var  content = document.getElementById("content"+id);
    for(var i = 1;i <=6;i++){
        var cn = document.getElementById("content"+i);
        cn.style.display = "none";
    }
    content.style.display = "block";
}
function showcontent(id){
    var  content = document.getElementById("forContent"+id);
    for(var i = 1;i <= 2;i++){
        var cn = document.getElementById("forContent"+i);
        cn.style.display = "none";
    }
    content.style.display = "block";
    if(id === 2){
        document.getElementById("old_pwd").value = "";
        document.getElementById("new_pwd").value = "";
        document.getElementById("new_pwd2").value = "";
    }

}