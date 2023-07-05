function showContent(id){
    var  content = document.getElementById("content"+id);
    for(var i = 1;i <=7;i++){
        var cn = document.getElementById("content"+i);
        cn.style.display = "none";
    }
    content.style.display = "block";
}