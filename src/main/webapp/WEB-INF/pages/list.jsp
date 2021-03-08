<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/6
  Time: 0:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>service program - result page</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="../img/favicon.ico">
    <link href="../css/main.css" rel="stylesheet" type="text/css">
    <script src="../js/jquery-3.3.1.min.js"></script>
</head>

<body>
<!-- header box -->
<div id="header">
    <div id="header_box" class="box">
        <div id="slogan"></div>
        <ul id="nav_box">
            <li><a href="http://lbci.tju.edu.cn/Gallery.htm">Gallery</a></li>
            <li><a href="http://lbci.tju.edu.cn/Teaching.htm">Teaching</a></li>
            <li><a href="http://lbci.tju.edu.cn/Members.htm">Members</a></li>
            <li><a href="http://lbci.tju.edu.cn/Research_project.htm">Research project</a></li>
            <li><a href="http://lbci.tju.edu.cn/Published_papers.htm">Published papers</a></li>
            <li><a href="http://lbci.tju.edu.cn/Online_services.htm">Online services</a></li>
            <li><a href="http://lbci.tju.edu.cn/Research_direction.htm">Research direction</a></li>
            <li><a href="http://lbci.tju.edu.cn/">Home</a></li>
        </ul>
    </div>
</div>
<%--<div id="button_box" class="box">--%>
<%--    <a href="../index.jsp">Server</a>--%>
<%--</div>--%>

<div id="main_box" class="box" style="overflow: hidden">
    <div id="main_title">Service page</div>
    <h3>Prediction results</h3>
    <div style="text-align: center; margin: auto">
    <table class="table" style='width: 90%; margin: auto' >
        <thead>
        <tr>
            <th>index</th>
            <c:forEach items="${headerList}" var="rna">
                <th>${rna}</th>
            </c:forEach>
        </tr>
        </thead>
    <tbody>
    <c:forEach items="${list}" var="row" varStatus="i">
        <tr>
            <td>${i.index+1}</td>
            <c:forEach items="${row}" var="label">
                <td>${label}</td>
            </c:forEach>
        </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>
    <br/>
</div>

<!-- footer box -->
<div id="footer_box" class="box" style="overflow: hidden">
    Address：Building 55B, Peiyang Park Campus No.135, Yaguan Road, Tianjin Haihe Education Park, Tianjin, China &nbsp;|&nbsp; P.C.：300050<br />
    Copyright：School of Computer Science and Technology, TianJin University. All Rights Reserved.
</div>
<!-- footer box -->
</body>
</html>
