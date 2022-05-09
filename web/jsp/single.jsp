<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>新闻详细</title>
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
                <a href="#" class="navbar-brand">新闻网站</a>
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
                                <a href="${pageContext.request.contextPath}/jsp/collection.jsp"
                                   class="nav-link active ">收藏</a>
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
<div class="container">
    <div class="row">
        <!-- Latest Posts -->
        <main class="post blog-post col-lg-8">
            <div class="container">
                <div class="post-single">
                    <c:forEach items="${articles}" var="article">
                    <c:if test="${article.aid == param.aid}">
                        <div class="post-thumbnail"><img src="${article.imgSrc}"
                                                         alt="..." class="img-fluid">
                        </div>
                    <div class="post-details">
                        <div class="post-meta d-flex justify-content-between">
                            <div class="category"><a href="#">最专业的新闻</a><a href="#">TEAM</a></div>
                        </div>
                        <h1>${article.atitle}</h1>
                        <div class="post-footer d-flex align-items-center flex-column flex-sm-row">
                            <a href="#" class="author d-flex align-items-center flex-wrap">
                                <div class="title"><span>${article.author}</span></div>
                            </a>
                            <div class="d-flex align-items-center flex-wrap">
                                <div class="date"><i class="icon-clock"></i>${article.adate}</div>
                            </div>
                            <c:choose>
                                <c:when test="${fn:length(nowUser.collections) != 0}">
                                    <c:forEach items="${nowUser.collections}" var="collection">
                                        <c:choose>
                                            <c:when test="${collection.aid == param.aid}">
                                                <div class="d-flex align-items-center flex-wrap">
                                                    <div class="date">
                                                        <a href="${pageContext.request.contextPath}/user/deleteCollection.do?uid=${nowUser.uid}&aid=${article.aid}">取消收藏</a>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="d-flex align-items-center flex-wrap">
                                                    <div class="date">
                                                        <a href="${pageContext.request.contextPath}/user/addCollection.do?aid=${article.aid}">收藏该文章</a>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
<%--                                <c:otherwise>--%>
<%--                                    <div class="d-flex align-items-center flex-wrap">--%>
<%--                                        <div class="date">--%>
<%--                                            <a href="${pageContext.request.contextPath}/user/addCollection.do?aid=${article.aid}">收藏该文章</a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </c:otherwise>--%>

                            </c:choose>


                            <div class="d-flex align-items-center flex-wrap">
                                <div class="date">
                                    已有赞数：${article.astar}
                                </div>
                            </div>
                            
                            <c:choose>
                                <c:when test="${fn:length(stars) != 0}">
                                    <c:forEach items="${stars}" var="star">
                                        <c:choose>
                                            <c:when test="${star.uid == nowUser.uid}">
                                                <c:choose>
                                                    <c:when test="${star.aid == article.aid}">
                                                        <div class="d-flex align-items-center flex-wrap">
                                                            <div class="date">
                                                                <a href="${pageContext.request.contextPath}/article/subStar.do?uid=${nowUser.uid}&aid=${article.aid}">取消点赞</a>
                                                            </div>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="d-flex align-items-center flex-wrap">
                                                            <div class="date">
                                                                <a href="${pageContext.request.contextPath}/article/addStar.do?uid=${nowUser.uid}&aid=${article.aid}">点赞</a>
                                                            </div>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <div class="d-flex align-items-center flex-wrap">
                                        <div class="date">
                                            <a href="${pageContext.request.contextPath}/article/addStar.do?uid=${nowUser.uid}&aid=${article.aid}">点赞</a>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            


                        </div>
                        <div class="post-body">
                            <p>${article.content}</p>
                        </div>
                        <div class="post-comments">
                            <header>
                                <h3 class="h6">评论</h3>
                            </header>
                            <c:forEach items="${article.comments}" var="comment">
                                <div class="comment">
                                    <div class="comment-header d-flex justify-content-between">
                                        <div class="user d-flex align-items-center">
                                            <div class="image">
                                                <img src="${pageContext.request.contextPath}/img/user.svg" alt="..."
                                                     class="img-fluid rounded-circle">
                                            </div>
                                            <div class="title">
                                                <strong>${comment.cauthor}</strong>
                                                <span class="date">2019-11-18</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="comment-body">
                                        <p>${comment.content}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        </c:if>
                        </c:forEach>

                        <div class="add-comment">
                            <header>
                                <h3 class="h6">发表评论</h3>
                            </header>
                            <form class="commenting-form"
                                  action="${pageContext.request.contextPath}/article/addComment.do?aid=${param.aid}&author=${nowUser.unickname}"
                                  method="post">
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <textarea name="content" id="usercomment" placeholder="……"
                                                  class="form-control"></textarea>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <button type="submit" class="btn btn-secondary">发表评论</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <aside class="col-lg-4">
            <div class="widget latest-posts">
                <header>
                    <h3 class="h6">测试标题</h3>
                </header>
                <div class="blog-posts">
                    <a href="#">
                        <div class="item d-flex align-items-center">
                            <div class="image"><img src="${pageContext.request.contextPath}/img/small-thumbnail-1.jpg"
                                                    alt="..." class="img-fluid"></div>
                            <div class="title">
                                <strong>测试内容</strong>
                            </div>
                        </div>
                    </a>
                    <a href="#">
                        <div class="item d-flex align-items-center">
                            <div class="image"><img src="${pageContext.request.contextPath}/img/small-thumbnail-2.jpg"
                                                    alt="..." class="img-fluid"></div>
                            <div class="title">
                                <strong>测试内容</strong>
                            </div>
                        </div>
                    </a>
                    <a href="#">
                        <div class="item d-flex align-items-center">
                            <div class="image"><img src="${pageContext.request.contextPath}/img/small-thumbnail-3.jpg"
                                                    alt="..." class="img-fluid"></div>
                            <div class="title">
                                <strong>测试内容</strong>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </aside>
    </div>
</div>
</body>
</html>