<%-- 
    Document   : mentordashboard
    Created on : 12-Jun-2023, 03:38:57
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                
                            </ol>
                        </nav>
                        <h2 class="breadcrumb-title">Dashboard</h2>
                    </div>
                </div>
            </div>
        </div>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">

                        <div class="profile-sidebar">
                            <div class="user-widget">
                                <div class="pro-avatar">JD</div>
                                <div class="rating">
                                    <i class="fas fa-star filled"></i>
                                    <i class="fas fa-star filled"></i>
                                    <i class="fas fa-star filled"></i>
                                    <i class="fas fa-star filled"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <c:if test="${users.roleId == 2}">
                                <div class="user-info-cont">
                                    <h4 class="usr-name">${users.lName} ${users.fName}</h4>
                                    <p class="mentor-type"></p>
                                </div>
                                </c:if>
                            </div>
                            <div class="custom-sidebar-nav">
                                <ul>
                                    <li><a href="dashboard.html" class="active"><i class="fas fa-home"></i>Dashboard
                                            <span><i class="fas fa-chevron-right"></i></span></a></li>
                                    <li><a href="bookings.html"><i class="fas fa-clock"></i>Bookings <span><i
                                                    class="fas fa-chevron-right"></i></span></a></li>
                                    <li><a href="schedule-timings.html"><i class="fas fa-hourglass-start"></i>Schedule
                                            Timings <span><i class="fas fa-chevron-right"></i></span></a></li>
                                    <li><a href="chat.html"><i class="fas fa-comments"></i>Messages <span><i
                                                    class="fas fa-chevron-right"></i></span></a></li>
                                    <li><a href="invoices.html"><i class="fas fa-file-invoice"></i>Invoices <span><i
                                                    class="fas fa-chevron-right"></i></span></a></li>
                                    <li><a href="reviews.html"><i class="fas fa-eye"></i>Reviews <span><i
                                                    class="fas fa-chevron-right"></i></span></a></li>                                  
                                    <li><a href="profile.html"><i class="fas fa-user-cog"></i>Profile <span><i
                                                    class="fas fa-chevron-right"></i></span></a></li>
                                    <li><a href="login"><i class="fas fa-sign-out-alt"></i>Logout <span><i
                                                    class="fas fa-chevron-right"></i></span></a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-7 col-lg-8 col-xl-9">
                        <div class="row">
                            <div class="col-md-12 col-lg-4 dash-board-list blue">
                                <div class="dash-widget">
                                    <div class="circle-bar">
                                        <div class="icon-col">
                                            <i class="fas fa-users"></i>
                                        </div>
                                    </div>
                                    <div class="dash-widget-info">
                                        <h3>23</h3>
                                        <h6>Members</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-lg-4 dash-board-list yellow">
                                <div class="dash-widget">
                                    <div class="circle-bar">
                                        <div class="icon-col">
                                            <i class="fas fa-calendar-check"></i>
                                        </div>
                                    </div>
                                    <div class="dash-widget-info">
                                        <h3>33</h3>
                                        <h6>Appointments</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-lg-4 dash-board-list pink">
                                <div class="dash-widget">
                                    <div class="circle-bar">
                                        <div class="icon-col">
                                            <i class="fas fa-wallet"></i>
                                        </div>
                                    </div>
                                    <div class="dash-widget-info">
                                        <h3>$14</h3>
                                        <h6>Total Earned</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <h4 class="mb-4">Mentee Lists</h4>
                                <div class="card card-table">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-hover table-center mb-0">
                                                <thead>
                                                    <tr>
                                                        <th>BASIC INFO</th>
                                                        <th class="text-center">TAGS</th>
                                                        <th class="text-center">ACTION</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <a href="profile.html"
                                                                    class="avatar avatar-sm me-2"><img
                                                                        class="avatar-img rounded-circle"
                                                                        src="assets/img/user/user2.jpg"
                                                                        alt="User Image"></a>
                                                                <a href="profile.html">Tyrone Roberts<span><span
                                                                            class="__cf_email__"
                                                                            data-cfemail="ec98959e8382899e838e899e989fac8d88838e89c28f8381">[email&#160;protected]</span></span></a>
                                                            </h2>
                                                        </td>
                                                        
                                                        <td class="text-center"><span class="pending">PENDING</span>
                                                        </td>
                                                        <td class="text-center"><a href="profile.html"
                                                                class="btn btn-sm bg-info-light"><i
                                                                    class="far fa-eye"></i> View</a></td>
                                                    </tr>  
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Header is placed here -->
        <%@include file="footer.jsp" %>
        <!--End of header-->

    </div>


    <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="assets/js/jquery-3.6.0.min.js"></script>

    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
    <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

    <script src="assets/js/script.js"></script>
</body>



</html>