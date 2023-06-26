<%-- 
    Document   : viewbooking
    Created on : Jun 12, 2023, 9:54:34 PM
    Author     : MrTuan
--%>

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
                                        <a href="profile.html" class="booking-user-img">
                                            <img src="assets/img/user/user2.jpg" alt="User Image">
                                        </a>
                                        <div class="booking-info">
                                            <h4><a href="profile.html">Tyrone Roberts</a></h4>
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

                            <div class="card booking-schedule schedule-widget">

                                <div class="schedule-header">
                                    <div class="row">
                                        <div class="col-md-12">

                                            <div class="day-slot">
                                                <ul>
                                                    <li class="left-arrow">
                                                        <a href>
                                                            <i class="fa fa-chevron-left"></i>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <span id="dayOfWeek1"></span>
                                                        <span class="slot-date" id="date1"></span>
                                                    </li>
                                                    <li>
                                                        <span id="dayOfWeek2"></span>
                                                        <span class="slot-date" id="date2"></span>
                                                    </li>
                                                    <li>
                                                        <span id="dayOfWeek3"></span>
                                                        <span class="slot-date" id="date3"></span>
                                                    </li>
                                                    <li>
                                                        <span id="dayOfWeek4"></span>
                                                        <span class="slot-date" id="date4"></span>
                                                    </li>
                                                    <li>
                                                        <span id="dayOfWeek5"></span>
                                                        <span class="slot-date" id="date5"></span>
                                                    </li>
                                                    <li>
                                                        <span id="dayOfWeek6"></span>
                                                        <span class="slot-date" id="date6"></span>
                                                    </li>
                                                    <li>
                                                        <span id="dayOfWeek7"></span>
                                                        <span class="slot-date" id="date7"></span>
                                                    </li>
                                                    <li class="right-arrow">
                                                        <a href>
                                                            <i class="fa fa-chevron-right"></i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>

                                        </div>
                                    </div>
                                </div>


                                <div class="schedule-cont">
                                    <div class="row">
                                        <div class="col-md-12">

                                            <div class="time-slot">
                                                <ul class="clearfix">
                                                    <c:forEach begin="1" end="7" var="i">
                                                        <li>
                                                            <c:forEach items="${requestScope.listSlot}" var="s">
                                                                <a class="timing" href="#" onclick="highlightTimeSlot(this)" data-slotid="${s.getSlotId()}">
                                                                    <span>${s.getStartTime()} - ${s.getEndTime()}</span>
                                                                </a>
                                                            </c:forEach>
                                                        </li>
                                                    </c:forEach>
                                                </ul>

                                            </div>

                                        </div>
                                    </div>
                                </div>

                            </div>


                            <div class="submit-section proceed-btn text-end">
                                <a href="checkout.html" class="btn btn-primary submit-btn">Proceed to Pay</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!--Footer start-->
            <%@include file="../footer.jsp" %>
            <!-- Footer end -->

        </div>
        <script>
            const today = new Date();

            const daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
            const currentDate = today.getDate();
            const currentMonth = today.toLocaleDateString('en-US', {month: 'short'});
            const currentYear = today.getFullYear();

            document.getElementById("dayOfWeek1").textContent = daysOfWeek[today.getDay()];
            document.getElementById("date1").textContent = currentDate + " " + currentMonth + " " + currentYear;

            for (let i = 2; i <= 7; i++) {
                const nextDate = new Date(today);
                nextDate.setDate(currentDate + (i - 1));

                const nextDayOfWeek = daysOfWeek[nextDate.getDay()];
                const nextDay = nextDate.getDate();
                const nextMonth = nextDate.toLocaleDateString('en-US', {month: 'short'});
                const nextYear = nextDate.getFullYear();

                document.getElementById("dayOfWeek" + i).textContent = nextDayOfWeek;
                document.getElementById("date" + i).textContent = nextDay + " " + nextMonth + " " + nextYear;
            }
            function highlightTimeSlot(element) {
                const allTimeSlots = document.querySelectorAll(".timing");
                allTimeSlots.forEach(slot => slot.classList.remove("selected"));

                element.classList.add("selected");

                const selectedSlotId = element.getAttribute("data-slotid");
                console.log("Selected SlotId:", selectedSlotId);
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
