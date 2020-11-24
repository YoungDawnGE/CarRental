<%--
  Created by IntelliJ IDEA.
  User: geyan
  Date: 2019/5/13
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

    <title>userUpdate</title>
    <script type="text/javascript">
        $(document).ready(function () {
            $("input#modify").click(function () {
                $("input#password").removeAttr("readonly");
                $("input#name").removeAttr("readonly");
                $("input#phone").removeAttr("readonly");
                $("textarea#address").removeAttr("readonly");
                $("input:radio").removeAttr("disabled");
                $("input#submit").removeAttr("disabled");

            });

            $("input#submit").click(function () {
                $.ajax({
                    async : false,
                    cache : false,
                    type : 'POST',
                    url : '${pageContext.request.contextPath }/user/updateUser',
                    dataType : "json",
                    contentType : 'application/json; charset=utf-8', //第二步：定义格式
                    data : JSON.stringify({
                            id: $("input#id").val().trim(),
                            password: $("input#password").val().trim() ,
                            name: $("input#name").val().trim(),
                            sex: $("input#sex:checked").val(),
                            phone: $("input#phone").val().trim(),
                            address: $("textarea#address").val().trim()
                        }
                    ), //第二步；把json转为String传递给后台
                    success : function(response) {
                        alert(response.message);
                    }
                });

                $('input#password').attr("readonly", "readonly");
                $('input#name').attr("readonly", "readonly");
                $('input#phone').attr("readonly", "readonly");
                $('input#address').attr("readonly", "readonly");
                $('textarea#address').attr("readonly", "readonly");
                $('input:radio').attr("disabled", "disabled");
                $("input#submit").attr("disabled", "disabled");
            });

            $("input#password").blur(function(){
                if($("input#password").val().trim().length==0){
                    $("input#password").css("background-color","#cef3ff");
                    $("span#s2").html("*password不能为空").css("color","red");
                    $("span#s2").show();
                }else{
                    $("input#password").css("background-color","#ffffff");
                    $("span#s2").hide();

                    // $("input#password").css("display","block")

                }
            });

            $("input#name").blur(function(){
                if($("input#name").val().trim().length==0){
                    $("input#name").css("background-color","#cef3ff");
                    $("span#s4").html("*name不能为空").css("color","red");
                    $("span#s4").show();
                }else{
                    $("input#name").css("background-color","#ffffff");
                    $("span#s4").hide();
                }
            });

            $("input#phone").blur(function(){
                if($("input#phone").val().trim().length==0){
                    $("input#phone").css("background-color","#cef3ff");
                    $("span#s5").html("*phone不能为空").css("color","red");
                    $("span#s5").show();
                }else{
                    $("input#phone").css("background-color","#ffffff");
                    $("span#s5").hide();
                }
            });

            $("textarea#address").blur(function(){
                if($("textarea#address").val().trim().length==0){
                    $("textarea#address").css("background-color","#cef3ff");
                    $("span#s6").html("*address不能为空").css("color","red");
                    $("span#s6").show();
                }else{
                    $("textarea#address").css("background-color","#ffffff");
                    $("span#s6").hide();
                }
            });
        });
    </script>

</head>
<body>

<%--<c:if test="${not empty user.id}">--%>
<%--</c:if>--%>

<%--<c:if test="${not empty admin.id}">--%>
<%--</c:if>--%>

<%--<c:if test="${not empty emp.id}">--%>

<%--</c:if>--%>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3>
                欢迎&nbsp;管理员 ID:&nbsp;${admin.id} &nbsp; &nbsp; <a href="${pageContext.request.contextPath }/admin/logout">退出</a>
            </h3>
            <ul id="myTab" class="nav nav-tabs">
                <li>
                    <a href="#" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/admin/firstPage'">首页</a>
                </li>

                <li>
                    <a href="#" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/admin/adminDataView'">数据</a>
                </li>

                <li >
                    <a href="#" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/emp/showEmp'">员工</a>
                </li>

                <li class="active">
                    <a href="#" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/user/showUser'">用户</a>
                </li>

                <li>
                    <a href="#" id="myTabDrop1" class="dropdown-toggle"
                       data-toggle="dropdown">汽车<b class="caret"></b>
                    </a>

                    <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                        <li><a href="#" id="carKind0" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/showCar?type=全部'">
                            全部</a>
                        </li>
                        <li><a href="#carList" id="carKind1" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/showCar?type=微型轿车'">
                            微型轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind2" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/showCar?type=普通级轿车'">
                            普通级轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind3" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/showCar?type=中级轿车'">
                            中级轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind4" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/showCar?type=中高级轿车'">
                            中高级轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind5" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/showCar?type=高级轿车'">
                            高级轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind6" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/showCar?type=小型SUV'">
                            小型SUV</a>
                        </li>
                        <li><a href="#carList" id="carKind7" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/showCar?type=中型SUV'">
                            中型SUV</a>
                        </li>
                        <li><a href="#carList" id="carKind8" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/showCar?type=大型SUV'">
                            大型SUV</a>
                        </li>
                    </ul>
                </li>
                <li><a href="#" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/admin/showAllOrders'">订单</a></li>

                <li class="dropdown">
                    <a href="#" id="myTabDrop2" class="dropdown-toggle"
                       data-toggle="dropdown">添加<b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                        <li><a href="#" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/admin/empForm'">
                            添加员工</a>
                        </li>
                        <li><a href="#" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/admin/carForm'">
                            添加汽车</a>
                        </li>
                        <li><a href="#" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/admin/userForm'">
                            添加用户</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<%@ include file="userUpdateDiv.jsp"%>

