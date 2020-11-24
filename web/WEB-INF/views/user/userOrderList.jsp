<%--
  Created by IntelliJ IDEA.
  User: geyan
  Date: 2019/5/13
  Time: 21:59
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zoomify.js"></script>
    <link href="${pageContext.request.contextPath}/css/zoomify.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
    <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

    <link rel="stylesheet" href="jqueryui/style.css">

    <title>OrderList</title>

    <style>
        img#image{
            cursor: pointer;
            transition: all 0.6s;
        }
        img#image:hover{
            transform: scale(10);
        }

        label, input { display:block; }
        input.text { margin-bottom:12px; width:95%; padding: .4em; }
        fieldset { padding:0; border:0; margin-top:25px; }
    </style>


    <script type="text/javascript">
        $(document).ready(function () {
            var btnname=$(this).attr("name");
            var opt = btnname.substring(0, 6);
            var id = btnname.substring(6, btnname.length);
            $( "#dialog-form" ).dialog({
                autoOpen: false,
                height: 450,
                width: 350,
                modal: true,
                buttons: {
                    "添加评论": function() {
                        $.ajax({
                            async : false,
                            cache : false,
                            type : 'POST',
                            url : '${pageContext.request.contextPath }/order/submitOrder',
                            dataType : "json",
                            contentType : 'application/json; charset=utf-8', //第二步：定义格式
                            data : JSON.stringify({

                            }), //第二步；把json转为String传递给后台
                            success : function(response) {
                                alert(response.message);
                            }
                            ,
                            error : function() {
                                alert("系统错误，请稍后重试");
                            }
                        });

                        $( this ).dialog( "close" );
                    },
                    "取消": function() {
                        $( this ).dialog( "close" );
                    }
                },
            });

            $("button#btn").click(function () {
                var btnname=$(this).attr("name");
                var opt = btnname.substring(0, 6);
                var id = btnname.substring(6, btnname.length);
                alert(opt + "\n" + id);
                // $( "#dialog-form" ).dialog( "open" );

            });

            $( "#newOrd"+${car.id} )
                .button()
                .click(function() {
                    $( "#dialog-form" ).dialog( "open" );
                    // $('#dialog-form2').css("s","mar")
                });
        });
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3>
                欢迎&nbsp;客户 ID:&nbsp;${user.id} &nbsp; &nbsp; <a href="${pageContext.request.contextPath }/user/logout">退出</a>
            </h3>
            <ul id="myTab" class="nav nav-tabs">
                <li>
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
                <li class="active"><a href="#" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/user/showOrder?id='+${user.id}">订单</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h2 style="text-align:center">历史订单</h2>
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
                            <button class="btn btn-primary" id="btn" name="btnCom${opb.orderID}">评论</button>
                        </th>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </div>
</div>
<div id="dialog-form" title="创建订单" hidden="true">
    <form id="dialog-form2">
        <fieldset>
            <div>
                <label  style="display: inline-block">添加评论</label>
                <textarea cols="20" rows="5"></textarea>
            </div>
        </fieldset>
    </form>
</div>

</body>
</html>
