<%--
  Created by IntelliJ IDEA.
  User: geyan
  Date: 2019/5/11
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加员工</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">



    <script type="text/javascript">
        $(function () {
            $('#myTab li:eq(5) a').tab('show');
        });
    </script>

    <script type="text/javascript">

        $(document).ready(function(){
            $("input#btn").click(function () {
                var id=$("input#id").val().trim();
                var password=$("input#password").val().trim();
                var checkPassword=$("input#checkPassword").val().trim();
                var name=$("input#name").val().trim();
                var sex=$("input#sex:checked").val();
                var phonenum=$("input#phonenum").val().trim();
                var birthdate=$("input#birthdate").val().trim();

                alert(id+"\n"+
                    password+"\n"+
                    checkPassword+"\n"+
                    name+"\n"+
                    sex+"\n"+
                    phonenum+"\n"+
                    birthdate+"\n");

                if(password==checkPassword){
                    $.ajax({
                        async : false,
                        cache : false,
                        type : 'POST',
                        url : '${pageContext.request.contextPath }/emp/addEmployee',
                        dataType : "json",
                        contentType : 'application/json; charset=utf-8', //第二步：定义格式
                        data : JSON.stringify({
                                id: id,
                                password: $("input#password").val().trim(),
                                name: $("input#name").val().trim(),
                                sex: $("input#sex:checked").val(),
                                phonenum: $("input#phonenum").val().trim(),
                                birthdate: $("input#birthdate").val().trim()
                            }
                        ), //第二步；把json转为String传递给后台
                        success : function(response) {
                            alert(response.message);
                        }
                        ,
                        error : function() {
                            alert("插入失败");
                        }
                    });
                }
            });

            $("input#id").change(function(){
                if($("input#id").val().trim().length==0){
                    $("input#id").css("background-color","#c6b0ff");
                    $("span#s1").html("*id不能为空").css("color","red");
                    $("span#s1").show();
                }else{
                    $.ajax({
                        async : false,
                        cache : false,
                        type : 'POST',
                        url : '${pageContext.request.contextPath }/emp/checkID',
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



            $("input#password").blur(function(){
                if($("input#password").val().trim().length==0){
                    $("input#password").css("background-color","#c6b0ff");
                    $("span#s2").html("*password不能为空").css("color","red");
                    $("span#s2").show();
                }else{
                    $("input#password").css("background-color","#ffffff");
                    $("span#s2").hide();
                }
            });

            $("input#checkPassword").blur(function(){
                if($("input#checkPassword").val().trim().length==0) {
                    $("input#checkPassword").css("background-color", "#c6b0ff");
                    $("span#s3").html("*checkPassword不能为空").css("color", "red");
                    $("span#s3").show();
                }
                else if($("input#checkPassword").val().trim()!=$("input#password").val().trim()){
                    $("input#checkPassword").css("background-color","#c6b0ff");
                    $("span#s3").html("*密码输入不一致").css("color","red");
                    $("span#s3").show();
                }else{
                    $("input#checkPassword").css("background-color","#ffffff");
                    $("span#s3").hide();
                }
            });

            $("input#name").blur(function(){
                if($("input#name").val().trim().length==0){
                    $("input#name").css("background-color","#c6b0ff");
                    $("span#s4").html("*name不能为空").css("color","red");
                    $("span#s4").show();
                }else{
                    $("input#name").css("background-color","#ffffff");
                    $("span#s4").hide();
                }
            });

            $("input#phonenum").blur(function(){
                if($("input#phonenum").val().trim().length==0){
                    $("input#phonenum").css("background-color","#c6b0ff");
                    $("span#s5").html("*phonenum不能为空").css("color","red");
                    $("span#s5").show();
                }else{
                    $("input#phonenum").css("background-color","#ffffff");
                    $("span#s5").hide();
                }
            });

            $("input#birthdate").blur(function(){
                if($("input#birthdate").val().trim().length==0){
                    $("input#birthdate").css("background-color","#c6b0ff");
                    $("span#s6").html("*birthdate不能为空").css("color","red");
                    $("span#s6").show();
                }else{
                    $("input#birthdate").css("background-color","#ffffff");
                    $("span#s6").hide();
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

                <li>
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
            <h1 class="col-sm-offset-5">添加员工</h1>
            <form class="form-horizontal" action="" method="post">

                <div class="form-group">
                    <label class="col-sm-offset-2 col-sm-2 control-label">ID</label>
                    <div class="col-sm-3">
                        <input type="text" id="id" name="id" class="form-control" placeholder="ID">
                    </div>
                    <span id="s1"></span>
                </div>

                <div class="form-group">
                    <label class="col-sm-offset-2 col-sm-2 control-label">密码</label>
                    <div class="col-sm-3">
                        <input type="password" id="password" name="password" class="form-control" placeholder="password">
                    </div>
                    <span id="s2"></span>
                </div>

                <div class="form-group">
                    <label class="col-sm-offset-2 col-sm-2 control-label">确认密码</label>
                    <div class="col-sm-3">
                        <input type="password" id="checkPassword" name="checkPassword" class="form-control" placeholder="checkPassword">
                    </div>
                    <span id="s3"></span>
                </div>

                <div class="form-group">
                    <label class="col-sm-offset-2 col-sm-2 control-label">姓名</label>
                    <div class="col-sm-3">
                        <input type="text" id="name" name="name" class="form-control" placeholder="name">
                    </div>
                    <span id="s4"></span>
                </div>

                <div class="form-group">
                    <label class="col-sm-offset-2 col-sm-2 control-label">性别</label>
                    <div class="col-sm-3">
                        <input type="radio" id="sex" name="sex" checked value="true" style="margin-left: 20px">  男
                        <input type="radio" id="sex" name="sex" value="false" style="margin-left: 40px">  女
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-offset-2 col-sm-2 control-label">手机号</label>
                    <div class="col-sm-3">
                        <input type="text" id="phonenum" name="phonenum" class="form-control" placeholder="phonenum">
                    </div>
                    <span id="s5"></span>
                </div>

                <div class="form-group">
                    <label class="col-sm-offset-2 col-sm-2 control-label">出生年月</label>
                    <div class="col-sm-3">
                        <input type="text" id="birthdate" name="birthdate" class="form-control" placeholder="birthdate">
                    </div>
                    <span id="s6"></span>
                </div>

                <div class="form-group" style="margin-left: 33%">
                    <div class="col-sm-2" >
                        <input type="reset" id="reset" class="form-control" onclick="$('span').hide();$('input').css('background-color','#ffffff');"value="重置" >
                    </div>
                    <div class="col-sm-2" >
                        <input type="button" id="btn" class="form-control" name="btn" value="添加">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>