<%--<div class="container">--%>
<%--    <div class="row clearfix">--%>
<%--        <div class="col-md-12 column">--%>
<%--            <h1 class="col-sm-offset-4">用户信息详情</h1>--%>
<%--            <form class="form-horizontal" action="" method="post">--%>
<%--                <div class="form-group">--%>
<%--                    <label class="col-sm-offset-2 col-sm-2 control-label">ID</label>--%>
<%--                    <div class="col-sm-3">--%>
<%--                        <input type="text" id="id" name="id" class="form-control" value="${user.id}" readonly>--%>
<%--                    </div>--%>
<%--                    <span id="s1"></span>--%>
<%--                </div>--%>

<%--                <div class="form-group">--%>
<%--                    <label class="col-sm-offset-2 col-sm-2 control-label">密码</label>--%>
<%--                    <div class="col-sm-3">--%>
<%--                        <input type="password" id="password" name="password" class="form-control" value="${user.password}" readonly>--%>
<%--                    </div>--%>
<%--                    <span id="s2"></span>--%>
<%--                </div>--%>

<%--                <div class="form-group">--%>
<%--                    <label class="col-sm-offset-2 col-sm-2 control-label">姓名</label>--%>
<%--                    <div class="col-sm-3">--%>
<%--                        <input type="text" id="name" name="name" class="form-control" value="${user.name}" readonly>--%>
<%--                    </div>--%>
<%--                    <span id="s4"></span>--%>
<%--                </div>--%>

<%--                <div class="form-group">--%>
<%--                    <label class="col-sm-offset-2 col-sm-2 control-label">性别</label>--%>
<%--                    <div class="col-sm-3"  readonly>--%>
<%--                        <c:if test="${user.sex==true}">--%>
<%--                            <input type="radio" id="sex" name="sex" checked value="true" style="margin-left: 20px" disabled>  男--%>
<%--                            <input type="radio" id="sex" name="sex" value="false" style="margin-left: 40px" disabled>  女--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${user.sex==false}">--%>
<%--                            <input type="radio" id="sex" name="sex" value="true" style="margin-left: 20px" disabled>  男--%>
<%--                            <input type="radio" id="sex" name="sex" checked value="false" style="margin-left: 40px" disabled>  女--%>
<%--                        </c:if>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="form-group">--%>
<%--                    <label class="col-sm-offset-2 col-sm-2 control-label">手机号</label>--%>
<%--                    <div class="col-sm-3">--%>
<%--                        <input type="text" id="phone" name="phone" class="form-control" value="${user.phone}" readonly>--%>
<%--                    </div>--%>
<%--                    <span id="s5"></span>--%>
<%--                </div>--%>

<%--                <div class="form-group">--%>
<%--                    <label class="col-sm-offset-2 col-sm-2 control-label">地址</label>--%>
<%--                    <div class="col-sm-3">--%>
<%--                        <textarea rows="3" class="form-control" id="address" name="address" readonly>${user.address}</textarea>--%>
<%--                    </div>--%>
<%--                    <span id="s6"></span>--%>
<%--                </div>--%>

<%--                <div class="form-group" style="margin-left: 33%">--%>
<%--                    <div class="col-sm-2" >--%>
<%--                        <input type="button" id="modify" class="form-control" name="modify" value="修改">--%>
<%--                    </div>--%>
<%--                    <div class="col-sm-2" >--%>
<%--                        <input type="button" id="submit" class="form-control" name="submit" value="完成" disabled>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

</body>
</html>