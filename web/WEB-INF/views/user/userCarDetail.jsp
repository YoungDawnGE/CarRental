<%--
  Created by IntelliJ IDEA.
  User: geyan
  Date: 2019/5/13
  Time: 15:28
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

    <title>汽车详情</title>
    <script type="text/javascript">

        $(document).ready(function(){
            $("input#num").val(1);
            $("input#days").val(1);
            var pircePerDay=${car.price};

            $("img").zoomify();
            $( "#dialog-form" ).dialog({
                autoOpen: false,
                height: 450,
                width: 350,
                modal: true,
                buttons: {
                    "支付": function() {
                        var bValid = true;
                        var num = $("input#num").val();
                        var days=$("input#days").val();
                        var price = pircePerDay * num * days;

                        $.ajax({
                            async : false,
                            cache : false,
                            type : 'POST',
                            url : '${pageContext.request.contextPath }/order/submitOrder',
                            dataType : "json",
                            contentType : 'application/json; charset=utf-8', //第二步：定义格式
                            data : JSON.stringify({
                                cid: ${car.id},
                                uid: ${user.id},
                                num: num,
                                price:price

                            }), //第二步；把json转为String传递给后台
                            success : function(response) {
                                alert(response.message);
                            }
                            ,
                            error : function() {
                                alert("系统错误，请稍后重试");
                            }
                        });

                        if ( bValid ) {
                            $( this ).dialog( "close" );
                        }
                    },
                    "取消": function() {
                        $( this ).dialog( "close" );
                    }
                },
            });

            $("input#num").change(function () {
                var days = $("input#days").val();
                var num = $(this).val();
                if(num<1){
                    $(this).val(1);
                }
                if(days>0&num>0){

                    var total=num*days*pircePerDay;
                    $("label#price").text(total);
                }
            });

            $("input#days").change(function () {
                var num = $("input#num").val();
                var days = $(this).val();
                if(days<1){
                    $(this).val(1);
                }
                if(days>0&num>0){
                    var total=num*days*pircePerDay;
                    $("label#price").text(total);
                }
            });



            $( "#newOrd"+${car.id} )
                .button()
                .click(function() {
                    $( "#dialog-form" ).dialog( "open" );
                    // $('#dialog-form2').css("s","mar")
                });
        });


    </script>
    <style >
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

        label, input { display:block; }
        input.text { margin-bottom:12px; width:95%; padding: .4em; }
        fieldset { padding:0; border:0; margin-top:25px; }


    </style >

</head>
<body>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3>
                欢迎&nbsp;客户 ID:&nbsp;${user.id} &nbsp; &nbsp; <a href="${pageContext.request.contextPath }/user/logout">退出</a>
            </h3>
            <ul id="myTab" class="nav nav-tabs">
                <li >
                    <a href="#" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/user/firstPage'">首页</a>
                </li>

                <li>
                    <a href="#" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/user/changeInfo?id='+${user.id}">个人</a>
                </li>

                <li class="dropdown active">
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
                            <input type="button" id="newOrd${car.id}" class="form-control" name="btn" value="创建订单">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--表单--%>
<div id="dialog-form" title="创建订单">
    <form id="dialog-form2">
        <fieldset>
            <div>
                <label  style="display: inline-block">汽车ID</label>
                <label style="display: inline-block">${car.id}</label>
            </div>

            <div>
                <label  style="display: inline-block">用户ID</label>
                <label  style="display: inline-block">${user.id}</label>
            </div>

            <label>租用天数</label>
            <input type="number" name="days" id="days" class="text ui-widget-content ui-corner-all">
            <label>数量</label>
            <input type="number" name="num" id="num" class="text ui-widget-content ui-corner-all">

            <div>
                <label id="priceLabel" style="display: inline-block">金额 ￥</label>
                <label id="price" style="display: inline-block"></label>
            </div>

        </fieldset>
    </form>
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
            </table>
        </div>
    </div>
</div>

</body>
</html>
