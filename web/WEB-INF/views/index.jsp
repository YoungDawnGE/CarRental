<%--
  Created by IntelliJ IDEA.
  User: xl
  Date: 2018/7/1
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>汽车租赁系统</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
      $("button#btn").click(function () {
        var role=$("input#role:checked").val();
        $('#form')[0].action = role+'/login';//动态设置action
      });
    });

  </script>
</head>
<body>
<div class="container" >
  <form class="form-horizontal" action="" id='form' method="post">
    <h2 class="col-sm-offset-5 form-signin-heading">Sign In</h2>

    <div class="form-group">
      <label class="col-sm-offset-2 col-sm-2 control-label">ID</label>
      <div class="col-sm-4">
        <input type="text" id="id" name="id" class="form-control" placeholder="ID" value="${user.id}" required autofocus>
      </div>
    </div>

    <div class="form-group">
      <label for="password" class="col-sm-offset-2 col-sm-2 control-label">密码</label>
      <div class="col-sm-4">
        <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
      </div>
    </div>

    <div class="radio col-sm-offset-5">
      <label>
        <input type="radio" name="role" id="role" value="admin" >管理员
      </label>
      <label>
        <input type="radio" name="role" id="role" value="emp" >业务员
      </label>
      <label>
        <input type="radio" name="role" id="role" value="user" checked >用户
      </label>
    </div>
    <br>
    <div class="form-group">
      <div class="col-sm-offset-5 ">
        <button class="btn btn-primary col-lg-3" id="btn" type="submit">登录</button>
      </div>
    </div>
  </form>
  <center><div>${message}</div></center>
</div> <!-- /container -->
</body>
</html>
