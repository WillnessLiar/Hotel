/**
 * Created by 我不管我最帅 on 2018/6/6.
 */
/*评级（好中差）*/
$(function(){
    $(':input').labelauty();
});

/*获取评级等级*/
/*
$("#public").click(function () {
    var a=$("input[name='radio']:checked").val();
    alert(a);
});
*/

$(function() {
    // Rated Callback
    $("#demo6 .ratyli").ratyli({
        onRated:function(value,init){
            // rating callback
            /*if(!init) alert(value);*/
            if(value==1)$("#level").text("非常差");
            else if(value==2)$("#level").text("差");
            else if(value==3)$("#level").text("一般");
            else if(value==4)$("#level").text("好");
            else if(value==5)$("#level").text("非常好");
            else $("#level").text("");
            $("#level").val(value);  // prevent run at init
           $("#start").val(value);  //把数字放进去
   /*       alert($("#start").val());*/
        }
    });
});