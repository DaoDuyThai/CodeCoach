
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">



<head>
    <meta charset="utf-8">
    <title>CodeCoach</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

    <link href="assets/img/favicon.png" rel="icon">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>

    <div class="main-wrapper">

        <%@ include file="header.jsp"%>


        <div class="breadcrumb-bar">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-md-8 col-12">
                                                <h2 class="breadcrumb-title">Favourites</h2>
                    </div>
                    
                </div>
            </div>
        </div>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <%@include file="menteesidebar.jsp" %>
                    <div class="col-md-7 col-lg-8 col-xl-9">
                        <div class="row row-grid">
                            <c:forEach var="mInfo" items="${mentorList}">
                            <div class="col-md-6 col-lg-4 col-xl-3">
                                <div class="profile-widget">
                                    <div class="user-avatar">
                                        <a href="viewmentorprofile?mentorId=${mInfo[0]}">
                                            <img class="img-fluid" alt="User Image" src="assets/images/users/${mInfo[1]}.png">
                                        </a>
                                        <a href="javascript:void(0)" class="fav-btn">
                                            <i class="far fa-bookmark"></i>
                                        </a>
                                    </div>
                                    <div class="pro-content">
                                        <h3 class="title">
                                            <a href="viewmentorprofile?mentorId=${mInfo[0]}">${mInfo[6]} ${mInfo[7]}</a>
                                            <i class="fas fa-check-circle verified"></i>
                                        </h3>
                                        
                                        <ul class="available-info">
                                            <li>
                                                <i class="fas fa-map-marker-alt"></i>${mInfo[15]},
                                                    ${mInfo[16]}
                                            </li>
                                            
                                            <li>
                                                <i class="far fa-money-bill-alt"></i> <fmt:formatNumber value="${mInfo[3]}" pattern="¤#,##0" currencyCode="VND" /> <i
                                                    class="fas fa-info-circle" data-toggle="tooltip"
                                                    title="Lorem Ipsum"></i>
                                            </li>
                                        </ul>
                                        <div class="row row-sm">
                                            <div class="col-6">
                                                <a href="viewmentorprofile?mentorId=${mInfo[0]}" class="btn view-btn">View Profile</a>
                                            </div>
                                            <div class="col-6">
                                                <a href="book?mentor-id=${mInfo[0]}" class="btn book-btn">Book Now</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            
                            

                            
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>


        <%@include file="footer.jsp" %>

    </div>


    <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="assets/js/jquery-3.6.0.min.js"></script>

    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
    <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

    <script src="assets/js/script.js"></script>
</body>



</html>




