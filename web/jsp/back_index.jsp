<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html dir="ltr" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>新闻系统 - 后台管理</title>

    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/img/favicon.png">
    <link href="${pageContext.request.contextPath}/css/style-back.css" rel="stylesheet">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/img/favicon.ico">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/app-style-switcher.js"></script>
    <script src="${pageContext.request.contextPath}/js/waves.js"></script>
    <script src="${pageContext.request.contextPath}/js/sidebarmenu.js"></script>
    <script src="${pageContext.request.contextPath}/js/custom.js"></script>
</head>
<body>
<div class="preloader">
    <div class="lds-ripple">
        <div class="lds-pos"></div>
        <div class="lds-pos"></div>
    </div>
</div>
<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
     data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
    <header class="topbar" data-navbarbg="skin5">
        <nav class="navbar top-navbar navbar-expand-md navbar-dark">
            <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                <ul class="navbar-nav float-left mr-auto"></ul>
                <ul class="navbar-nav float-right">
                    <%--<li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href=""
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="${pageContext.request.contextPath}/img/users/1.jpg" alt="user"
                                 class="rounded-circle" width="31">
                        </a>
                        <div class="dropdown-menu dropdown-menu-right user-dd animated">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/jsp/index.jsp"><i
                                    class="fa fa-power-off m-r-5 m-l-5"></i>退出</a>
                        </div>
                    </li>--%>
                </ul>
            </div>
        </nav>
    </header>
    <aside class="left-sidebar" data-sidebarbg="skin6">
        <div class="scroll-sidebar">
            <nav class="sidebar-nav">
                <ul id="sidebarnav">
                    <li>
                        <div class="user-profile d-flex no-block dropdown m-t-20">
                            <div class="user-pic"><img src="${pageContext.request.contextPath}/img/users/1.jpg"
                                                       alt="users"
                                                       class="rounded-circle" width="40"/></div>
                            <div class="user-content hide-menu m-l-10">
                                <h5 class="m-b-0 user-name font-medium">${nowUser.unickname}</h5>
                                <span class="op-5 user-email">varun@gmail.com</span>
                            </div>
                        </div>
                    </li>
                    <c:choose>
                        <c:when test="${nowUser.upower == 0}">
                            <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                   href="${pageContext.request.contextPath}/jsp/back_users.jsp"
                                   aria-expanded="false">
                                    <i class="mdi mdi-view-dashboard"></i><span class="hide-menu">人员管理</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                   href="${pageContext.request.contextPath}/jsp/back_articles.jsp"
                                   aria-expanded="false">
                                    <i class="mdi mdi-view-dashboard"></i><span class="hide-menu">新闻审核</span>
                                </a>
                            </li>
                        </c:when>
                        <c:when test="${nowUser.upower == 1}">
                            <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                   href="${pageContext.request.contextPath}/jsp/back_articles.jsp"
                                   aria-expanded="false">
                                    <i class="mdi mdi-view-dashboard"></i><span class="hide-menu">新闻审核</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                   href="${pageContext.request.contextPath}/jsp/back_editor.jsp"
                                   aria-expanded="false">
                                    <i class="mdi mdi-view-dashboard"></i><span class="hide-menu">新闻发布</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                   href="${pageContext.request.contextPath}/jsp/back_type.jsp"
                                   aria-expanded="false">
                                    <i class="mdi mdi-view-dashboard"></i><span class="hide-menu">添加分类</span>
                                </a>
                            </li>
                        </c:when>
                    </c:choose>
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="${pageContext.request.contextPath}/jsp/index.jsp">
                            <i class="mdi mdi-view-dashboard"></i><span class="hide-menu">退出到首页</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </aside>
</div>
</div>
</body>
</html>
