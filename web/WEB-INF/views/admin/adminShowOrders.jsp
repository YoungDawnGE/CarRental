<%--
  Created by IntelliJ IDEA.
  User: geyan
  Date: 2019/5/16
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>订单</title>
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

                <li >
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
                <li class="active"><a href="#" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/admin/showAllOrders'">订单</a></li>

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
            <h2 style="text-align:center">订单记录</h2>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>
                        订单号
                    </th>
                    <th>
                        汽车ID
                    </th>
                    <th>
                        缩略图
                    </th>
                    <th>
                        总金额
                    </th>
                    <th>
                        订单时间
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${opbList}" var="opb">
                    <tr id="${opb.orderID}">
                        <th>
                                ${opb.orderID}
                        </th>
                        <th>
                                ${opb.cid}
                        </th>
                        <th>
                            <a target="_blank"  href="${pageContext.request.contextPath }/car/userCarDetail?id=${opb.cid}">
                                <img id="image" src="${pageContext.request.contextPath}/${opb.picPath}" alt="图片丢失啦(。>︿<)_θ" width="30px" height="30px">
                            </a>
                        </th>
                        <th>
                                ${opb.price}
                        </th>
                        <th>
                                ${opb.ordertime}
                        </th>
                        <th>
                            <button class="btn btn-primary" id="btn" name="btnCom${opb.orderID}">修改</button>
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
