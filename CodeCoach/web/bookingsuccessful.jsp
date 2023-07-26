
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<%@page import="java.util.List"%>
<%@page import="model.Slot"%>
<%@page import="model.BookingDetails"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/booking-success.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:23 GMT -->

    <head>
        <meta charset="utf-8">
        <title>Mentoring</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>

    <body>
        <!-- Header is placed here -->
        <%@include file="header.jsp" %>
        <!--End of header-->
        <%List<BookingDetails> bookingdetails = (List<BookingDetails>) request.getAttribute("bookingdetails");
                    List<Slot> slots = (List<Slot>) request.getAttribute("slots"); %>
        <div class="main-wrapper">
            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <h2 class="breadcrumb-title">Booking</h2>
                        </div>
                    </div>
                </div>
            </div>


            <div class="content success-page-cont">
                <div class="container-fluid">
                    <div class="row justify-content-center">
                        <div class="col-lg-6">

                            <div class="card success-card">
                                <div class="card-body">
                                    <div class="success-cont">
                                        <i class="fas fa-check"></i>
                                        <h3>Appointment booked Successfully!</h3>
                                        <p>Appointment booked with <strong><%out.print(request.getAttribute("mentorName"));%>
                                                <br><br>
                                                <%
                                                    for (int i = 0; i < bookingdetails.size(); i++) {
                                                %>
                                            </strong> on <strong><%
                                                DateTimeFormatter initialFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                                LocalDate date = LocalDate.parse(bookingdetails.get(i).getDate(), initialFormatter);
                                                // ??nh d?ng m?i
                                                DateTimeFormatter newFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                                                String newDateString = date.format(newFormatter);
                                                out.print(newDateString);%>  
                                                <%
                                                    for (int j = 0; j < slots.size(); j++) {
                                                        if (bookingdetails.get(i).getSlotId() == slots.get(j).getSlotId()) {
                                                %>

                                            </strong>from <strong><%out.print(slots.get(j).getStartTime().substring(0, 8));%> 
                                                to <%out.print(slots.get(j).getEndTime().substring(0, 8));%></strong></p>
                                                <%
                                                        }
                                                    }
                                                %>    
                                                <%
                                                    }
                                                %>

                                        <a href="home" class="btn btn-primary view-inv-btn">Ok</a>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/script.js"></script>
    </body>
    <!-- end of Pre footer -->
    <%@include file="footer.jsp" %>
    <!-- footer is place here -->

</html>


