<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>新闻-登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/img/favicon.ico">
    <script src='${pageContext.request.contextPath}/js/jquery.min.js'></script>
    <script src="${pageContext.request.contextPath}/js/login.js"></script>
</head>
<body>
<hgroup>
    <h1>新闻系统后台管理</h1>
    <c:if test="${userFlag == false}">
        <h3>用户名或密码不正确！</h3>
    </c:if>
</hgroup>
<form action="${pageContext.request.contextPath}/user/login.do" method="post">
    <div class="group">
        <input type="text" name="username"><span class="highlight"></span><span class="bar"></span>
        <label>用户名</label>
    </div>
    <div class="group">
        <input type="password" name="password"><span class="highlight"></span><span class="bar"></span>
        <label>密码</label>
    </div>
    <button type="submit" class="button buttonBlue">登录
        <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
    </button>
    <a class="login-link" href="${pageContext.request.contextPath}/jsp/register.jsp">如果没有账户，可以点此创建</a>
</form>
</body>
</html>
