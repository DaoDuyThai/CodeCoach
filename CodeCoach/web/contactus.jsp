<%-- 
    Document   : contactus
    Created on : Jun 7, 2023, 10:36:11 PM
    Author     : NGHIA
--%>
<%@page import="model.ContactUs"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
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
        <div class="bg-pattern-style">
            <div class="content" style="font-size: 19px">

                <div class="account-box">
                    <div class="login-right">
                        <div class="login-header">
                            <a href="home" class="navbar-brand logo">
                                <img src="assets/img/logo.png" class="img-fluid" alt="Logo">
                            </a>
                            <p class="text-muted">Contact CodeCoach if you have any questions <br> or story which you want to share</p>
                            
                        </div>
                        <div class="footer-address">
                            <span><i class="fas fa-map-marker-alt"></i></span>
                            <a style="color: blue;text-decoration: underline" href="
                               <c:forEach items="${ctact}" var="c">
                                   <c:if test="${c.getId()==1}">
                                       ${c.getHref()}
                                   </c:if>
                               </c:forEach>
                               "> 
                                <c:forEach items="${ctact}" var="c">
                                    <c:if test="${c.getId()==1}">
                                        ${c.getInfor()}
                                    </c:if>
                                </c:forEach>
                            </a>
                        </div>
                        <br>
                        <p>
                            <i class="fas fa-phone-alt"></i>
                            <a style="color: blue;text-decoration: underline" href="
                               <c:forEach items="${ctact}" var="c">
                                   <c:if test="${c.getId()==2}">
                                       ${c.getHref()}
                                   </c:if>
                               </c:forEach>
                               "> 
                                <c:forEach items="${ctact}" var="c">
                                    <c:if test="${c.getId()==2}">
                                        ${c.getInfor()}
                                    </c:if>
                                </c:forEach> <a>
                                    </p>

                                    <div class="footer-address">
                                        <span><i class="fas fa-envelope"></i></span>
                                        Email<br>
                                        <a style="color: blue;text-decoration: underline" href="<c:forEach items="${ctact}" var="c">
                                               <c:if test="${c.getId()==3}">
                                                   ${c.getHref()}
                                               </c:if>
                                           </c:forEach>"><c:forEach items="${ctact}" var="c">
                                                <c:if test="${c.getId()==3}">
                                                    ${c.getInfor()}
                                                </c:if>
                                            </c:forEach> </a>
                                    </div>
                                    <br>
                                    <div class="footer-address">
                                        <span><i class="fa fa-globe"></i></span>Website<br>
                                        <a style="color: blue;text-decoration: underline" href="<c:forEach items="${ctact}" var="c">
                                               <c:if test="${c.getId()==3}">
                                                   ${c.getHref()}
                                               </c:if>
                                           </c:forEach>"><c:forEach items="${ctact}" var="c">
                                                <c:if test="${c.getId()==4}">
                                                    ${c.getInfor()}
                                                </c:if>
                                            </c:forEach> </a>    
                                    </div>
                                    </div>
                                    </div>
                                    </div>
                                    </div>
                                    </body>
                                    </html>
