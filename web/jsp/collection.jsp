<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>收藏</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontastic.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/@fancyapps/fancybox/jquery.fancybox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.default.css" id="theme-stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/img/favicon.ico">
    <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/popper.js/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/jquery.cookie/jquery.cookie.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/@fancyapps/fancybox/jquery.fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/front.js"></script>

</head>
<body>
<header class="header">
    <nav class="navbar navbar-expand-lg">
        <div class="search-area">
            <div class="search-area-inner d-flex align-items-center justify-content-center">
                <div class="close-btn"><i class="icon-close"></i></div>
                <div class="row d-flex justify-content-center">
                    <div class="col-md-8">
                        <form action="${pageContext.request.contextPath}/search.do">
                            <div class="form-group">
                                <input type="search" name="findText" id="search" placeholder="需要搜索的新闻标题">
                                <button type="submit" class="submit"><i class="icon-search-1"></i></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="navbar-header d-flex align-items-center justify-content-between">
                <a href="#" class="navbar-brand">新闻网站 - 查询结果</a>
                <button type="button" data-toggle="collapse" data-target="#navbarcollapse"
                        aria-controls="navbarcollapse" aria-expanded="false" aria-label="Toggle navigation"
                        class="navbar-toggler"><span></span><span></span><span></span></button>
            </div>
            <div id="navbarcollapse" class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/jsp/index.jsp" class="nav-link active ">主页</a>
                    </li>
                    <c:choose>
                        <c:when test="${nowUser!=null}">
                            <li class="nav-item">
                                <c:choose>
                                    <c:when test="${nowUser.upower==0 || nowUser.upower==1}">
                                        <a href="${pageContext.request.contextPath}/jsp/back_index.jsp"
                                           class="nav-link ">${nowUser.unickname}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="#" class="nav-link ">${nowUser.unickname}</a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/jsp/collection.jsp" class="nav-link active ">收藏</a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/jsp/history.jsp" class="nav-link active ">浏览记录</a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/" class="nav-link active ">退出</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/jsp/login.jsp" class="nav-link ">登录</a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/jsp/register.jsp" class="nav-link ">注册</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <div class="navbar-text">
                    <a href="#" class="search-btn"><i class="icon-search-1"></i></a>
                </div>
            </div>
        </div>
    </nav>
</header>
<section class="featured-posts no-padding-top">
    <div class="container">
        <br/>
        <c:forEach items="${nowUser.collections}" var="collection">
            <c:forEach items="${articles}" var="article">
                <c:if test="${article.aid == collection.aid && article.astate == 1}">
                    <div class="row d-flex align-items-stretch">
                        <div class="text col-lg-7">
                            <div class="text-inner d-flex align-items-center">
                                <div class="content">
                                    <header class="post-header">
                                        <div class="category"><a href="#">最专业的新闻</a><a href="#">team</a></div>
                                        <a href="${pageContext.request.contextPath}/single.do?aid=${article.aid}">
                                            <h2 class="h4">${article.atitle}</h2>
                                        </a>
                                    </header>
                                    <p>${article.content}</p>
                                    <footer class="post-footer d-flex align-items-center">
                                        <a href="#" lass="author d-flex align-items-center flex-wrap">
                                            <div class="title"><span>${article.author}</span></div>
                                        </a>
                                        <div class="date"><i class="icon-clock"></i>${article.adate}</div>
                                    </footer>
                                </div>
                            </div>
                        </div>
                        <div class="image col-lg-5">
                            <img class="image" src="${pageContext.request.contextPath}/img/featured-pic-1.jpg"
                                 alt="...">
                        </div>
                    </div>
                    <br/>
                </c:if>
            </c:forEach>
        </c:forEach>
    </div>
</section>
</body>
</html>