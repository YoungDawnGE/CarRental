<%--
  Created by IntelliJ IDEA.
  User: geyan
  Date: 2019/5/11
  Time: 10:08
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
            $('#myTab li:eq(3) a').tab('show');
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function(){
            var msg="${message}";
            if (msg.length != 0) {
                alert(msg);
            }
            <%--$("input#btn").click(function () {--%>
            <%--    &lt;%&ndash;var params=$("form#addCarForm").serialize();&ndash;%&gt;--%>
            <%--    &lt;%&ndash;var j = {};&ndash;%&gt;--%>
            <%--    &lt;%&ndash;for (var item in params) {&ndash;%&gt;--%>
            <%--    &lt;%&ndash;    j[params[item].name] = params[item].value;&ndash;%&gt;--%>
            <%--    &lt;%&ndash;}&ndash;%&gt;--%>
            <%--    &lt;%&ndash;alert(j);&ndash;%&gt;--%>
            <%--    &lt;%&ndash;$.ajax({&ndash;%&gt;--%>
            <%--    &lt;%&ndash;    async: false,&ndash;%&gt;--%>
            <%--    &lt;%&ndash;    cache: false,&ndash;%&gt;--%>
            <%--    &lt;%&ndash;    type: 'POST',&ndash;%&gt;--%>
            <%--    &lt;%&ndash;    url: '${pageContext.request.contextPath }/car/addCar',&ndash;%&gt;--%>
            <%--    &lt;%&ndash;    dataType : "json",&ndash;%&gt;--%>
            <%--    &lt;%&ndash;    contentType : 'application/json; charset=utf-8', //第二步：定义格式&ndash;%&gt;--%>
            <%--    &lt;%&ndash;    data : JSON.stringify(&ndash;%&gt;--%>
            <%--    &lt;%&ndash;        j&ndash;%&gt;--%>
            <%--    &lt;%&ndash;    ), //第二步；把json转为String传递给后台&ndash;%&gt;--%>
            <%--    &lt;%&ndash;    processData: false,&ndash;%&gt;--%>
            <%--    &lt;%&ndash;    success : function(response) {&ndash;%&gt;--%>
            <%--    &lt;%&ndash;        alert(response.message);&ndash;%&gt;--%>
            <%--    &lt;%&ndash;    }&ndash;%&gt;--%>
            <%--    &lt;%&ndash;    ,&ndash;%&gt;--%>
            <%--    &lt;%&ndash;    error : function() {&ndash;%&gt;--%>
            <%--    &lt;%&ndash;        alert("系统错误，请稍后重试");&ndash;%&gt;--%>
            <%--    &lt;%&ndash;    }&ndash;%&gt;--%>
            <%--    &lt;%&ndash;});&ndash;%&gt;--%>
            <%--});--%>

            $("input#id").change(function(){
                if($("input#id").val().trim().length==0){
                    $("input#id").css("background-color","#cef3ff");
                    $("span#s1").html("*id不能为空").css("color","red");
                    $("span#s1").show();
                }else{
                    $.ajax({
                        async : false,
                        cache : false,
                        type : 'POST',
                        url : '${pageContext.request.contextPath }/car/checkID',
                        dataType : "json",
                        contentType : 'application/json; charset=utf-8', //第二步：定义格式
                        data : JSON.stringify({id:$("input#id").val()}), //第二步；把json转为String传递给后台
                        success : function(response) {
                            if (response.code == 1) {
                                $("span#s1").html(response.message).css("color","#4b79ff");
                                $("span#s1").show();
                            }else if (response.code == 0) {
                                $("span#s1").html(response.message).css("color","#ff382f");
                                $("span#s1").show();
                            }
                        }
                        ,
                        error : function() {
                            alert("系统错误，请稍后重试");
                        }
                    });
                }
            });

            $("input#name").blur(function(){
                if($("input#name").val().trim().length==0){
                    $("input#name").css("background-color","#cef3ff");
                    $("span#s2").html("*name不能为空").css("color","red");
                    $("span#s2").show();
                }else{
                    $("input#name").css("background-color","#ffffff");
                    $("span#s2").hide();
                }
            });

            $("input#carkind").blur(function(){
                if($("input#carkind").val().trim().length==0){
                    $("input#carkind").css("background-color","#cef3ff");
                    $("span#s3").html("*carkind不能为空").css("color","red");
                    $("span#s3").show();
                }else{
                    $("input#carkind").css("background-color","#ffffff");
                    $("span#s3").hide();
                }
            });

            $("input#type").blur(function(){
                if($("input#type").val().trim().length==0){
                    $("input#type").css("background-color","#cef3ff");
                    $("span#s4").html("*type不能为空").css("type","red");
                    $("span#s4").show();
                }else{
                    $("input#type").css("background-color","#ffffff");
                    $("span#s4").hide();
                }
            });

            $("input#color").blur(function(){
                if($("input#color").val().trim().length==0){
                    $("input#color").css("background-color","#cef3ff");
                    $("span#s5").html("*color不能为空").css("color","red");
                    $("span#s5").show();
                }else{
                    $("input#color").css("background-color","#ffffff");
                    $("span#s5").hide();
                }
            });

            $("input#seatNum").blur(function(){
                if($("input#seatNum").val().trim().length==0){
                    $("input#seatNum").css("background-color","#cef3ff");
                    $("span#s6").html("*seatNum不能为空").css("seatNum","red");
                    $("span#s6").show();
                }else{
                    $("input#seatNum").css("background-color","#ffffff");
                    $("span#s6").hide();
                }
            });

            $("input#img").mouseleave(function(){
                if($("input#img").val().trim().length==0){
                    $("input#img").css("background-color","#cef3ff");
                    $("span#s7").html("*img不能为空").css("img","red");
                    $("span#s7").show();
                }else{
                    $("input#img").css("background-color","#ffffff");
                    $("span#s7").hide();
                }
            });

            $("input#releasetime").blur(function(){
                if($("input#releasetime").val().trim().length==0){
                    $("input#releasetime").css("background-color","#cef3ff");
                    $("span#s8").html("*releasetime不能为空").css("releasetime","red");
                    $("span#s8").show();
                }else{
                    $("input#releasetime").css("background-color","#ffffff");
                    $("span#s8").hide();
                }
            });

            $("input#description").blur(function(){
                if($("input#description").val().trim().length==0){
                    $("input#description").css("background-color","#cef3ff");
                    $("span#s9").html("*description不能为空").css("description","red");
                    $("span#s9").show();
                }else{
                    $("input#description").css("background-color","#ffffff");
                    $("span#s9").hide();
                }
            });

            $("input#price").blur(function(){
                if($("input#price").val().trim().length==0){
                    $("input#price").css("background-color","#cef3ff");
                    $("span#s10").html("*price不能为空").css("price","red");
                    $("span#s10").show();
                }else{
                    $("input#price").css("background-color","#ffffff");
                    $("span#s10").hide();
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
                <li><a href="#" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/admin/showAllOrders'">订单</a></li>

                <li class="dropdown active">
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
            <h1 class="col-sm-offset-5">添加汽车</h1>
            <form id="addCarForm" action="${pageContext.request.contextPath }/car/addCar" class="form-horizontal" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label class="col-sm-offset-2 col-sm-2 control-label">ID</label>
                    <div class="col-sm-3">
                        <input type="text" id="id" name="id" class="form-control" placeholder="ID">
                    </div>
                    <span id="s1"></span>
                </div>

                <div class="form-group">
                    <label class="col-sm-offset-2 col-sm-2 control-label">车名</label>
                    <div class="col-sm-3">
                        <input type="text" id="name" name="name" class="form-control" placeholder="name">
                    </div>
                    <span id="s2"></span>
                </div>

                <div class="form-group">
                    <label class="col-sm-offset-2 col-sm-2 control-label">车型</label>
                    <div class="col-sm-3">
                        <input type="text" id="carkind" name="carkind" class="form-control" placeholder="carkind">
                    </div>
                    <span id="s3"></span>
                </div>

                <div class="form-group">
                    <label class="col-sm-offset-2 col-sm-2 control-label">类别</label>
                    <div class="col-sm-3">
                        <input type="text" id="type" name="type" class="form-control" placeholder="type">
                    </div>
                    <span id="s4"></span>
                </div>

                <div class="form-group">
                    <label class="col-sm-offset-2 col-sm-2 control-label">颜色</label>
                    <div class="col-sm-3">
                        <input type="text" id="color" name="color" class="form-control" placeholder="color">
                    </div>
                    <span id="s5"></span>
                </div>

                <div class="form-group">
                    <label class="col-sm-offset-2 col-sm-2 control-label">座位数</label>
                    <div class="col-sm-3">
                        <input type="text" id="seatNum" name="seatNum" class="form-control" placeholder="seatNum">
                    </div>
                    <span id="s6"></span>
                </div>

                <div class="form-group">
                    <label class="col-sm-offset-2 col-sm-2 control-label">图片</label>
                    <div class="col-sm-3">
                        <input type="text" id="img" name="img" class="form-control" placeholder="img" readonly>
                    </div>
                    <div class="col-sm-3">
                        <input type="button" name="imgCheck" id="imgCheck" value="选择图片.jpg/.png" onclick="$('#getImg').click();">
                    </div>
                    <span id="s7"></span>
                    <div class="col-sm-3">
                        <input type="file" id="getImg" name="getImg" accept=".jpg,.png" onchange="$('#img').val($('#getImg').val());" style="display: none">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-offset-2 col-sm-2 control-label">发布时间</label>
                    <div class="col-sm-3">
                        <input type="text" id="releasetime" name="releasetime" class="form-control" placeholder="releasetime">
                    </div>
                    <span id="s8"></span>
                </div>

                <div class="form-group">
                    <label class="col-sm-offset-2 col-sm-2 control-label">描述</label>
                    <div class="col-sm-3">
                        <input type="text" id="description" name="description" class="form-control" placeholder="description">
                    </div>
                    <span id="s9"></span>
                </div>

                <div class="form-group">
                    <label class="col-sm-offset-2 col-sm-2 control-label">日租价格</label>
                    <div class="col-sm-3">
                        <input type="text" id="price" name="price" class="form-control" placeholder="price">
                    </div>
                    <span id="s10"></span>
                </div>

                <div class="form-group" style="margin-left: 33%">
                    <div class="col-sm-2" >
                        <input type="reset" id="reset" class="form-control" onclick="$('span').hide();$('input').css('background-color','#ffffff');"value="重置" >
                    </div>
                    <div class="col-sm-2" >
                        <input type="submit" id="btn" class="form-control" name="btn" value="添加">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>