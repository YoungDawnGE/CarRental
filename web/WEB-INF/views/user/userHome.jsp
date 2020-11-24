<%--
  Created by IntelliJ IDEA.
  User: geyan
  Date: 2019/5/9
  Time: 17:43
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
    <title>首页</title>

</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3>
                欢迎&nbsp;客户 ID:&nbsp;${user.id} &nbsp; &nbsp; <a href="${pageContext.request.contextPath }/user/logout">退出</a>
            </h3>
            <ul id="myTab" class="nav nav-tabs">
                <li class="active">
                    <a href="#" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/user/firstPage'">首页</a>
                </li>

                <li>
                    <a href="#" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/user/changeInfo?id='+${user.id}">个人</a>
                </li>

                <li class="dropdown">
                    <a href="#" id="myTabDrop1" class="dropdown-toggle"
                       data-toggle="dropdown">汽车<b class="caret"></b>
                    </a>

                    <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                        <li><a href="#" id="carKind0" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/userViewCar?type=全部'">
                            全部</a>
                        </li>
                        <li><a href="#carList" id="carKind1" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/userViewCar?type=微型轿车'">
                            微型轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind2" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/userViewCar?type=普通级轿车'">
                            普通级轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind3" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/userViewCar?type=中级轿车'">
                            中级轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind4" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/userViewCar?type=中高级轿车'">
                            中高级轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind5" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/userViewCar?type=高级轿车'">
                            高级轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind6" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/userViewCar?type=小型SUV'">
                            小型SUV</a>
                        </li>
                        <li><a href="#carList" id="carKind7" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/userViewCar?type=中型SUV'">
                            中型SUV</a>
                        </li>
                        <li><a href="#carList" id="carKind8" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/userViewCar?type=大型SUV'">
                            大型SUV</a>
                        </li>
                    </ul>
                </li>
                <li><a href="#" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/user/showOrder?id='+${user.id}">订单</a></li>
            </ul>
            <%--            <div id="myTabContent" class="tab-content">--%>
            <%--                <div class="tab-pane fade in active" id="home">--%>
            <%--&lt;%&ndash;                    <img src="${pageContext.request.contextPath}/img/cars/aodi.jpg" width="1000px" alt="图片好像丢失了">&ndash;%&gt;--%>
            <%--                </div>--%>
            <%--                <!--添加汽车-->--%>
            <%--                <div class="tab-pane fade" id="addEmp">--%>
            <%--                    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/employee/empForm.jsp" />--%>
            <%--                </div>--%>
            <%--                <!--添加员工-->--%>
            <%--                <div class="tab-pane fade" id="addCar">--%>
            <%--                    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/car/carForm.jsp" />--%>
            <%--                </div>--%>
            <%--                <div class="tab-pane fade" id="ejb">--%>
            <%--                    <p>Enterprise Java Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的 J2EE 上。--%>
            <%--                    </p>--%>
            <%--                </div>--%>
            <%--            </div>--%>

        </div>
    </div>
</div>


</body>
</html>