<%-- 
    Document   : feedback
    Created on : 15-Jun-2023, 10:44:56
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">


<head>
    <meta charset="utf-8">
    <title>CodeCoach</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>

    <div class="main-wrapper">

        <!-- Header is placed here -->
        <%@include file="header.jsp" %>
        <!--End of header-->


        <div class="breadcrumb-bar">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-md-12 col-12">
                        <nav aria-label="breadcrumb" class="page-breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Reviews</li>
                            </ol>
                        </nav>
                        <h2 class="breadcrumb-title">Reviews</h2>
                    </div>
                </div>
            </div>
        </div>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    
                    <!-- mentor sidebar start -->
                    <%@include file="mentorsidebar.jsp" %>
                    <!-- mentor sidebar end -->
                    
                    <div class="col-md-7 col-lg-8 col-xl-9">
                        <div class="doc-review review-listing">

                            <ul class="comments-list">
                                <c:forEach var="feedback" items="${feedbackList}">
                                    <li>
                                        <div class="comment">
                                            <img class="avatar rounded-circle" alt="User Image"
                                                src="assets/img/user/user.jpg">
                                            <div class="comment-body">
                                                <div class="meta-data">
                                                    <span class="comment-author">${feedback.reviewerName}</span>
                                                    <span class="comment-date">Reviewed ${feedback.reviewDateTime}</span>
                                                    <div class="review-count rating">
                                                        <c:choose>
                                                            <c:when test="${feedback.rating >= 1}">
                                                                <i class="fas fa-star filled"></i>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <i class="fas fa-star"></i>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:choose>
                                                            <c:when test="${feedback.rating >= 2}">
                                                                <i class="fas fa-star filled"></i>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <i class="fas fa-star"></i>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:choose>
                                                            <c:when test="${feedback.rating >= 3}">
                                                                <i class="fas fa-star filled"></i>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <i class="fas fa-star"></i>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:choose>
                                                            <c:when test="${feedback.rating >= 4}">
                                                                <i class="fas fa-star filled"></i>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <i class="fas fa-star"></i>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:choose>
                                                            <c:when test="${feedback.rating >= 5}">
                                                                <i class="fas fa-star filled"></i>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <i class="fas fa-star"></i>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                                
                                                <p class="comment-content">${feedback.reviewText}</p>
                                                
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- end of Pre footer -->
        <%@include file="footer.jsp" %>
        <!-- footer is place here -->
       

    </div>


    <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="assets/js/jquery-3.6.0.min.js"></script>

    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
    <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

    <script src="assets/js/script.js"></script>
</body>



</html>