<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>update</title>
    <script src="../js/jquery-3.3.1.js"></script>
    <script src="../js/bootstrap/bootstrap.js"></script>
    <link rel="stylesheet" href="../css/bootstrap/bootstrap.css">
    <link href="../css/updworker/updworker.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid" style="font-family: 幼圆">
    <div class="row margin_1">
        <div class="col-lg-offset-3 col-md-offset-3 col-sm-offset-2  col-lg-6 col-md-6  col-sm-8 col-xs-12">
            <form action="" method="post" name="form1">
                <table class="table table-responsive table-bordered table-hover p1">
                    <tr>
                        <th colspan="2" style="text-align: center;font-weight:200">
                           修改员工信息
                        </th>
                    </tr>
                    <tr>
                        <td align="right">
                            员工编号
                        </td>
                        <td align="left">
                            <div class="row">
                                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                    <input class="form-control input_width" type="text" name="NO" size="20" maxlength="20">
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
                                    <input class="form-control input_width" type="text" name="name" size="20" maxlength="20">
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
                                    <input class="form-control input_width" type="text" name="telphone" size="20" maxlength="20">
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
                                    <input class="form-control input_width" type="text" name="address" size="40" maxlength="40">
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
                                <div class="col-lg-3 col-xs-5">
                                    <select class="form-control ">
                                        <option name="one">保洁员</option>
                                        <option name="two">经理</option>
                                        <option name="three">服务员</option>
                                        <option name="four">保安</option>
                                        <option name="five">前台</option>
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
                            <input name="sex" type="radio" id="radi" value="男" checked>
                            <label for="radio" style="font-weight: 100">
                                男
                            </label>
                            <input type="radio" name="sex" id="radio" value="女">
                            <label for="radio" style="font-weight: 100">
                                女
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2" align="center" style="text-align: center">
                            <input class="btn btn-success" name="submit1" type="submit" value="提交">
                            &nbsp;
                            <input class="btn btn-warning" name="submit2" type="reset" value="重置">
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
</body>
</html>
