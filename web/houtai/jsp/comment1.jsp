<%--
  Created by IntelliJ IDEA.
  Date: 2018/6/17
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>comment</title>
    <script src="../js/jquery-3.3.1.js"></script>
    <script src="../js/bootstrap/bootstrap.js"></script>
    <link rel="stylesheet" href="../css/bootstrap/bootstrap.css">

</head>
<body>
<div class="container-fluid" style="margin-top: 2vw">
    <div class="row">
        <div class="col-lg-offset-5 col-md-offset-5 col-sm-offset-2 col-xs-offset-2 col-lg-6 col-md-6 col-sm-8 col-xs-8 ">
            <form class="form-inline" role="form">
                <div class="form-group ">
                    <label class="sr-only" for="strValue">关键字</label>
                    <input type="text" class="form-control " id="strValue" value="${sessionScope}"  placeholder="搜索编号或姓名">
                </div>
                <a onclick="searches()" class="btn btn-success">搜索</a>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">
            <table class="table table-responsive table-bordered" style="font-family: 微软雅黑;text-align:center;font-size: 1.3rem;">
                <tr >
                    <th class="text-center">
                        评价ID
                    </th>
                    <th class="text-center">
                        客户ID
                    </th>
                    <th class="text-center">
                        订单号
                    </th>
                    <th class="text-center">
                        评价类型
                    </th>
                    <th class="text-center">
                        满意度(5)
                    </th>
                    <th class="text-center">
                        评价内容
                    </th>
                    <th class="text-center">
                        评价时间
                    </th>

                    <th class="text-center">
                        操作
                    </th>
                </tr>
                <c:forEach items="${sessionScope.list}" var="list">
                    <tr>
                        <td class="reviewId"><c:out value="${list.reviewId}"/></td>
                        <td><c:out value="${list.cusId}"/></td>
                        <td><c:out value="${list.bookId}"/></td>
                        <td><c:out value="${list.reviewType}"/></td>
                        <td><c:out value="${list.reviewScore}"/></td>
                        <td class="reviewContent"><c:out value="${list.content}"/></td>
                        <td><c:out value="${list.reviewDate}"/></td>
                        <td>
                            <a  class="btn btn-primary xiugai" data-toggle="modal" data-target="#updContentModal">修改</a>
                            <a  class="btn btn-warning deleteComment"  >删除</a>
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

<%--修改评论弹窗--%>
<div class="modal fade" style="font-family: 幼圆;" id="updContentModal" tabindex="-1" role="dialog" aria-labelledby="publicModal"  aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 style="text-align: center">修改评论</h4>
            </div>
            <div class="modal-body">
                <input type="text" id="crereviewId"  hidden> <%--评论id--%>
                <div class="form-group">
                    <textarea  id="contents" class="form-control " rows="4"></textarea>
                </div>
                <div class="form-group text-center">
                    <a  id="updContent"  class="btn btn-success">确认修改</a>
                </div>
            </div>
        </div>
    </div>
</div>  <%--弹窗结束--%>
<script>
    //确认修改
    $("#updContent").click(function () {
        var content=$("#contents").val();
        var reviewId=$("#crereviewId").val();
        /*    alert(content);*/
        $.ajax({
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            url:"updComment.action",
            data:{"pb.reviewId":reviewId,
                "pb.content":content},
            async: true,
            type:"post",
            dataType:"text",
            success:function (data) {
                if(data=="ok"){
                    alert("修改成功");
                    window.location.href="comment.jsp";
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }
        })
    });

    //删除
    $(".deleteComment").click(function () {
        var index=$(".deleteComment").index($(this));
        var reviewId=$(".reviewId").eq(index).text();
        alert(reviewId);
        $.ajax({
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            url:"deleteComment.action",
            data:{"pb.reviewId":reviewId},
            async: true,
            type:"post",
            dataType:"text",
            success:function (data) {
                if(data=="ok"){
                    alert("删除成功");
                    window.location.href="comment.jsp";
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
</body>
<script src="../../houtai/js/commentmanage/commentmanage.js"></script>
</html>
