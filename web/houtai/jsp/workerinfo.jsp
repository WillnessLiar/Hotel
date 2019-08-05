<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>

    <base href="<%=basePath%>">
    <title>message</title>
    <script src="<%=basePath%>/houtai/js/jquery-3.3.1.js"></script>
    <script src="<%=basePath%>/houtai/js/bootstrap/bootstrap.js"></script>
    <link rel="stylesheet" href="<%=basePath%>/houtai/css/bootstrap/bootstrap.css">
    <link href="../css/workerinfo/workerinfo.css" rel="stylesheet" />
</head>
<body>
<div class="container-fluid" style="margin-top: 2vw">
    <div class="row">

        <div class="col-lg-offset-5 col-md-offset-5 col-sm-offset-2 col-xs-offset-2 col-lg-6 col-md-6 col-sm-8 col-xs-8 ">
            <form class="form-inline" role="form">
                <div class="form-group ">
                    <label class="sr-only" for="strValue">关键字</label>
                    <input type="text" class="form-control " id="strValue" value="" placeholder="搜索编号或姓名">
                </div>
                <a href="javascript:search();" class="btn btn-success">搜索</a>
                <a class="btn btn-info" data-toggle="modal" data-target="#AddWorkerModal">增加员工</a>

            </form>
        </div>
    </div>

    <div class="row">
    <div class="col-lg-offset-1 col-lg-10">
            <table class="table table-responsive table-bordered" style="font-family: 微软雅黑;text-align:center;font-size: 1.3rem;">
    <tr >
        <th class="text-center">
            员工编号
        </th>
        <th class="text-center">
            员工姓名
        </th>
        <th class="text-center">
            联系电话
        </th>
        <th class="text-center">
            住址
        </th>
        <th class="text-center">
            职位
        </th>
        <th class="text-center">
            性别
        </th>
        <th class="text-center">
            入职时间
        </th>
        <th class="text-center">
           状态
        </th>
        <th class="text-center">
            操作
        </th>
    </tr>
    <c:forEach items="${sessionScope.list}" var="list">
        <tr>
            <td class="workerId"><c:out value="${list.workerId}"/></td>
            <td class="workerName"><c:out value="${list.workerName}"/></td>
            <td class="workerPhone"><c:out value="${list.workerPhone}"/></td>
            <td class="address"><c:out value="${list.address}"/></td>
            <td class="position"><c:out value="${list.position}"/></td>
            <td class="workerSex"><c:out value="${list.workerSex}"/></td>
            <td class="inDate"><c:out value="${list.inDate}"/></td>
            <td class="isWork"><c:out value="${list.isWork}"/></td>
            <td class="status"><c:out value="${list.status}"/></td>
            <td>
                <a data-toggle="modal" data-target="#UpdWorkerModal" type="button" class="btn btn-primary xiugai" >修改</a>
                <a  class="btn btn-warning deleteWorker"  >清理门户</a>
            </td>
        </tr>
     </c:forEach>
</table>
</div>
    </div>
    <div class="row" style="margin-top: 5%;margin-bottom: 2%">
        <div class=" col-lg-offset-9 col-md-offset-9 col-xs-offset-3 col-lg-3 col-md-3 col-xs-9">
            <span class="curent_yeshu">当前页<span id="pageNo"><c:out value="${sessionScope.pageNo}"/> </span>/<span id="pageNum"><c:out value="${sessionScope.pageNum}"/> </span></span>
            <a  class="btn btn-success" onclick="preNo()"  id="pre">上一页</a>
            <a class="btn btn-success" onclick="nextNo()" id="next" >下一页</a>
        </div>
    </div>
</div>

