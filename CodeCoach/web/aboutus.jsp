<%-- 
    Document   : About Us
    Created on : May 27, 2023, 8:22:44 PM
    Author     : hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>About Us</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body class="account-page">
        <!-- Header is placed here -->
        <%@include file="header.jsp" %>
        <!--End of header-->
        <div class="main-wrapper">
            <div class="content">
                <h1 style="font-weight: bold; text-align: center;">About Us</h1>
                <br>
                <br>
                <div class="account-box">              
                    <div class="login-right">
<!--                        <h1>About Us</h1>-->
                        <br>
                        <c:forEach items="${listAb}" var="o">

                            <c:if test="${o.type == 1}">
                                <h2>${o.id}. ${o.summary}</h2>
                                <br>
                                <ul>
                                    <li><h3>${o.content}</h3></li>
                                </ul>
                            </c:if>
                        </c:forEach>
                        <br>

                    </div>
                </div>
            </div>
            <!-- end of Pre footer -->
            <%@include file="footer.jsp" %>
            <!-- footer is place here -->

            <script src="assets/js/jquery-3.6.0.min.js"></script>

            <script src="assets/js/bootstrap.bundle.min.js"></script>

            <script src="assets/js/script.js"></script>
    </body>

</html>