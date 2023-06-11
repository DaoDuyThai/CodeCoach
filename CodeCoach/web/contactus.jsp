<%-- 
    Document   : contactus
    Created on : Jun 7, 2023, 10:36:11 PM
    Author     : NGHIA
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>o
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Contact Us</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <c:set var="contactUsList" value="${sessionScope.contactUsList}" />

        <div class="bg-pattern-style">
            <div class="content" style="font-size: 19px">

                <div class="account-box">
                    <div class="login-right">
                        <div class="login-header">
                            <a href="home" class="navbar-brand logo">
                                <img src="assets/img/logo.png" class="img-fluid" alt="Logo">
                            </a>
                            <p class="text-muted">Contact CodeCoach if you have any questions <br> or story which you want to share</p>
                            <!--                            <div class="col-md-12">
                                                            <div class="form-group">
                                                                <textarea name="message" class="form-control" id="message" cols="30" rows="7" placeholder="Tell CodeCoach your story..."></textarea>
                                                            </div>
                                                        </div>-->
                            <!--                            <div class="col-md-12">
                                                            <div class="form-group">
                                                                <input type="submit" value="Send Message" class="btn btn-primary">
                                                                <div class="submitting"></div>
                                                            </div>
                                                        </div>-->
                        </div>
                        
                        <div>
                            <div class="footer-address">
                                <span><i class="fas fa-map-marker-alt"></i></span>
                                <a style="color: blue;text-decoration: underline" href="https://goo.gl/maps/46NsiFijUrQ5kV1J6">FPT University Thach That, Hanoi, Vietnam</a>
                            </div>
                            <br>
                            <p>
                                <i class="fas fa-phone-alt"></i>
                                <a style="color: blue;text-decoration: underline" href="tel://079 6428 094"> +84 79 6428 094 <a>
                                        </p>

                                        <div class="footer-address">
                                            <span><i class="fas fa-envelope"></i></span>
                                            Email<br>
                                            <a style="color: blue;text-decoration: underline" href="mailto:codecoach.project@gmail.com">codecoach.project@gmail.com </a>
                                        </div>
                                        <br>
                                        <div class="footer-address">
                                            <span><i class="fa fa-globe"></i></span>Website<br>
                                            <a style="color: blue;text-decoration: underline" href="https://CodeCoach.com">CodeCoach.com </a>    
                                        </div>
                                        </div>

                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        </body> 
                                        </html>