<%--修改弹窗--%>
<div class="modal fade" style="font-family: 幼圆" id="UpdWorkerModal" tabindex="-1" role="dialog" aria-labelledby="publicModal " aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 style="text-align: center">修改员工信息</h4>
            </div>
            <div class="modal-body">
                    <div class="row margin_1">
                        <div class="col-lg-12 col-xs-12">
                            <form action="" method="post" name="form1">
                                <table class="table table-responsive table-bordered table-hover p1">

                                    <tr>
                                        <td align="right">
                                            员工编号
                                        </td>
                                        <td align="left">
                                            <div class="row">
                                                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                    <input class="form-control " type="text" name="NO" id="workerId" size="20" disabled >
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            员工姓名
                                        </td>
                                        <td align="left">
                                            <div class="row">
                                                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                    <input class="form-control " type="text" name="name" id="workerName" size="20" >
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            电话号码
                                        </td>
                                        <td align="left">
                                            <div class="row">
                                                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                    <input class="form-control " type="text" name="telphone" id="workerPhone" size="20" >
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            住址
                                        </td>
                                        <td align="left">
                                            <div class="row">
                                                <div class="col-lg-9 col-sm-9 col-xs-9">
                                                    <input class="form-control " type="text" name="address" id="address" size="40" >
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            状态
                                        </td>
                                        <td align="left">
                                            <div class="row">
                                                <div class="col-lg-4 col-sm-4 col-xs-4">
                                                    <select class="form-control">
                                                        <option  class="status" name="status"  value="inwork" >在职</option>
                                                        <option class="status"  name="status" value="outwork">离职</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            职位
                                        </td>
                                        <td align="left">
                                            <div class="row">
                                                <div class="col-lg-4 col-xs-6">
                                                    <select class="form-control ">
                                                        <option  class="zhiwei" name="dengji"  value="cleaner" >保洁员</option>
                                                        <option class="zhiwei"  name="dengji" value="manager">经理</option>
                                                        <option   class="zhiwei" name="dengji" value="waiter">服务员</option>
                                                        <option   class="zhiwei" name="dengji" value="man">保安</option>
                                                        <option   class="zhiwei" name="dengji" value="lady">前台</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            性别
                                        </td>
                                        <td align="left">
                                            <input name="sex" class="sex" type="radio"   value="male" checked>
                                            <label for="radio" style="font-weight: 100">
                                                男
                                            </label>
                                            <input type="radio" class="sex" name="sex" value="female">
                                            <label for="radio" style="font-weight: 100">
                                                女
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th colspan="2" align="center" style="text-align: center">
                                            <a class="btn btn-success" id="updWorker" >确认修改</a>
                                            &nbsp;
                                            &nbsp;
                                            <input class="btn btn-default" name="Input" type="button" value="返回"
                                                   onClick="">
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

<%--增加员工弹窗--%>
<div class="modal fade" style="font-family: 幼圆;" id="AddWorkerModal" tabindex="-1" role="dialog" aria-labelledby="publicModal"  aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 style="text-align: center">增加员工信息</h4>
            </div>
            <div class="modal-body">
                <div class="row margin_1">
                    <div class="col-lg-12 col-xs-12">
                        <form action="" method="post" name="form2">
                            <table class="table table-responsive table-bordered table-hover p1">

                                <tr>
                                    <td align="right">
                                        员工编号
                                    </td>
                                    <td align="left">
                                        <div class="row">
                                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                    <input class="form-control input_width" type="text" name="workerId" id="creWorkerId" >
                                            </div>

                                            <a class="btn btn-info" id="createId" href="javascript:void(0);" onclick="creworkerId()" >自动生成</a>
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        员工姓名
                                    </td>
                                    <td align="left">
                                        <div class="row">
                                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                <input class="form-control input_width" type="text" name="workerName" id="createName" size="20" maxlength="20">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        电话号码
                                    </td>
                                    <td align="left">
                                        <div class="row">
                                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                <input class="form-control" type="text" name="workerPhone" id="createPhone"  size="20" maxlength="20">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        住址
                                    </td>
                                    <td align="left">
                                        <div class="row">
                                            <div class="col-lg-9 col-sm-9 col-xs-9">
                                                <input class="form-control input_width" name="address" type="text" id="createAddress" size="40" maxlength="40">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        职位
                                    </td>
                                    <td align="left">
                                        <div class="row">
                                            <div class="col-lg-4 col-xs-6">
                                                <select class="form-control" name="position" id="createPosition">
                                                    <option name="zhiwei">washer</option>
                                                    <option name="zhiwei">manager</option>
                                                    <option name="zhiwei">waiter</option>
                                                    <option name="zhiwei">boss</option>
                                                    <option name="zhiwei">teacher</option>
                                                </select>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        性别
                                    </td>
                                    <td align="left">
                                        <input name="createSex" type="radio" id="radi" value="male" checked>
                                        <label for="radio" style="font-weight: 100">
                                            男
                                        </label>
                                        <input type="radio" name="createSex" id="radio" value="famale">
                                        <label for="radio" style="font-weight: 100">
                                            女
                                        </label>
                                        <input id="createInDate" hidden >
                                        <input id="isWorker" value="inwork" hidden >
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2" align="center" style="text-align: center">
                                        <input class="btn btn-success" name="submit1" id="addWorker" type="button" value="提交">
                                        &nbsp;
                                        <input class="btn btn-warning" name="submit2" type="reset" value="重置">
                                        &nbsp;
                                        <input class="btn btn-default" name="Input" type="button" value="返回"
                                               onClick="history.back(-1);">
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
</div>  <%--增加员工弹窗结束--%>

