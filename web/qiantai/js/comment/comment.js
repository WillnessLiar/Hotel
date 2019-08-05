/**
 *
 */

/*$(document).ready(function () {*/
function createCanvas(percents, score) {


    //获取画布DOM
    var canvas = document.getElementById('canvas');

//设置绘图环境
    var cxt = canvas.getContext('2d');


//画一个空心圆形  凡是路径图形必须先开始路径，画完图之后必须结束路径
//开始新路径
    cxt.beginPath();
//重新设置画笔
    cxt.lineWidth = 12;
    cxt.strokeStyle = "#fdfdfd";
    cxt.arc(100, 100, 80, 1.5 * Math.PI, 3.5 * Math.PI, false);
    /*起始点0是三点的位置*/
    cxt.stroke();
//封闭新路径
    cxt.closePath();

    cxt.beginPath();
    cxt.lineWidth = 12;
    cxt.strokeStyle = "#ff922e";
    //x(	圆的中心的 x 坐标。),y(圆的中心的 y 坐标。),r(圆的半径。) sAngle(	起始角，以弧度计。（弧的圆形的三点钟位置是 0 度）。) eAngle(结束角，以弧度计),counterclockwise(se	可选。规定应该逆时针还是顺时针绘图。False = 顺时针，true = 逆时针。)
    cxt.arc(100, 100, 80, 1.5 * Math.PI, 1.5 * Math.PI + Math.PI * percents * 2, false);   //需要修改参数

    cxt.stroke();
    cxt.closePath();

    var aa = document.getElementById('my');

    cxt.font = '2.5em Arial';
    cxt.fillStyle = '#ff9264';
    cxt.textBaseline = 'middle';
    cxt.textAlign = 'center';
    cxt.fillText(score + '分', 100, 100);  //需要修改综合评分
    cxt.font = '1em Arial';
    cxt.fillStyle = '#ffffff';
    cxt.textBaseline = 'middle';
    cxt.textAlign = 'center';
    cxt.fillText('综合评分', 100, 130)


}

/*});*/

/*加载页面就执行 显示所有评价信息  以及综合评分*/
function showComment() {
    $.ajax({
        url: "/qiantaiCommentController/qiantaiComment",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data: {
            pageNo: "1"
        },
        async: true,
        type: "post",
        dataType: "json",
        success: function (data) {
            var percentages = (data.percents).toFixed(2);//保留1位小数
            var score = percentages * 5;  //综合分
            createCanvas(percentages, score); //创建画布显示综合分
            $("#pageNo").html(data.pNo);
            $("#pageNum").html(data.pageNum);
            $("#allComment").html("");//先清空
            // var json = str.parseJSON(data.list);
            for (var i = 0; i < data.list.length; i++) {
                $("#allComment").append("<div class=\"row\" style=\"background: #474747;border-bottom: 2px solid #ffa704\"> " +
                    "<div class=\" col-lg-3 col-md-3 col-xs-3\"> " +
                    "<div class=\"ho_user_icon\"> <div class=\"img_cicle\">" +
                    " <img src=\"" + data.list[i].cusImg + "\" class=\" \" style='width:80px;height: 80px;border-radius: 50%' alt=\"\"> " +
                    "</div> <span class=\"gray_color\">" + data.list[i].cusId + "</span>" +
                    " </div> </div> <div class=\"col-lg-8 col-md-8 col-xs-9\">" +
                    " <div style=\"margin-top: 3%\"> <p class=\"gray_color\">评价类型:<span>" + data.list[i].reviewType + "</span></p> <p class=\"gray_color\">" + data.list[i].content + "</p> " +
                    "<p class=\"gray_color\"> <span>点评日期</span> <span class=\"jiange\">" + data.list[i].reviewDate + "</span>" +
                    " <span class=\"jiange  starts\"></span></p> " +
                    "</div> </div> </div>");
            }
        },
        error: function (XMLHttpRequest, textStatus) {
            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        }
    })
}

