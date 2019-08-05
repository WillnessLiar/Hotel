<%--
  Created by IntelliJ IDEA.
  Date: 2018/6/14
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息</title>
    <script src="/houtai/js/jquery-3.3.1.js"></script>
    <script src="/houtai/js/bootstrap/bootstrap.js"></script>
    <link rel="stylesheet" href="/houtai/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="/houtai/css/customerinfo/customerinfo.css">
</head>
<body>
<div class="container-fluid" style="margin-top: 2vw">
    <div class="row">
        <div class="col-lg-offset-5 col-md-offset-5 col-sm-offset-2 col-xs-offset-2 col-lg-6 col-md-6 col-sm-8 col-xs-8 ">
            <%-- //******--%>
            <form class="form-inline" role="form">
                <div class="form-group ">
                    <label class="sr-only" for="strValue">关键字</label>
                    <input type="text" class="form-control " id="strValue" value="<c:out value="${sessionScope.strValue}"/>"  placeholder="搜索编号或姓名">
                </div>
                <a onclick="searches()" class="btn btn-success">搜索</a>
            </form>
        </div>
    </div>
    <div class="row">
<div class=" col-lg-offset-1  col-md-offset-1  col-lg-10 col-md-10 col-sm-12 col-xs-12">
<table class="table table-responsive table-bordered "
        id="tabList" style="font-family: 微软雅黑; font-size: 1.3rem;text-align: center">
    <tr >
        <th scope="col" class="text-center" >
           客户ID
        </th>
        <th scope="col" class="text-center">
            登录密码
        </th>
        <th scope="col"  class="text-center">
           姓名
        </th>
        <th scope="col"  class="text-center">
           性别
        </th>
        <th scope="col"  class="text-center">
            联系电话
        </th>
        <th scope="col"  class="text-center">
           用户头像
        </th>
        <th scope="col"  class="text-center">
            操作
        </th>
    </tr>
<c:forEach items="${sessionScope.list}" var="list">
    <tr>
        <td class="cusId"><c:out value="${list.cusId}"/></td>
        <td class="cusPasswd"><c:out value="${list.cusPasswd}"/></td>
        <td class="trueName" ><c:out value="${list.trueName}"/></td>
        <td class="cusSex"><c:out value="${list.cusSex}"/></td>
        <td class="cusPhone"><c:out value="${list.cusPhone}"/></td>
        <td class="cusImg"><c:out value="${list.cusImg}"/></td>
        <td align="center">
            <a class="btn btn-success modiCus" data-toggle="modal" data-target="#UpdCusModal">修改</a>
            <a class="btn btn-danger"   onclick="return confirm('确定删除?')">删除</a>
        </td>
    </tr>
</c:forEach>

</table>
</div>
    </div>
    <div class="row" style="margin-top: 5%;margin-bottom: 2%">
        <div class=" col-lg-offset-9 col-md-offset-9 col-xs-offset-3 col-lg-3 col-md-3 col-xs-9">
            <span class="curent_yeshu">当前页<span id="pageNo"><c:out value="${sessionScope.pageNo}"/> </span>/<span id="pageNum"><c:out value="${sessionScope.pageNum}"/> </span></span>
            <a  class="btn btn-success" onclick="preNo()" id="pre">上一页</a>
            <a class="btn btn-success" onclick="nextNo()" id="next" >下一页</a>
        </div>
    </div>
</div>
<%--修改弹窗--%>
<div class="modal fade" style="font-family: 幼圆" id="UpdCusModal" tabindex="-1" role="dialog" aria-labelledby="publicModal " aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 style="text-align: center">修改用户信息</h4>
            </div>
            <div class="modal-body">
                <div class="row margin_1">
                    <div class="col-lg-12 col-xs-12">
                        <form action="" method="post" name="form1">
                            <table class="table table-responsive table-bordered table-hover p1">

                                <tr>
                                    <td align="right">
                                        客户ID
                                    </td>
                                    <td align="left">
                                        <div class="row">
                                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                <input class="form-control " type="text"  id="crecusId" size="20" disabled >
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                       登录密码
                                    </td>
                                    <td align="left">
                                        <div class="row">
                                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                <input class="form-control " type="text"  id="crecusPasswd" size="20" >
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                       姓名
                                    </td>
                                    <td align="left">
                                        <div class="row">
                                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                <input class="form-control " type="text" id="cretrueName" size="20" >
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                       联系电话
                                    </td>
                                    <td align="left">
                                        <div class="row">
                                            <div class="col-lg-7 col-sm-7 col-xs-7">
                                                <input class="form-control " type="text" id="crecusPhone"  size="40" >
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                      用户头像
                                    </td>
                                    <td align="left">
                                        <div class="row">
                                            <div class="col-lg-7 col-sm-7 col-xs-7">
                                                <input class="form-control " type="text" name="" id="crecusImg" size="40" >
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        性别
                                    </td>
                                    <td align="left">
                                        <input name="createSex" type="radio" id="radi" class="crecusSex" value="男" checked>
                                        <label for="radio" style="font-weight: 100">
                                            男
                                        </label>
                                        <input type="radio" name="createSex" class="crecusSex" id="radio" value="女">
                                        <label for="radio" style="font-weight: 100">
                                            女
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2" align="center" style="text-align: center">
                                        <a class="btn btn-success" id="subXiugai" onclick="updCusInfo()">确认修改</a>
                                        &nbsp;
                                        &nbsp;
                                        <input class="btn btn-default" name="Input" type="button" value="返回"
                                               onClick="javascript:history.back();">
                                        <input name="action" type="hidden" value="201" />
                                    </th>

                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>  <%--修改弹窗结束--%>