<div id="a" style="width:80px;height: 25px;background: #52ce2f;display: none;font-family: 微软雅黑;color: #f7f7f7;line-height: 25px;text-align: center;position: fixed;left:48%">操作成功</div>
</body>
<script src="../../houtai/js/commentmanage/workerinfo.js" type="text/javascript"></script>
<script type="text/javascript">

    //
    // getVarDate()
    // {
    //     var curDate = new Date();
    //     var year = curDate.getFullYear();
    //     var mon = curDate.getMonth() + 1;
    //     mon = checks(mon);
    //     var date = curDate.getDate();
    //     date = checks(date);
    //     var val = year + '' + mon + '' + date;
    //
    //     function checks(str) {
    //         if (str < 10) {
    //             str = "0" + str;
    //         }
    //         return str;
    //     }
    // }

    //自动生成 员工编号
    function creworkerId(){
        var curDate=new Date();
        var year=curDate.getFullYear();
        var mon=curDate.getMonth()+1;
        mon=checks(mon);
        var date=curDate.getDate();
        date=checks(date);
        var hour=curDate.getHours();
        hour=checks(hour);
        var minute=curDate.getMinutes();
        minute=checks(minute);
        var second=curDate.getSeconds();
        var val = year + '' + mon + '' + date + '' + hour + '' + minute + '' + second;
        var indate=year+"-"+mon+"-"+date;
        $("#creWorkerId").val(val);
        $("#createInDate").val(indate);
    }
        /*补0*/
    function checks(str) {
        if(str<10){
            str="0"+str;
        }
        return str;
    }

    //增加员工信息
    $("#addWorker").click(function () {
        var workerId = $("#creWorkerId").val();
        var workerName = $("#createName").val();
        var workerPhone = $("#createPhone").val();
        var address = $("#createAddress").val();
        var zhiwei = $('option[name="zhiwei"]').filter(':selected').val();
        var workerSex = $('input[name="createSex"]').filter(':checked').val();
        var inDate = $("#createInDate").val();
        var isWorker = $("#isWorker").val();
        alert(workerId + "-" + workerName + "--" + workerPhone + "--" + address + "--" + zhiwei + "--" + workerSex + "--" + inDate + "--" + isWorker);
        if (workerId != null && workerName != null && workerPhone != null && address != null && zhiwei != null && workerSex != null && inDate != null) {
            $.ajax({
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                url: "/WorkerController/addWorker",
                data: {
                    "workerId": workerId,
                    "workerName": workerName,
                    "workerPhone": workerPhone,
                    "address": address,
                    "position": zhiwei,
                    "workerSex": workerSex,
                    "inDate": inDate,
                    "isWork": isWorker,
                    "status": "1"
                },
                async: true,
                type: "post",
                dataType: "text",
                success: function (data) {
                    if (data == "ok") {
                        alert("添加成功");
                        window.location.href = "/houtai/jsp/workerinfo.jsp";
                    }
                },
                error: function (XMLHttpRequest, textStatus) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(textStatus);
                }
            })
        }
    });

    //     function  addWorker() {
    //     var workerId=$("#creWorkerId").val();
    //     var workerName=$("#createName").val();
    //     var workerPhone=$("#createPhone").val();
    //     var address=$("#createAddress").val();
    //     var zhiwei=$('option[name="zhiwei"]').filter(':selected').val();
    //     var workerSex=  $('input[name="createSex"]').filter(':checked').val();
    //     var inDate =$("#createInDate").val();
    //     var isWorker=$("#isWorker").val();
    //     alert(workerId+"-"+workerName+"--"+workerPhone+"--"+address+"--"+zhiwei+"--"+workerSex+"--"+inDate+"--"+isWorker)
    //     if(workerId!=null&&workerName!=null&&workerPhone!=null&&address!=null&&zhiwei!=null&&workerSex!=null&&inDate!=null) {
    //         $.ajax({
    //             contentType: "application/x-www-form-urlencoded;charset=utf-8",
    //             url: "/WorkerController/addWorker",
    //             data: {
    //                 "workerId": workerId,
    //                 "workerName": workerName,
    //                 "workerPhone": workerPhone,
    //                 "address": address,
    //                 "position": zhiwei,
    //                 "workerSex": workerSex,
    //                 "inDate": inDate,
    //                 "isWork": isWorker,
    //                 "status":"1"
    //             },
    //             async: true,
    //             type: "post",
    //             dataType: "text",
    //             success: function (data) {
    //                 if (data == "ok") {
    //                     alert("添加成功");
    //                     window.location.href = "workerinfo.jsp";
    //                 }
    //             },
    //             error: function (XMLHttpRequest, textStatus) {
    //                 alert(XMLHttpRequest.status);
    //                 alert(XMLHttpRequest.readyState);
    //                 alert(textStatus);
    //             }
    //         })
    //     }
    // }

    //删除
    $(".deleteWorker").click(function () {
        var index=$(".deleteWorker").index($(this));
        var workerId=$(".workerId").eq(index).text();
        alert(workerId);
        $.ajax({
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            url:"/WorkerController/deleteWorker",
            data:{"wb.workerId":workerId},
            async: true,
            type:"post",
            dataType:"text",
            success:function (data) {
                if(data=="ok"){
                    alert("删除成功");
                    window.location.href="/houtai/jsp/workerinfo.jsp";
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }
        })
    });


    //确认修改
    $("#updWorker").click(function () {
            var workerId = $("#workerId").val(); //id
            var workerName = $("#workerName").val(); //name
            var workerPhone = $("#workerPhone").val(); //phone
            var address = $("#address").val(); //address
            var zhiwei = $('option[name="dengji"]').filter(':selected').val();
            var workerSex = $('input[name="sex"]').filter(':checked').val();
            var isWork = $('option[name="status"]').filter(":selected").val();
        //  if (workerName != null && workerPhone != null && address != null && zhiwei != null && workerSex != null) {
               $.ajax({
                    contentType: "application/x-www-form-urlencoded;charset=utf-8",
                    url: "/WorkerController/updWorker",
                    data: {
                        "workerId": workerId,
                        "workerName": workerName,
                        "workerPhone": workerPhone,
                        "address": address,
                        "position": zhiwei,
                        "workerSex": workerSex,
                        "isWork": isWork},
                        async: true,
                        type: "post",
                        dataType: "text",
                        success: function (data) {
                            if (data == "ok") {
                                alert("修改成功");
                                window.location.href = "/houtai/jsp/workerinfo.jsp";
                            }
                        },
                        error: function (XMLHttpRequest, textStatus) {
                            alert(XMLHttpRequest.status);
                            alert(XMLHttpRequest.readyState);
                            alert(textStatus);
                        }

                })
            }
       // }
    );


    function bb() {
        $("#a").slideDown("slow",function () {
            setTimeout(aa,30)
        })
    }
    function aa() {
        $("#a").slideUp("fast");
    }
</script>
<script src="<%=basePath%>/houtai/js/commentmanage/workermanage.js"></script>

</html>
