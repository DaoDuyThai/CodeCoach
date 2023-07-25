<%-- 
    Document   : mentordashboard
    Created on : 12-Jun-2023, 03:38:57
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
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
                        <h2 class="breadcrumb-title">Dashboard</h2>
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
                        <div class="row">
                            <div class="col-md-12 col-lg-4 dash-board-list blue">
                                <div class="dash-widget">
                                    <div class="circle-bar">
                                        <div class="icon-col">
                                            <i class="fas fa-users"></i>
                                        </div>
                                    </div>
                                    <div class="dash-widget-info">
                                        <h3>${totalMentee}</h3>
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
                                        <h3>${totalAppointment}</h3>
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
                                        <h3><fmt:formatNumber value="${totalIncome}" type="currency" currencyCode="VND" /></h3>
                                        <h6>Total Earned</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <h4 class="mb-4">Booking Info Lists</h4>
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
                                                   <c:forEach var="booking" items="${BookingInfo}">
                                                        <tr>
                                                            <td>
                                                                <h2 class="table-avatar">
                                                                    <a href="profile.html" class="avatar avatar-sm me-2">
                                                                        <img class="avatar-img rounded-circle" src="assets/img/user/user2.jpg" alt="User Image">
                                                                    </a>
                                                                    <a href="profile.html">${booking[1]} ${booking[2]}</a>
                                                                </h2>
                                                            </td>
                                                            <td class="text-center">
                                                                <span class="status">${booking[3]}</span>
                                                            </td>
                                                            <td class="text-center">
                                                                <a href="profile.html" class="btn btn-sm bg-info-light">
                                                                    <i class="far fa-eye"></i> View
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                          <div class="row">
  <div class="col-md-12">
    <h4 class="mb-4">Booking Details</h4>
    <div class="card card-table">
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-hover table-center mb-0">
            <thead>
              <tr>
                <th>No.</th>
                <th>Time</th>
                <th>Date</th>
              </tr>
            </thead>
            <% int counter = 1; %>
            <tbody>
              <c:forEach var="bookingDetail" items="${bookingDetails}">
                <tr>
                  <td><%= counter %></td>
                  <td>
                <c:if test="${bookingDetail.slotId == 1}">
                    08:00 AM - 10:00 AM
                </c:if>
                <c:if test="${bookingDetail.slotId == 2}">
                    10:00 AM - 12:00 AM
                </c:if>
                <c:if test="${bookingDetail.slotId == 3}">
                    13:00 PM - 15:00 PM
                </c:if>
                <c:if test="${bookingDetail.slotId == 4}">
                    15:00 PM - 17:00 PM
                </c:if>
                <c:if test="${bookingDetail.slotId == 5}">
                    17:00 PM - 19:00 PM
                </c:if>
                <c:if test="${bookingDetail.slotId == 6}">
                    19:00 PM - 21:00 PM
                </c:if>
                <c:if test="${bookingDetail.slotId == 7}">
                    21:00 PM - 23:00 PM
                </c:if>
            </td>
                  <td>${bookingDetail.date}</td>
                </tr>
                <% counter++; %>
              </c:forEach>
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