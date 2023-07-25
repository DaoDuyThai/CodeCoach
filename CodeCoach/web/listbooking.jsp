<%-- 
    Document   : listbooking
    Created on : Jun 19, 2023, 2:14:28 PM
    Author     : giang
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="model.Mentees"%>
<%@page import="model.Mentors"%>
<%@page import="model.Skills"%>
<%@page import="model.BookingDetails"%>
<%@page import="model.Booking"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Admin Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
        <%
            List<Booking> listBookings = (List<Booking>) request.getAttribute("listBookings");
            List<BookingDetails> listBookingDetails = (List<BookingDetails>) request.getAttribute("listBookingDetails");
            List<Skills> listSkills = (List<Skills>) request.getAttribute("listSkills");
            List<Mentors> listMentors = (List<Mentors>) request.getAttribute("listMentors");
            List<Mentees> listMentees = (List<Mentees>) request.getAttribute("listMentees");
        %>

        <div class="main-wrapper">
            <!-- Header is placed here -->
            <%@include file="header.jsp" %>
            <!--End of header-->
            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <h2 class="breadcrumb-title">List Booking</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- mentee side bar start -->
                <%@include file="adminsidebar.jsp" %>
                <!-- mentee side bar end -->
                <div class="content col-md-7 col-lg-8 col-xl-9">
                    <div class="container-fluid">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">UserId of Mentor</th>
                                    <th scope="col">UserId of Mentee</th>
                                    <th scope="col">Skill</th>
                                    <th scope="col">Start Date</th>
                                    <th scope="col">End Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (int i = 0; i < listBookings.size(); i++) {
                                %>
                                <tr>
                                    <th scope="row"><%out.print(i + 1);%></th>
                                    <td>
                                        <%
                                            for (int j = 0; j < listMentors.size(); j++) {
                                                if (listMentors.get(j).getMentorId() == listBookings.get(i).getMentorId()) {
                                                    out.print(listMentors.get(j).getUserId());
                                                }
                                            }
                                        %>
                                    </td>
                                    <td>
                                        <%
                                            for (int k = 0; k < listMentees.size(); k++) {
                                                if (listMentees.get(k).getMenteeId() == listBookings.get(i).getMenteeId()) {
                                                    out.print(listMentees.get(k).getUserId());
                                                }
                                            }
                                        %>
                                    </td>
                                    <td>
                                        <%
                                            for (int l = 0; l < listSkills.size(); l++) {
                                                if (listSkills.get(l).getSkillId() == listBookings.get(i).getSkillId()) {
                                                    out.print(listSkills.get(l).getSkillName());
                                                }
                                            }
                                        %>
                                    </td>
                                    <td>
                                        <%
                                            for (int m = 0; m < listBookingDetails.size(); m++) {
                                                if (listBookingDetails.get(m).getBookingId() == listBookings.get(i).getBookingId()) {
                                                    DateTimeFormatter initialFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                                    LocalDate date = LocalDate.parse(listBookingDetails.get(m).getDate(), initialFormatter);
                                                    // Định dạng mới
                                                    DateTimeFormatter newFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                                                    String newDateString = date.format(newFormatter);
                                                    out.print(newDateString);
                                                    break;
                                                }
                                            }

                                        %>
                                    </td>
                                    <td>
                                        <%                                        for (int n = listBookingDetails.size() - 1; n >= 0; n--) {
                                                if (listBookingDetails.get(n).getBookingId() == listBookings.get(i).getBookingId()) {
                                                    DateTimeFormatter initialFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                                    LocalDate date = LocalDate.parse(listBookingDetails.get(n).getDate(), initialFormatter);
                                                    // Định dạng mới
                                                    DateTimeFormatter newFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                                                    String newDateString = date.format(newFormatter);
                                                    out.print(newDateString);
                                                    break;
                                                }
                                            }
                                        %>
                                    </td>
                                </tr>
                                <%                                }
                                %>                         
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>    
        </div>        

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
    <!-- end of Pre footer -->
    <%@include file="footer.jsp" %>
    <!-- footer is place here -->
</html>



