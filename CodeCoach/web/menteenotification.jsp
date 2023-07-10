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
                
                <br>
                <br>
                <div class="account-box">              
                    <div class="login-right">
                        <div class="row">
                            <div class="col-md-12 col-lg-8 col-xl-12">
<!--                        <h1>About Us</h1>-->
                        <br>
                        <c:forEach items="${listN}" var="n"> 

                            <c:if test="${n.status == 'Pending'}">
                                <h3>Hello, you have ${n.content} at ${n.dateTime} . Please wait for a response from the mentor </h3> 
                                <div class="user-info-right">
                                                                 <div class="mentor-booking">
                                                                 <a class="apt-btn">Pending</a>
                                                                 </div>
                                                                 </div>
                                
                            </c:if>
                        </c:forEach>
                                
                                <br>
                                <br>
                                <c:forEach items="${listN}" var="n"> 

                            <c:if test="${n.status == 'Accepted'}">
                                <h3>Hello, your ${n.content} at ${n.dateTime} has been approved by mentor</h3>  
                                <div class="user-info-right">
                                                                 <div class="mentor-booking">
                                                                 <a class="apt-btn">Accepted</a>
                                                                 </div>
                                                                 </div>
                                
                            </c:if>
                        </c:forEach>
                                <br>
                                <br>
                                <c:forEach items="${listN}" var="n"> 

                            <c:if test="${n.status == 'Rejected'}">
                                <h3>Hello, your ${n.content} at ${n.dateTime} was rejected by mentor</h3>  
                                <div class="user-info-right">
                                                                 <div class="mentor-booking">
                                                                 <a class="apt-btn">Rejected</a>
                                                                 </div>
                                                                 </div>
                                
                            </c:if>
                        </c:forEach>
                       
                        <br>
                    </div>
                </div>
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