<%@ page import="dal.SkillDAO" %><%--
    Document   : viewbooking
    Created on : Jun 12, 2023, 9:54:34 PM
    Author     : MrTuan
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Mentor Booking</title>

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">

        <link rel="stylesheet" href="assets/plugins/aos/aos.css">

        <link rel="stylesheet" href="assets/css/style.css">
        <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    </head>
    <body>


        <div class="main-wrapper">

            <!-- Header is placed here -->
            <%@include file="../header.jsp" %>
            <!--End of header-->


            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <!-- mentor sidebar start -->
                        <%@include file="../mentorsidebar.jsp" %>
                        <!-- mentor sidebar end -->



                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <h3 class="pb-3">Booking Summary</h3>

                            <div class="tab-pane show active" id="mentee-list">
                                <div class="card card-table">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-hover table-center mb-0">
                                                <thead>
                                                    <tr>
                                                        <th>MENTEE LISTS</th>
                                                        <th>Skill</th>
                                                        <th class="text-center">View details</th>
                                                        <th class="text-center">Status</th>
                                                        <th class="text-center">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%request.setAttribute("daoSkill", new SkillDAO());%>
                                                    <c:forEach items="${requestScope.mentorBookings}" var="booking">
                                                        <tr>
                                                            <td>
                                                                ${booking.menteeName}
                                                            </td>
                                                            <th>
                                                                ${daoSkill.getSkillBySkillId(booking.skillId).skillName}
                                                            </th>
                                                            <td class="text-center">
                                                                <a href="mentor-booking-details?booking-id=${booking.bookingId}">
                                                                    <button class="btn btn-primary">
                                                                        View details
                                                                    </button>
                                                                </a>
                                                            </td>
<!--                                                            <td class="text-center"><a href="profile-mentee.html" class="btn btn-sm bg-info-light"><i ></i>${booking.status}</a></td>-->
                                                            <td class="text-center">
                                                                <a href="profile-mentee.html" class="btn btn-sm
                                                                   ${booking.status == 'Pending' ? 'btn btn-warning' : 
                                                                     booking.status == 'Accepted' ? 'btn btn-primary' :  'btn-danger'}">
                                                                    <i></i>${booking.status}
                                                                </a>
                                                            </td>


                                                            <td class="text-center">
                                                                <c:if test="${'Pending'.equals(booking.status)}">
                                                                    <a href="mentor-booking?go=accept&booking-id=${booking.bookingId}&status=Accepted" class="text-white">
                                                                        <button class="btn btn-primary">
                                                                            Accept
                                                                        </button>
                                                                    </a>
                                                                    <a href="mentor-booking?go=accept&booking-id=${booking.bookingId}&status=Rejected" class="text-white">
                                                                        <button class="btn btn-danger">
                                                                            Reject
                                                                        </button>
                                                                    </a>
                                                                </c:if>
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

                    </div>
                </div>
            </div>
            <!--Footer start-->
            <%@include file="../footer.jsp" %>
            <!-- Footer end -->

        </div>


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/owl.carousel.min.js"></script>

        <script src="assets/plugins/aos/aos.js"></script>

        <script src="assets/js/script.js"></script>
    </body>
</html>



