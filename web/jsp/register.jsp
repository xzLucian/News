<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>新闻-创建新用户</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/img/favicon.ico">
    <script src='${pageContext.request.contextPath}/js/jquery.min.js'></script>
    <script src="${pageContext.request.contextPath}/js/login.js"></script>
</head>
<body>
<hgroup>
    <h1>创建新用户</h1>
    <c:if test="${registerFlag == false}">
        <h3>该用户已存在啊！</h3>
    </c:if>
    <c:if test="${registerErInfo !=null}">
        <h3>${registerErInfo}</h3>
    </c:if>
</hgroup>
<form action="${pageContext.request.contextPath}/user/register.do" method="post">
    <div class="group">
        <input type="text" name="username"><span class="highlight"></span><span class="bar"></span>
        <label>用户名</label>
    </div>
    <div class="group">
        <input type="text" name="nickname"><span class="highlight"></span><span class="bar"></span>
        <label>用户名称</label>
    </div>
    <div class="group">
        <input type="password" name="password"><span class="highlight"></span><span class="bar"></span>
        <label>密码</label>
    </div>
    <button type="submit" class="button buttonBlue">创建
        <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
    </button>
</form>
</body>
</html>