/*上一页*/
// $("#pre").click(function () {
//     var preNo = parseInt($("#pageNo").text()) - parseInt(1);
//     if (preNo > 0) {
//         $.ajax({
//             contentType: "application/x-www-form-urlencoded;charset=utf-8",
//             url: "/qiantaiCommentController/qiantaiComment",
//             data: {"pageNo": preNo},
//             async: true,
//             type: "post",
//             dataType: "json",
//             success: function (data) {
//                 $("#allComment").html("");  //使用append时 先清除原先的内容
//                 $("#pageNo").text(data.pNo);
//                 for (var i = 0; i < data.list.length; i++) {
//                     $("#allComment").append("<div class=\"row\" style=\"background: #474747;border-bottom: 2px solid #ffa704\"> " +
//                         "<div class=\" col-lg-3 col-md-3 col-xs-3\"> " +
//                         "<div class=\"ho_user_icon\"> <div class=\"img_cicle\">" +
//                         " <img src=\"" + data.list[i].cusImg + "\" class=\" \" style='width:80px;height: 80px;border-radius: 50%' alt=\"\"> " +
//                         "</div> <span class=\"gray_color\">" + data.list[i].cusId + "</span>" +
//                         " </div> </div> <div class=\"col-lg-8 col-md-8 col-xs-9\">" +
//                         " <div style=\"margin-top: 3%\"> <p class=\"gray_color\">评价类型:<span>" + data.list[i].reviewType + "</span></p> <p class=\"gray_color\">" + data.list[i].content + "</p> " +
//                         "<p class=\"gray_color\"> <span>点评日期</span> <span class=\"jiange\">" + data.list[i].reviewDate + "</span>" +
//                         " <span class=\"jiange  starts\"></span></p> " +
//                         "</div> </div> </div>");
//                 }
//             },
//             error: function (XMLHttpRequest, textStatus) {
//                 alert(XMLHttpRequest.status);
//                 alert(XMLHttpRequest.readyState);
//                 alert(textStatus);
//             }
//
//
//         })
//     }
// });
//
// /*下一页*/
// $("#next").click(function () {
//     var nextNo = parseInt($("#pageNo").text()) + parseInt(1);
//     var pageNum = parseInt($("#pageNum").text());
//     if (nextNo <= pageNum) {
//         $.ajax({
//             contentType: "application/x-www-form-urlencoded;charset=utf-8",
//             url: "/qiantaiCommentController/qiantaiComment",
//             data: {"pageNo": nextNo},
//             async: true,
//             type: "post",
//             dataType: "json",
//             success: function (data) {
//                 $("#allComment").html("");  //使用append时 先清除原先的内容
//                 $("#pageNo").text(data.pNo);
//                 for (var i = 0; i < data.list.length; i++) {
//                     $("#allComment").append("<div class=\"row\" style=\"background: #474747;border-bottom: 2px solid #ffa704\"> " +
//                         "<div class=\" col-lg-3 col-md-3 col-xs-3\"> " +
//                         "<div class=\"ho_user_icon\"> <div class=\"img_cicle\">" +
//                         " <img src=\"" + data.list[i].cusImg + "\" class=\" \" style='width:80px;height: 80px;border-radius: 50%' alt=\"\"> " +
//                         "</div> <span class=\"gray_color\">" + data.list[i].cusId + "</span>" +
//                         " </div> </div> <div class=\"col-lg-8 col-md-8 col-xs-9\">" +
//                         " <div style=\"margin-top: 3%\"> <p class=\"gray_color\">评价类型:<span>" + data.list[i].reviewType + "</span></p> <p class=\"gray_color\">" + data.list[i].content + "</p> " +
//                         "<p class=\"gray_color\"> <span>点评日期</span> <span class=\"jiange\">" + data.list[i].reviewDate + "</span>" +
//                         " <span class=\"jiange  starts\"></span></p> " +
//                         "</div> </div> </div>");
//                 }
//             },
//             error: function (XMLHttpRequest, textStatus) {
//                 alert(XMLHttpRequest.status);
//                 alert(XMLHttpRequest.readyState);
//                 alert(textStatus);
//             }
//         })
//     }
// });