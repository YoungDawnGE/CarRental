<%--
  Created by IntelliJ IDEA.
  User: geyan
  Date: 2019/5/14
  Time: 8:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

    <title>test3</title>
    <script type="text/javascript">
        $(document).ready(function(){
            $("input#btn").click(function(){
                alert("he;;");
                $.ajax({
                    async : false,
                    cache : false,
                    type : 'POST',
                    url : 'https://cloudapi.usr.cn/usrCloud/datadic/getLastData',
                    dataType : "json",
                    contentType : 'application/json; charset=utf-8', //第二步：定义格式

                    data:"{\n" +
                        "    \"devDataIds\":\n" +
                        "         [\n" +
                        "            {\"devId\":\"00008381000000000400\",\"slaveIndex\":3,\"dataId\":3889},\n" +
                        "            {\"devId\":\"00008381000000000400\",\"slaveIndex\":4,\"dataId\":3890}\n" +
                        "        ],\n" +
                        "    \"token\": \"UzI1NiJ9. IjoxNDk3NTk0NzE0fQ.HoJHi0RJHi0RJHi0R4fkstVhYVdv0\"\n" +
                        "}",
                    // data : JSON.stringify({
                    //     id:$("input#id").val(),
                    //     devDataIds:
                    // }), //第二步；把json转为String传递给后台
                    success : function(response) {
                        alert(response);
                    }
                    ,
                    error : function() {
                        alert("系统错误，请稍后重试");
                    }
                });
            });
        });
    </script>
</head>
<body>
<input type="button" id="btn" value="点击发送请求"/>

</body>
</html>
