<%--
  Created by IntelliJ IDEA.
  User: geyan
  Date: 2019/5/11
  Time: 8:27
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

    <title>adminHome</title>


    <script type="text/javascript">
        $(function () {
            $('#myTab li:eq(0) a').tab('show');
        });
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3>
                欢迎ID:&nbsp;${admin.id}&nbsp管理员, &nbsp; <a href="${pageContext.request.contextPath }/admin/logout">退出</a>
            </h3>
            <ul id="myTab" class="nav nav-tabs">
                <li class="active">
                    <a href="#home" data-toggle="tab">首页</a>
                </li>
                <li class="dropdown">
                    <a href="#" id="myTabDrop1" class="dropdown-toggle"
                       data-toggle="dropdown">汽车<b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                        <li><a href="#carList" id="carKind1" tabindex="-1" data-toggle="tab">
                            微信轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind2" tabindex="-1" data-toggle="tab">
                            普通级轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind3" tabindex="-1" data-toggle="tab">
                            中级轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind4" tabindex="-1" data-toggle="tab">
                            中高级轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind5" tabindex="-1" data-toggle="tab">
                            高级轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind6" tabindex="-1" data-toggle="tab">
                            小型SUV</a>
                        </li>
                        <li><a href="#carList" id="carKind7" tabindex="-1" data-toggle="tab">
                            中型SUV</a>
                        </li>
                        <li><a href="#carList" id="carKind8" tabindex="-1" data-toggle="tab">
                            大型SUV</a>
                        </li>
                    </ul>
                </li>
                <li><a href="#test" data-toggle="tab">test</a></li>
                <li><a href="#cars" data-toggle="tab">订单</a></li>

                <li class="dropdown">
                    <a href="#" id="myTabDrop2" class="dropdown-toggle"
                       data-toggle="dropdown">添加<b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                        <li><a href="#addEmp" tabindex="-1" data-toggle="tab">
                            添加员工</a>
                        </li>
                        <li><a href="#addCar" tabindex="-1" data-toggle="tab">
                            添加汽车</a>
                        </li>
                    </ul>
                </li>
            </ul>
<%--            <div id="myTabContent" class="tab-content">--%>
<%--                <div class="tab-pane fade in active" id="home">--%>
<%--                    <img src="${pageContext.request.contextPath}/img/cars/aodi.jpg" width="1000px" alt="图片好像丢失了">--%>
<%--                </div>--%>
<%--                <!--添加汽车-->--%>
<%--                <div class="tab-pane fade" id="addEmp">--%>
<%--                    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/employee/empForm.jsp" flush="true"/>--%>
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