</body>
<%--<script src="../js/customerinfo/customerinfo.js" type="text/javascript"></script>--%>
<script>
    /**
     * Created by Lunatic Princess
     */
//上一页
    function preNo() {
        var preNo=parseInt($("#pageNo").text())-parseInt(1);  //当前页-1
        var strValue=$("#strValue").val();
        if(preNo>0){
            $.ajax({
                contentType:"application/x-www-form-urlencoded;charset=utf-8",
                url:"/CustomerController/fenye",
                data:{"pagesNo":preNo,
                    "strValue":strValue
                },
                async: true,
                type:"post",
                dataType:"text",
                success:function (data) {
                    if(data=="ok"){
                        window.location.href="/houtai/jsp/customerinfo.jsp";
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
    function nextNo() {
        var nextNo=parseInt($("#pageNo").text())+parseInt(1);  //当前页+1
        var pagesSum=parseInt($("#pageNum").text());//总页数
        var strValue=$("#strValue").val();
        if(nextNo<=pagesSum){
            $.ajax({
                contentType:"application/x-www-form-urlencoded;charset=utf-8",
                url:"/CustomerController/fenye",
                data:{"pagesNo":nextNo,
                    "strValue":strValue
                },
                async: true,
                type:"post",
                dataType:"text",
                success:function (data) {
                    if(data=="ok"){
                        window.location.href="/houtai/jsp/customerinfo.jsp";
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
            url:"queryByValue.action",
            data:{
                "pagesNo":1,
                "strValue":strValue
            },
            async: true,
            type:"post",
            dataType:"text",
            success:function (data) {
                if(data=="ok"){
                    window.location.href="customerinfo.jsp";
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }
        })
    }
    /*
     进入修改员工信息界面 根据用户ID，先判断当前点击的按钮是那个用户ID*/
    $(".modicus").click(function () {
        var index=$(".modicus").index($(this));
        var cusId=$(".cusId").eq(index).text();//cusID
        var cusPasswd=$(".cuspasswd").eq(index).text(); //passwd
        var  trueName=$(".trueName").eq(index).text();//trueName
        var cusSex=$(".cusSex").eq(index).text();//cussex
        var cusPhone=$(".cusphone").eq(index).text();//cusphone
        var cusImg=$(".cusImg").eq(index).text(); //cusImg
        $("#crecusId").val(cusId);
        $("#crecusPasswd").val(cusPasswd);
        $("#cretrueName").val(trueName);
        $("#crecusPhone").val(cusPhone);
        $("#crecusImg").val(cusImg);
        $(".crecusSex").each(function () {
            if($(this).val()===cusSex){
                $(this).attr("checked",true);
            }
        })
    });

    // 修改用户信息
    function updCusInfo() {
        confirm("确认修改？");
        var cusId=$("#crecusId").val(); //id
        var cusPasswd=$("#crecusPasswd").val();//cuspasswd
        var trueName=$("#cretrueName").val(); //name
        var cusPhone=$("#crecusPhone").val(); //phone
        var cusSex=$('input[name="createSex"]').filter(':checked').val();
        var cusImg=$("#crecusImg").val();
        if(cusId!=null&&trueName!=null&&cusPhone!=null&&cusSex!=null&&cusImg!=null&&cusPasswd!=null) {
            $.ajax({
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                url: "/CustomerController/udpCus",
                data: {
                    "cub.cusId": cusId,
                    "cub.cusPasswd":cusPasswd,
                    "cub.trueName":trueName,
                    "cub.cusPhone": cusPhone,
                    "cub.cusSex": cusSex,
                    "cub.cusImg":cusImg
                },
                async: true,
                type: "post",
                dataType: "text",
                success: function (data) {
                    if (data == "ok") {
                        alert("修改成功");
                        window.location.href="/houtai/jsp/customerinfo.jsp";
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

    //删除
    $(".btn-danger").click(function () {
        var index=$(".btn-danger").index($(this));
        var cusId=$(".cusId").eq(index).text();
        alert(cusId);
        $.ajax({
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            url:"/CustomerController/deleteCus",
            data:{"cub.cusId":cusId},
            async: true,
            type:"post",
            dataType:"text",
            success:function (data) {
                if(data=="ok"){
                    alert("删除成功");
                    window.location.href="/houtai/jsp/customerinfo.jsp";
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }
        })
    });
</script>
</html>
