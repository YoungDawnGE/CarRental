<%--
  Created by IntelliJ IDEA.
  User: geyan
  Date: 2019/5/9
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">
        $(document).ready(function(){
            <%--$("input#btn").click(function () {--%>
            <%--    var id=$("input#id").val().trim();--%>
            <%--    var password=$("input#password").val().trim();--%>
            <%--    var checkPassword=$("input#checkPassword").val().trim();--%>


            <%--    alert(id+"\n"+--%>
            <%--        password+"\n"+--%>
            <%--        checkPassword+"\n"+--%>
            <%--        name+"\n");--%>

            <%--    if(password==checkPassword){--%>
            <%--        $.ajax({--%>
            <%--            async : false,--%>
            <%--            cache : false,--%>
            <%--            type : 'POST',--%>
            <%--            url : '${pageContext.request.contextPath }/user/addUser',--%>
            <%--            dataType : "json",--%>
            <%--            contentType : 'application/json; charset=utf-8', //第二步：定义格式--%>
            <%--            data : JSON.stringify({--%>
            <%--                    id: id,--%>
            <%--                    password: password--%>
            <%--                }--%>
            <%--            ), //第二步；把json转为String传递给后台--%>
            <%--            success : function(response) {--%>
            <%--                alert(response.message);--%>
            <%--            }--%>
            <%--            ,--%>
            <%--            error : function() {--%>
            <%--                alert("插入失败");--%>
            <%--            }--%>
            <%--        });--%>
            <%--    }--%>
            <%--});--%>

            $("input#id").blur(function () {
                if($("input#id").val().trim().length==0){
                    $("input#id").css("background-color","#c6b0ff");
                    $("span#s1").html("*id不能为空").css("color","red");
                    $("span#s1").show();
                }
            });

            $("input#id").change(function(){
                if($("input#id").val().trim().length!=0){
                    $.ajax({
                        async : false,
                        cache : false,
                        type : 'POST',
                        url : '${pageContext.request.contextPath }/user/checkID',
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
        });

    </script>


</head>
<body>

<div class="container" >
    <h2 class="col-sm-offset-5 form-signin-heading">Sign Up</h2>


    <form action="addUser" class="form-horizontal" method="post">
        <div class="form-group">
            <label class="col-sm-offset-2 col-sm-2 control-label">ID</label>
            <div class="col-sm-4">
                <input type="text" id="id" name="id" class="form-control" placeholder="ID" required autofocus>
                <span id="s1"></span>
            </div>
        </div>

        <div class="form-group">
            <label for="password" class="col-sm-offset-2 col-sm-2 control-label">密码</label>
            <div class="col-sm-4">
                <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
                <span id="s2"></span>
            </div>
        </div>

        <div class="form-group">
            <label for="checkPassword" class="col-sm-offset-2 col-sm-2 control-label">确认密码</label>
            <div class="col-sm-4">
                <input type="password" id="checkPassword" name="checkPassword" class="form-control" placeholder="checkPassword" required>
                <span id="s3"></span>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-5 ">
                <input type="reset" id="reset" value="重置" onclick="$('span').hide();$('input').css('background-color','#ffffff');">

                <input type="submit" id="btn" name="btn" value="注册">
            </div>
        </div>

</form>
</div>
</body>
</html>
