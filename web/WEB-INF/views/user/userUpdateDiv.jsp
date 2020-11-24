<%--
  Created by IntelliJ IDEA.
  User: geyan
  Date: 2019/5/13
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <h1 class="col-sm-offset-4">用户信息详情</h1>
                <form class="form-horizontal" action="" method="post">
                    <div class="form-group">
                        <label class="col-sm-offset-2 col-sm-2 control-label">ID</label>
                        <div class="col-sm-3">
                            <input type="text" id="id" name="id" class="form-control" value="${user.id}" readonly>
                        </div>
                        <span id="s1"></span>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-offset-2 col-sm-2 control-label">密码</label>
                        <div class="col-sm-3">
                            <input type="password" id="password" name="password" class="form-control" value="${user.password}" readonly>
                        </div>
                        <span id="s2"></span>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-offset-2 col-sm-2 control-label">姓名</label>
                        <div class="col-sm-3">
                            <input type="text" id="name" name="name" class="form-control" value="${user.name}" readonly>
                        </div>
                        <span id="s4"></span>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-offset-2 col-sm-2 control-label">性别</label>
                        <div class="col-sm-3"  readonly>
                            <c:if test="${user.sex==true}">
                                <input type="radio" id="sex" name="sex" checked value="true" style="margin-left: 20px" disabled>  男
                                <input type="radio" id="sex" name="sex" value="false" style="margin-left: 40px" disabled>  女
                            </c:if>
                            <c:if test="${user.sex==false}">
                                <input type="radio" id="sex" name="sex" value="true" style="margin-left: 20px" disabled>  男
                                <input type="radio" id="sex" name="sex" checked value="false" style="margin-left: 40px" disabled>  女
                            </c:if>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-offset-2 col-sm-2 control-label">手机号</label>
                        <div class="col-sm-3">
                            <input type="text" id="phone" name="phone" class="form-control" value="${user.phone}" readonly>
                        </div>
                        <span id="s5"></span>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-offset-2 col-sm-2 control-label">地址</label>
                        <div class="col-sm-3">
                            <textarea rows="3" class="form-control" id="address" name="address" readonly>${user.address}</textarea>
                        </div>
                        <span id="s6"></span>
                    </div>

                    <div class="form-group" style="margin-left: 33%">
                        <div class="col-sm-2" >
                            <input type="button" id="modify" class="form-control" name="modify" value="修改">
                        </div>
                        <div class="col-sm-2" >
                            <input type="button" id="submit" class="form-control" name="submit" value="完成" disabled>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
