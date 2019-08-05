
/**
 * Created by 我不管我最帅 on 2018/6/13.
 */
/*function dianji(){
    $(".rd").css({left:"15vw"});
    $(".ld").css({left:"0vw"});
 $(".n").css({left:"15vw"});
   $(".n").onclick=function(){
        fanhui();
    }
}
function fanhui(){
    $(".ld").css({left:"-15vw"});
    $(".rd").css({left:"0vw"});
    $(".n").css({left:"0vw"});
    $(".n").onclick=function(){
        dianji();
    }
}*/

function dianji(){
    var a=document.getElementById("ld");
    var b=document.getElementById("rd");
    var c=document.getElementById("n");
    var d=document.getElementById("main_right_bottom");
    a.style.left="0vw";
    b.style.left="15vw";
    c.style.left="15vw";
    d.style.left="15vw";
    document.getElementById("n").onclick=function(){
        fanhui();
    }
}
function fanhui(){
    var a=document.getElementById("ld");
    var b=document.getElementById("rd");
    var c=document.getElementById("n");
    var d=document.getElementById("main_right_bottom");
    a.style.left="-15vw";
    b.style.left="0vw";
    c.style.left="0vw";
    d.style.left="0vw";
    document.getElementById("n").onclick=function(){
        dianji();
    }
}
/*
$("#a_home").click(function () {
    $("#main_right_bottom").load("workerinfo.jsp")
});
$("#a_customer").click(function () {
    $("#main_right_bottom").load("customerinfo.jsp")
});
$("#a_room").click(function () {
    $("#main_right_bottom").load("roommanage.jsp")
});
$("#a_comment").click(function () {
    $("#main_right_bottom").load("comment.jsp")
});
$("#a_book").click(function () {
    $("#main_right_bottom").load("bookmanage.jsp")
});*/
