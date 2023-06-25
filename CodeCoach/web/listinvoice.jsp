<%@page import="model.Skills"%>
<%@page import="model.BookingDetails"%>
<%@page import="model.Mentees"%>
<%@page import="model.Mentors"%>
<%@page import="model.Booking"%>
<%@page import="model.Users"%>
<%@page import="java.util.List"%>
<%@page import="model.ChatRoom"%>
<%@page import="model.ChatMessages"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>List Invoice</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }

            table th, table td {
                border: 1px solid black;
                padding: 8px;
                width: calc(100% / 4);
            }
        </style>
    </head>
    <body class="chat-page">
        <!-- Header is placed here -->
        <%@include file="header.jsp" %>
        <!--End of header-->

        <div class="account-box">              
            <div class="login-right">
                <div class="accordion" id="accordionExample">

                    <%List<Booking> listBookings = (List<Booking>) request.getAttribute("bookings");
                        List<Users> listUsers = (List<Users>) request.getAttribute("listusers");
                        List<Mentors> listMentors = (List<Mentors>) request.getAttribute("mentors");
                        List<Mentees> listMentees = (List<Mentees>) request.getAttribute("mentees");
                        List<Skills> listSkills = (List<Skills>) request.getAttribute("skills");
                        List<BookingDetails> listBookingDetails = (List<BookingDetails>) request.getAttribute("bookingDetails");
                        for (int i = 0; i < listBookings.size(); i++) {
                    %>
                    <div class="accordion-item">
                        <table>
                            <tr>
                                <th>Mentor Name</th>
                                <th>Mentee Name</th>
                                <th>Skill</th>
                                <th>Invoice</th>
                            </tr>                                   
                        </table>
                        <h2 class="accordion-header" id="<%="heading" + i%>">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="<%="#collapse" + i%>" aria-expanded="false" aria-controls="<%="collapse" + i%>">                             
                                <table>
                                    <tr>
                                        <th>
                                            <%for %>
                                        </th>
                                        <th>Header 2</th>
                                        <th>Header 3</th>
                                        <th>Header 3</th>
                                    </tr>                                   
                                </table>
                            </button>
                        </h2>
                        <div id="<%="collapse" + i%>" class="accordion-collapse collapse" aria-labelledby="<%="heading" + i%>" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                ${o.getAnswer()}
                            </div>
                        </div>
                    </div>  
                    <%
                        }
                    %>


                </div>
            </div>
        </div>


        <script src="assets/js/jquery-3.6.0.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/script.js"></script>
        <%@include file="footer.jsp" %>
    </body>
</html>
