<%--
  Created by IntelliJ IDEA.
  User: geyan
  Date: 2019/4/23
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>

    <title>Title</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("input#id").blur(function(){
                if($("input#id").val().trim().length==0){
                    $("input#id").css("background-color","#c6b0ff");
                    $("span#s1").html("*id不能为空").css("color","red");
                    $("span#s1").show();
                }else{
                    $("input#id").css("background-color","#ffffff");
                    $("span#s1").hide();
                }
            });

            $("input#name").blur(function(){
                if($("input#name").val().trim().length==0){
                    $("input#name").css("background-color","#c6b0ff");
                    $("span#s2").html("*name不能为空").css("color","red");
                    $("span#s2").show();
                }else{
                    $("input#name").css("background-color","#ffffff");
                    $("span#s2").hide();
                }
            });

            $("input#carkind").blur(function(){
                if($("input#carkind").val().trim().length==0){
                    $("input#carkind").css("background-color","#c6b0ff");
                    $("span#s3").html("*carkind不能为空").css("color","red");
                    $("span#s3").show();
                }else{
                    $("input#carkind").css("background-color","#ffffff");
                    $("span#s3").hide();
                }
            });

            $("input#type").blur(function(){
                if($("input#type").val().trim().length==0){
                    $("input#type").css("background-color","#c6b0ff");
                    $("span#s4").html("*type不能为空").css("type","red");
                    $("span#s4").show();
                }else{
                    $("input#type").css("background-color","#ffffff");
                    $("span#s4").hide();
                }
            });

            $("input#color").blur(function(){
                if($("input#color").val().trim().length==0){
                    $("input#color").css("background-color","#c6b0ff");
                    $("span#s5").html("*color不能为空").css("color","red");
                    $("span#s5").show();
                }else{
                    $("input#color").css("background-color","#ffffff");
                    $("span#s5").hide();
                }
            });

            $("input#seatNum").blur(function(){
                if($("input#seatNum").val().trim().length==0){
                    $("input#seatNum").css("background-color","#c6b0ff");
                    $("span#s6").html("*seatNum不能为空").css("seatNum","red");
                    $("span#s6").show();
                }else{
                    $("input#seatNum").css("background-color","#ffffff");
                    $("span#s6").hide();
                }
            });

            $("input#img").mouseleave(function(){
                if($("input#img").val().trim().length==0){
                    $("input#img").css("background-color","#c6b0ff");
                    $("span#s7").html("*img不能为空").css("img","red");
                    $("span#s7").show();
                }else{
                    $("input#img").css("background-color","#ffffff");
                    $("span#s7").hide();
                }
            });
            
            $("input#releasetime").blur(function(){
                if($("input#releasetime").val().trim().length==0){
                    $("input#releasetime").css("background-color","#c6b0ff");
                    $("span#s8").html("*releasetime不能为空").css("releasetime","red");
                    $("span#s8").show();
                }else{
                    $("input#releasetime").css("background-color","#ffffff");
                    $("span#s8").hide();
                }
            });

            $("input#description").blur(function(){
                if($("input#description").val().trim().length==0){
                    $("input#description").css("background-color","#c6b0ff");
                    $("span#s9").html("*description不能为空").css("description","red");
                    $("span#s9").show();
                }else{
                    $("input#description").css("background-color","#ffffff");
                    $("span#s9").hide();
                }
            });

            $("input#price").blur(function(){
                if($("input#price").val().trim().length==0){
                    $("input#price").css("background-color","#c6b0ff");
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
            <h1 class="col-sm-offset-5">添加员工</h1>
            <form class="form-horizontal" action="admin/addCar" method="post" enctype="multipart/form-data">
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
                    <div class="col-sm-3">
                        <input type="file" id="getImg" name="getImg" accept=".jpg,.png" onchange="$('#img').val($('#getImg').val());" style="display: none">
                    </div>

                    <span id="s7"></span>
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

                <div class="form-group">
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
