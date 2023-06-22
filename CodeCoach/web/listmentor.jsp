<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Privacy Policy & Terms</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <script src="assets/js/jquery-3.6.0.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/script.js"></script>
    </head>
    <body class="account-page">
        <!-- Header is placed here -->
        <%@include file="header.jsp" %>
        <!-- End of header -->

        <div class="main-wrapper">
            <div class="content">
                <h2 style="font-weight: bold; text-align: center;">List Mentor</h2>
                <div class="account-box">              
                    <div class="login-right">
                        <div class="content">
                            <div class="container-fluid">
                                <div class="row">
<!--                                    <div class="col-md-12 col-lg-4 col-xl-3 theiaStickySidebar">
                                        <div class="card search-filter">
                                            <div class="card-header">
                                                <h4 class="card-title mb-0">Search Filter</h4>
                                            </div>
                                            <div class="card-body">
                                                <form action="searchmentor" >
                                                <div class="filter-widget">
                                                    <h4>Select Courses</h4>
                                                    <c:forEach items="${listS}" var="s">
                                                        <div>
                                                            <label class="custom_check">
                                                                <input type="checkbox" name="select_specialist" value="${s.skillId}">
                                                                <span class="checkmark"></span> ${s.skillName}
                                                            </label>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                                                                    </form>

                                            </div>
                                        </div>
                                    </div>-->
                                    <div class="col-md-12 col-lg-8 col-xl-9">
                                        <c:forEach items="${listM}" var="m">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="mentor-widget">
                                                        <div class="user-info-left">
                                                            <div class="mentor-img">
                                                                <a href="profile.html">
                                                                    <img src="assets/images/users/${m[0]}.png" class="img-fluid" alt="User Image">
                                                                </a>
                                                            </div>
                                                            <div class="user-info-cont">
                                                                <h4 class="usr-name"><a href="profile.html">${m[6]} ${m[7]}</a></h4>
                                                                <p class="mentor-type">${m[2]}</p>
                                                                <div class="mentor-details">
                                                                    <p class="user-location">
                                                                        <i class="fas fa-map-marker-alt"></i> ${m[12]}  
                                                                        <br> ${m[16]} 
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="user-info-right">
                                                            <div class="user-infos">
                                                                <ul>
                                                                    <li><i class="far fa-money-bill-alt"></i>${m[3]}<i class="fas fa-info-circle" data-bs-toggle="tooltip" title="Lorem Ipsum"></i> </li>
                                                                </ul>
                                                            </div>
<!--                                                            <div class="mentor-booking">
                                                                <a class="apt-btn" href="booking.html">Unactive Mentor</a>
                                                            </div>-->
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
                </div>
            </div>
        </div>

        <!-- End of Pre footer -->
        <%@include file="footer.jsp" %>
        <!-- End of footer -->
    </body>
</html>