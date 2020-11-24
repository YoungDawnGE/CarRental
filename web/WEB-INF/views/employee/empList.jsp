<%--
  Created by IntelliJ IDEA.
  User: geyan
  Date: 2019/5/6
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>员工列表</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript">
        $(document).ready(function(){

            $("button.btn").click(function () {
                var btnname=$(this).attr("name");
                var opt = btnname.substring(0, 6);
                var id = btnname.substring(6, btnname.length);
                if(opt=="btnUpd"){
                    <%--location.href='${pageContext.request.contextPath }/emp/update';--%>
                    window.open('${pageContext.request.contextPath }/emp/updateEmpForm?id='+id, '_blank')
                }else {
                    if(confirm("确认删除？")){
                        $.ajax({
                            async: false,
                            cache: false,
                            type: 'POST',
                            url: '${pageContext.request.contextPath }/emp/delEmp',
                            dataType : "json",
                            contentType : 'application/json; charset=utf-8', //第二步：定义格式
                            data : JSON.stringify({
                                    id: id
                                }
                            ), //第二步；把json转为String传递给后台
                            success : function(response) {
                                alert(response.message);
                                $("tr#"+id).hide();
                            }
                            ,
                            error : function() {
                                alert("系统错误，请稍后重试");
                            }
                        });
                    }else {
                        return false;
                    }
                }
            });
            //
            // $("th#").mouseover(function () {
            //     $("span#hidePassword").hide();
            // });
            // $("span#hidePassword").mouseover(function () {
            //     $("span#hidePassword").show();
            // });
        });

    </script>
</head>
<body>
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

                <li  class="active">
                    <a href="#" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/emp/showEmp'">员工</a>
                </li>

                <li>
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

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h2 style="text-align:center">员工信息</h2>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>
                        ID
                    </th>
                    <th>
                        姓名
                    </th>
                    <th>
                        性别
                    </th>
                    <th>
                        手机号
                    </th>
                    <th>
                        出生日期
                    </th>
                    <th>
                        年龄
                    </th>
                    <th>
                        密码
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${empList}" var="emp">
                    <tr id="${emp.id}" name="${emp.id}">
                        <th>
                                ${emp.id}
                        </th>
                        <th>
                                ${emp.name}
                        </th>
                        <th>
                            <c:if test="${emp.sex==true}">
                                男
                            </c:if>
                            <c:if test="${emp.sex==false}">
                                女
                            </c:if>
                        </th>
                        <th>
                                ${emp.phonenum}
                        </th>
                        <th>
                                ${emp.birthdate}
                        </th>
                        <th>
                                ${emp.age}
                        </th>
                        <th id="hidePwTh">
                                <span id="hidePwSpan">${emp.password}</span>
                        </th>

                        <th>
                            <button class="btn btn-primary" name="btnUpd${emp.id}">修改</button>
                            <button class="btn btn-primary" name="btnDel${emp.id}">删除</button>
                        </th>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </div>
</div>

</body>
</html>
