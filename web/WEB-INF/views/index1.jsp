<%--
  Created by IntelliJ IDEA.
  User: geyan
  Date: 2019/4/7
  Time: 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <title>Beautiful Line Effects with Color Changes</title>

  <meta name="robots" content="noindex, nofollow">
  <link rel="canonical" href="http://cssdeck.com/labs/pa0yqlki">


  <style>

    * { margin: 0; padding: 0;
      -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; }
    html, body, iframe {
      width: 100%; height: 100%;
    }
    body { overflow: hidden; }
    iframe { border: 0 none; padding-top: 30px; }
    header {overflow: hidden;}
    header {
      height: 30px;
      max-height: 30px;
      width: 100%;
      position: absolute;

      background: -webkit-linear-gradient(#444444, #3E3E3E);
      background: -moz-linear-gradient(#444444, #3E3E3E);
      background: linear-gradient(#444444, #3E3E3E);
      border-bottom: 1px solid black;
      box-shadow: 0 1px 0 #676767;
    }

    /* Logo */
    .logo {
      width: 60px; float: left;
      box-shadow: 8px 20px 18px -2px rgba(0, 0, 0, 0.22);
    }

    .logo a {
      text-indent: -9999px; display: block;
      text-decoration: none;
      border: none; outline: none;
      background: url(https://dl.dropbox.com/u/26141789/logoTop.png) 50% 50% no-repeat;
      height: 30px; width: 60px;
    }

    /* Navigation */
    .top_nav, .extra {
      float: left;
      padding: 0;
      margin: 0;
      list-style: none;
    }

    .extra { float: right; margin-right: 1px; }

    .top_nav li, .extra li {
      float: left;
      position: relative;
    }

    .top_nav li a, .extra li a {
      height: 30px;
      display: block;
      text-align: center;
      font: 12px/30px "Open Sans", Arial, sans-serif;
      color: #DADEE2;
      text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.22);
      text-decoration: none;
      padding: 0 15px;
      overflow: hidden;
      position: relative;
    }
    .top_nav li a, .extra li a:hover {
      color: white;
    }

    header li.user_menu > a {
      padding: 5px 10px 0;
      background: #333;
    }

  </style>


</head>
<body>

<div id="login">

  <form action="user/signUp" method="get">

    <fieldset class="clearfix">

      <p><span class="fontawesome-user"></span><input type="text" value="${user.id}" onblur="if(this.value == '') this.value = 'Username'" onfocus="if(this.value == 'Username') this.value = ''" required=""></p> <!-- JS because of IE support; better: placeholder="Username" -->
      <p><span class="fontawesome-lock"></span><input type="password" value="${user.password}" onblur="if(this.value == '') this.value = 'Password'" onfocus="if(this.value == 'Password') this.value = ''" required=""></p> <!-- JS because of IE support; better: placeholder="Password" -->
      <p><input type="submit" value="Sign In"></p>

    </fieldset>

  </form>

  <p>Not a member? <a href="/user/signUp">Sign up now</a><span class="fontawesome-arrow-right"></span></p>

</div>

<header>
  <ul class="extra" style="float: right;">
    <li><a href="test" target="_blank">TEST</a></li>
    <li><a href="test2">TEST2</a></li>
  </ul>
</header>
<iframe src="http://s.cssdeck.com/labs/full/pa0yqlki//noframe#dontkillanim" sandbox="allow-scripts allow-same-origin"></iframe>

<script>
  window.__stop_animations = false;
</script>


</body>
</html>
