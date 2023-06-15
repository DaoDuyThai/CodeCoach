<%-- 
    Document   : viewbooking
    Created on : Jun 12, 2023, 9:54:34 PM
    Author     : MrTuan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>CodeCoach</title>

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
            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Booking</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Booking</h2>
                        </div>
                    </div>
                </div>
            </div>


            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="booking-user-info">
                                        <c:set var="minf" value="${requestScope.infoMentor}" />
                                        <a href="profile.html" class="booking-user-img">
                                            <img src="${minf.getUsers().getAvatar()== null ? "https://res.cloudinary.com/ddrjnfihc/image/upload/v1667138651/Home/images/UserProfile/default.jpg" : minf.getUsers().getAvatar()}" alt="User Image">
                                        </a>
                                        <div class="booking-info">
                                            <h4><a href="profile.html">${minf.getUsers().getfName()} ${minf.getUsers().getlName()}</a></h4>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">35</span>
                                            </div>
                                            <p class="text-muted mb-0"><i class="fas fa-map-marker-alt"></i> Newyork, USA
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-4 col-md-6">
                                    <h4 class="mb-1">11 November 2019</h4>
                                    <p class="text-muted">Monday</p>
                                </div>
                                <div class="col-12 col-sm-8 col-md-6 text-sm-end">
                                    <div class="bookingrange btn btn-white btn-sm mb-3">
                                        <i class="far fa-calendar-alt me-2"></i>
                                        <span></span>
                                        <i class="fas fa-chevron-down ms-2"></i>
                                    </div>
                                </div>
                            </div>


                            <h1>Chọn một khung giờ</h1>
                            <form action="hire" method="POST">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Ngày</th>
                                            <th>Khung giờ</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%!
                                            // Phương thức để lấy danh sách ngày từ ngày hiện tại cho đến 7 ngày sau
                                            private List<LocalDate> getDates() {
                                                List<LocalDate> dates = new ArrayList<>();
                                                LocalDate currentDate = LocalDate.now();
                                                for (int i = 0; i <= 7; i++) {
                                                    dates.add(currentDate.plusDays(i));
                                                }
                                                return dates;
                                            }
                                        %>
                                        <%
                                            List<LocalDate> dates = getDates();
                                            int index = 0;
                                            for (LocalDate date : dates) {
                                        %>
                                        <tr>
                                            <td><%= date%></td>
                                            <td>
                                                <select name="timeslot_<%= index%>" onchange="updateSlots(<%= index%>)">
                                                    <option value="">-- Chọn khung giờ --</option> <!-- Giá trị mặc định là null -->
                                                    <c:forEach items="${requestScope.listSlot}" var="s">
                                                        <option value="${s.getSlotId()}">${s.getStartTime()} - ${s.getEndTime()}</option>
                                                    </c:forEach>
                                                </select>
                                                <input type="hidden" name="date_<%= index%>" value="<%= date%>">
                                            </td>
                                        </tr>
                                        <%
                                                index++;
                                            }
                                        %>
                                    </tbody>
                                </table>
                                <br/>
                                <div class="submit-section proceed-btn text-end">
                                    <button href="checkout.html" class="btn btn-primary submit-btn" value="${minf.getUserId()}" name="mentorId">Proceed to Pay</button>
                                </div>
                            </form>




                        </div>
                    </div>
                </div>
            </div>
            <!--Footer start-->
            <%@include file="../footer.jsp" %>
            <!-- Footer end -->

        </div>
        <script>
            function updateSlots(selectedIndex) {
                var selectBoxes = document.getElementsByTagName("select");
                for (var i = 0; i < selectBoxes.length; i++) {
                    if (i !== selectedIndex) {
                        selectBoxes[i].selectedIndex = 0; // Đặt lại giá trị mặc định
                    }
                }
            }
        </script>


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/owl.carousel.min.js"></script>

        <script src="assets/plugins/aos/aos.js"></script>

        <script src="assets/js/script.js"></script>
    </body>

</html>
