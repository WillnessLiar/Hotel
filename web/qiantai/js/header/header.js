/**
 * Created by 我不管我最帅 on 2018/6/6.
 */
/*生成登录（验证码）*/
var verifyCode = new GVerify("v_container");
 function check(){
    var res = verifyCode.validate(document.getElementById("code_input").value);
    if(res){
      return true;
    }else{
        return false;
    }
}

/*注册与登录切换*/
$("#to_zhuce").click(function(){
    $("#myModal").modal("hide");
    $("#zhuceModal").modal("show");
});
$("#to_login").click(function(){
    $("#zhuceModal").modal("hide");
    $("#myModal").modal("show");
});

/*隐藏显示我的信息*/
var timer;
$("#show_btn,#show").bind("mouseover",showInfo);  //进入按钮和显示框
$("#show_btn").bind("mouseout",hideInfo); //移出 按钮
$("#show").bind("mouseout",function () {   //移出显示框
    if(timer){clearTimeout(timer);}
    $("#show").hide();
});
function showInfo() {
    if(timer){clearTimeout(timer);}  //清除延时
    $("#show").show();
}
function hideInfo() {  /*延迟0.5s关闭*/
    timer=setTimeout(function(){
        $("#show").hide();
    },500);
}

/*显示密码小眼睛*/
$(".showpasswd").mousedown(function () {
    $(".passwd1").each(function () {
        $(this).attr("type","text");
    });


});
$(".showpasswd").mouseup(function () {
    $(".passwd1").each(function () {
        $(this).attr("type","password");
    });
});
/*操作成功提示*/
function tip(){
    $("#tip").slideDown("slow",function () {
        setTimeout(aa,3000)
    })
};
function aa() {
    $("#tip").slideUp("fast");
}
/*用户注册检索*/
function user(){
    var cusId=$("#cusId").val();
    var reg=new RegExp(/^[a-zA-Z0-9]+$/);
    if(cusId.length==0){
        // alert("用户名不能为空");
       $("#one").html("用户名不能为空");

        return false;
    }
    if(!(reg.test(cusId))){
/*         alert("用户名只能由数字和字母组成");*/
        $("#one").html("用户名只能由数字和字母组成");

        return false;
    }
    if((reg.test(cusId))){

        $("#one").html("");
        return true;
    }
}
/*密码*/
function pwd() {
    var password=$("#passwd").val();
    if(password.length==0){
 $("#two").html("密码不能为空");
 return false;
    }
    else if(password.length<6){
        $("#two").html("密码不能低于6位");
    }
    else{
        $("#two").html("");
        return true;
    }
}
/*确认密码*/
function checkPasswd() {
    var password=$("#passwd").val();
    var confPasswd=$("#confPasswd").val();
    if(confPasswd.length==0){
        $("#three").html("密码不能为空");
        return false;
    }
    else if(password!=confPasswd){
        $("#three").html("密码不一致");
    return false;
    }
    else{
        $("#three").html("");
        return true;
    }
}
/*真实姓名*/
function isName() {
var reg=new RegExp(/[u4E00-u9FA5]+/g);
var str=$("#trueName").val();
if(str.length<2||str.length>6||reg.test(str)){
    $("#four").html("请输入正确姓名");
    }
    else{
    $("#four").html("");
    }
}
/*手机*/
function isphone(){  //手机号验证
    var reg=new RegExp(/^1[0-9]{10}$/);
  var phone=$("#cusPhone").val();
   if(phone.length==0){
       $("#five").html("手机号不能为空");
       return false;
   }
    else if(!(reg.test(phone)))
    {//不通过
        $("#five").html("请输入正确手机号");
        return false;
    }
   else{
        //通过
        $("#five").html("");
        return true;
    }
}
//判断验证码是否为空


/*获取验证码*/
/*$("#getCode").removeAttr("disabled");*/
$("#getCode").click(function () {
    //如果手机号已输入且正确
    if($("#cusPhone").val().length==11){
        $.ajax({
            url: "getCode.action",
            data: {
                cusPhone: $("#cusPhone").val()
            },
            type: "post",
            async: true,
            dataType: "text",
            success: function (data) {
                if (data == 'true') {
                    alert("验证码发送成功，请注意查收");
                    time(this);
                } else {
                    alert("验证码发送失败");
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
//                        alert("error.....");
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);

            }
        })
    }else{
        alert("请检查手机号是否有误");
    }
});

