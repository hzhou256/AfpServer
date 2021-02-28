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
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

    <h3>Prediction results</h3>
    <table class="table">
        <thead>
        <tr>
            <c:forEach items="${headerList}" var="rna">
                <th>${rna}</th>
            </c:forEach>
        </tr>
        </thead>
    <tbody>
    <c:forEach items="${list}" var="row">
        <tr>
            <c:forEach items="${row}" var="label">
                <td>${label}</td>
            </c:forEach>
        </tr>
    </c:forEach>
    </tbody>
    </table>


</body>
</html>
