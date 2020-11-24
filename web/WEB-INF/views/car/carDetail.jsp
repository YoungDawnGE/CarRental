<%--
  Created by IntelliJ IDEA.
  User: geyan
  Date: 2019/5/11
  Time: 16:58
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

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zoomify.js"></script>
    <link href="${pageContext.request.contextPath}/css/zoomify.css" rel='stylesheet' type='text/css' />

    <title>汽车详情</title>
    <style>
        a#picStyle{
            display: inline-block;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 5px;
            transition: 0.3s;
        }

        a#picStyle:hover {
            box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
        }

        .photo{
            float:left;
        }

        .intro{
             float:right;
             width:46%;
         }

        p{
            margin:0px 13px 10px 20px
        }

    </style>

    <script type="text/javascript">
        $(document).ready(function(){

            $("img").zoomify();

            $("input:button").click(function () {
                var btnname=$(this).attr("id");
                var opt = btnname.substring(0, 6);
                var id = btnname.substring(6, btnname.length);
                if(opt=="delCar"){
                    if(confirm("确认删除？")){
                        $.ajax({
                            async: false,
                            cache: false,
                            type: 'POST',
                            url: '${pageContext.request.contextPath }/car/delCar',
                            dataType : "json",
                            contentType : 'application/json; charset=utf-8', //第二步：定义格式
                            data : JSON.stringify({
                                    id: id
                                }
                            ), //第二步；把json转为String传递给后台
                            success : function(response) {
                                alert(response.message+"\n即将关闭当前界面");
                                window.close();
                            }
                            ,
                            error : function() {
                                alert("系统错误，请稍后重试");
                            }
                        });
                    }
                }
                if(opt=="updCar"){
                    window.open('${pageContext.request.contextPath }/car/updateCarForm?id=' + id, '_blank');
                }
                if(opt=="newOrd"){
                    window.open('${pageContext.request.contextPath }/order/createOrderForm?id=' + id, '_blank');
                }
            });
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
                <li >
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

                <li class="active">
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
            <h1 class="col-sm-offset-5">汽车详情</h1>

            <h3>${car.name}, ${car.type}</h3>
<%--            <p>点击图片查看效果：</p>--%>
            <div class="carpic">
                <div class="photo"><a id="picStyle"><img src="${pageContext.request.contextPath}/${car.pic}" width="600" height="450" alt="图片丢失啦~{{{(>_<)}}}"></a></div>
                <div class="intro">
                    <p>ID: ${car.id}</p>
                    <p>车型: ${car.carkind}</p>
                    <p>颜色: ${car.color}</p>
                    <p>座位数: ${car.seatNum}</p>
                    <p>发布时间: ${car.releasetime}</p><br>
                    <p>日租价格: ${car.price}元</p><br>
                    <p>${car.description}</p>
                    <div class="form-group" style="margin-left:15%">
                        <div class="col-sm-3" >
                            <input type="button" id="delCar${car.id}" class="form-control" name="retreat" value="删除">
                        </div>
                        <div class="col-sm-3" >
                            <input type="button" id="updCar${car.id}" class="form-control" name="retreat" value="修改">
                        </div>
                        <div class="col-sm-3" >
                            <input type="button" id="newOrd${car.id}" class="form-control" name="btn" value="创建订单">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <hr style="background-color: #333333">
            <h3 class="col-sm-offset-5">  历史评价</h3>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>
                        用户ID
                    </th>
                    <th>
                        评论
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${orderList}" var="order">
                    <tr>
                        <th>
                                ${order.uid}
                        </th>
                        <th>
                                ${order.comment}
                        </th>
                    </tr>
                </c:forEach>
                </tbody>
            </table>        </div>
    </div>
</div>

</body>
</html>
