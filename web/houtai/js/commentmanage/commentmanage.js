/**
 * Created by 我不管我最帅 on 2018/6/26.
 */
//上一页
function preNo() {
    var preNo=parseInt($("#pageNo").text())-parseInt(1);  //当前页-1
    var strValue=$("#strValue").val();
    if(preNo>0){
        $.ajax({
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            url:"/CommentController/fenye",
            data:{"pagesNo":preNo,
                "strValue":strValue
            },
            async: true,
            type:"post",
            dataType:"text",
            success:function (data) {
                if(data=="ok"){
                    window.location.href="/houtai/jsp/comment.jsp";
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }
        })
    }
}

/*下一页*/
function nextNo(){
    var nextNo=parseInt($("#pageNo").text())+parseInt(1);  //当前页+1
    var pagesSum=parseInt($("#pageNum").text());//总页数
    var strValue=$("#strValue").val();
    if(nextNo<=pagesSum){
        $.ajax({
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            url:"/CommentController/fenye",
            data:{"pagesNo":nextNo,
                "strValue":strValue
            },
            async: true,
            type:"post",
            dataType:"text",
            success:function (data) {
                if(data=="ok"){
                    window.location.href="/houtai/jsp/comment.jsp";
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }
        })
    }
}


/*搜索时*/
function  searches() {
    var strValue=$("#strValue").val();
    $.ajax({
        contentType:"application/x-www-form-urlencoded;charset=utf-8",
        url:"/CommentController/searchesComment",
        data:{
            "pagesNo":1,
            "strValue":strValue
        },
        async: true,
        type:"post",
        dataType:"text",
        success:function (data) {
            if(data=="ok"){
                window.location.href="/houtai/jsp/comment.jsp";
            }
        },
        error: function (XMLHttpRequest, textStatus) {
            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        }
    })
}

/*修改员工信息 根据员工编号
 先判断当前点击的按钮是那个员工编号*/
$(".xiugai").click(function () {
    var index=$(".xiugai").index($(this));
    $("#crereviewId").val($(".reviewId").eq(index).text());
    $("#contents").val($(".reviewContent").eq(index).text());

});