//验证码验证
$("#code").blur(function () {
    $.ajax({
        url:"checkCode.action",
        data:{code:$("#code").val()
        },
        type:"post",
        async:true,
        dataType:"text",
        success:function (data) {
            var code_length=$("#code").val().length;
            if(code_length==0){ $("#a").html("请输入验证码"); }
            else if(data=='true'){
                $("#a").html("");
                return true;
            } else {
                $("#a").html("验证码错误");
                return false;
            }
        },
        error :function(XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        }

    })
});
/*倒计时*/
var wait=60;
function time(obj) {
    if(wait==0){
        $("#getCode").removeAttr("disabled");
        $("#getCode").val("获取验证码");
        wait=60;
    }
    else{
        $("#getCode").attr("disabled",true);
        $("#getCode").val(wait+"秒后重试");
        wait--;
        setTimeout(function (){time(obj);
        },1000);
    }

}
/*注册*/
$("#zhuce").click(function () {
   $.ajax({
       contentType:"application/x-www-form-urlencoded;charset=utf-8",
       url:"register.action",
       data:{"customer.cusId":$("#cusId").val(),
       "customer.cusPasswd":$("#passwd").val(),
       "customer.trueName":$("#trueName").val(),
       "customer.cusPhone":$("#cusPhone").val(),
       "customer.cusSex":$("#cusSex").val(),
       "customer.cusImg":$("#cusImg").val(),
       "customer.cusCode":$("#code").val()},
       type:"post",
       async:true,
       dataType:"text",
       success:function (data) {
        if(data=="可以注册"){
            $("#flags").text("");
            alert("注册成功，即将自动跳转.......");
            setTimeout(late,2000);
            return;
        }
           $("#flags").text(data);
       },
       error :function(XMLHttpRequest, textStatus, errorThrown) {
           alert(XMLHttpRequest.status);
           alert(XMLHttpRequest.readyState);
           alert(textStatus);
          alert("注册失败");
       }
   })

});
/*注册成功跳转*/
function  late() {
   window.location.href="index.jsp";
}

/*登录*/
$("#login").click(function () {
    var s=check();
    $.ajax({
        contentType:"application/x-www-form-urlencoded;charset=utf-8",
        url:"login.action",
        data:{"cus.cusId":$("#inputname").val(),
        "cus.cusPasswd":$("#inputPasswd").val(),
        "cus.cusCode":$("#code_input").val(),
            "code":s
        },
        type:"post",
        async:true,
        dataType:"text",
        success:function (data) {
            if(data=="ok"){
              /*  alert("登录成功");*/
                window.location.href="index.jsp";
            }
          $("#showInfo").text(data);
        },
        error :function(XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);

        }
    })
});

/*个人界面*/
$(".forward").click(function () {
    window.location.href="../jsp/personal.jsp";
});
/////修改个人信息
function hh() {
    var f = new FormData();
    var fileObject=$(".myfile").get(0).files[0];
    f.append("upload",fileObject);
    f.append("cus.cusImg",$("#upImg").val());
    f.append("cus.cusId",$("#upId").val());
    f.append("cus.cusPasswd",$("#upPasswd").val());
    f.append("cus.trueName",$("#upTrueName").val());
    f.append("cus.cusPhone",$("#upphone").val());
    f.append("cus.cusSex",$('input[name="sex"]').filter(':checked').val());
    $.ajax({
        type: 'POST',
        url: 'wahha.action',
        processData: false,
        contentType: false,
        data:f,
        async: true,
        datatype: 'json',
        success: function (data) {
            alert("修改成功");
            window.location.href="index.jsp"

        },
        error :function(XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);

        }

    });
}

//实时浏览
function changeg_pic(bot) {
    var file = bot.files[0];
    if (window.FileReader) {
        var reader = new FileReader();
        reader.readAsDataURL(file);
        //监听文件读取结束后事件
        reader.onloadend = function (e) {
         /*   $(bot).next().html("< img class=\"gooodspic\" src=\"" + e.target.result + "\"/>");*/
            $(".showImg").attr("src",e.target.result)
        };
    }
}