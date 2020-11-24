<%--
  Created by IntelliJ IDEA.
  User: geyan
  Date: 2019/5/13
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="utf-8">
    <title>jQuery UI 对话框（Dialog） - 模态表单</title>
    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
    <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="jqueryui/style.css">

    <style>
        body { font-size: 62.5%; }
        label, input { display:block; }
        input.text { margin-bottom:12px; width:95%; padding: .4em; }
        fieldset { padding:0; border:0; margin-top:25px; }
        h1 { font-size: 1.2em; margin: .6em 0; }
        div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
        div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    </style>

    <script>
        $(function() {



            $( "#dialog-form" ).dialog({
                autoOpen: false,
                height: 300,
                width: 350,
                modal: true,
                buttons: {
                    "创建一个帐户": function() {
                        var bValid = true;

                        if ( bValid ) {
                            $( this ).dialog( "close" );
                        }
                    },
                    Cancel: function() {
                        $( this ).dialog( "close" );
                    }
                },
            });

            $( "#create-user" )
                .button()
                .click(function() {
                    $( "#dialog-form" ).dialog( "open" );
                });
        });
    </script>
</head>
<body>

<div id="dialog-form" title="创建新用户">
    <form>
        <fieldset>
            <label for="name">名字</label>
            <input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all">
            <label for="email">邮箱</label>
            <input type="text" name="email" id="email" value="" class="text ui-widget-content ui-corner-all">
            <label for="password">密码</label>
            <input type="password" name="password" id="password" value="" class="text ui-widget-content ui-corner-all">
        </fieldset>
    </form>
</div>

<button id="create-user">创建新用户</button>


</body>
</html>