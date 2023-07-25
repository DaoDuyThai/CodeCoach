<%-- 
    Document   : mentornotifications
    Created on : Jun 19, 2023, 1:43:32 PM
    Author     : giang
--%>

<%@page import="model.Mentees"%>
<%@page import="model.Booking"%>
<%@page import="model.Users"%>
<%@page import="model.Notifications"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Mentor Notification</title>

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
        <!-- Header is placed here -->
        <%@include file="header.jsp" %>
        <!--End of header-->
        <%
            List<Notifications> listNotifications = (List<Notifications>) request.getAttribute("listNotifications");
            List<Users> listUsers = (List<Users>) request.getAttribute("listUsers");
            List<Booking> listBookings = (List<Booking>) request.getAttribute("listBookings");
            List<Mentees> listMentees = (List<Mentees>) request.getAttribute("listMentees");
            int menteeId = 0;
            int userId = 0;
            String menteeName = "";
        %>
        <div class="container">
            <div class="card">
                <div class="row">


                    <!-- mentor sidebar start -->
                    <%@include file="mentorsidebar.jsp" %>
                    <!-- mentor sidebar end -->


                    <div class="col-md-7 col-lg-8 col-xl-9">
                        <div class="card-header">
                            <h1>Notification</h1>
                        </div>
                        <%
                            if (listNotifications.size() == 0) {
                                out.print("You don't have any notifications!");
                            } else {
                                for (int i = listNotifications.size() - 1; i >= 0; i--) {
                        %>
                        <div class="card-body">
                            <div class="alert alert-primary" role="alert">
                                <%
                                    for (int j = 0; j < listBookings.size(); j++) {
                                        if (listNotifications.get(i).getBookingId() == listBookings.get(j).getBookingId()) {
                                            menteeId = listBookings.get(j).getMenteeId();
                                        }
                                    }
                                    for (int k = 0; k < listMentees.size(); k++) {
                                        if (menteeId == listMentees.get(k).getMenteeId()) {
                                            userId = listMentees.get(k).getUserId();
                                        }
                                    }
                                    for (int l = 0; l < listUsers.size(); l++) {
                                        if (userId == listUsers.get(l).getUserId()) {
                                            menteeName = listUsers.get(l).getfName() + " " + listUsers.get(l).getlName();
                                        }
                                    }
                                %>
                                You have a request to be a Mentor for <%out.print(menteeName);%>!
                            </div>                
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
    </body>
    <!-- end of Pre footer -->
    <%@include file="footer.jsp" %>
    <!-- footer is place here -->

    <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="assets/js/jquery-3.6.0.min.js"></script>

    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <script src="assets/js/owl.carousel.min.js"></script>

    <script src="assets/plugins/aos/aos.js"></script>

    <script src="assets/js/script.js"></script>
</html>