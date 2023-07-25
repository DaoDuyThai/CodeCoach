<%@ page import="model.Users" %>
<%@ page import="dal.MentorDAO" %>
<%@ page import="dal.UserDAO" %>
<%@ page import="dal.SlotDAO" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/invoice-view.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:30 GMT -->
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

        <div class="main-wrapper">

            <!-- Header is placed here -->
            <%@include file="../header.jsp" %>
            <!--End of header-->

            <%
                Users user = (Users) request.getSession().getAttribute("users");
                Users mentor = new MentorDAO().getUserByMentorID((String) request.getAttribute("mentor-id"));
                request.setAttribute("mentor", mentor);
                request.setAttribute("user", user);
                request.setAttribute("slotDAO", new SlotDAO());
                request.setAttribute("mentorDAO", new MentorDAO());
            %>


            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <div class="invoice-content">
                                <div class="invoice-item">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="invoice-logo">
                                                <img src="assets/img/logo.png" alt="logo">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <p class="invoice-details">
                                                <strong>Order:</strong> #${requestScope.booking.bookingId} <br>
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <div class="invoice-item">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="invoice-info">
                                                <strong class="customer-text">Invoice From</strong>
                                                <p class="invoice-details invoice-details-two">
                                                    ${user.fName} ${user.lName} <br>
                                                    ${user.address}<br>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="invoice-info invoice-info2">
                                                <strong class="customer-text">Invoice To</strong>
                                                <p class="invoice-details">
                                                    ${mentor.fName} ${mentor.lName}<br>
                                                    ${mentor.address} <br>

                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="invoice-item invoice-table-wrap">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table class="invoice-table table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Details</th>
                                                            <th class="text-center">Date</th>
                                                            <th class="text-center">Slot</th>
                                                            <th class="text-end">Hourly Rate</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                        <c:forEach items="${requestScope.bookingDetails}" var="details">
                                                            <tr>
                                                                <td class="text-center">
                                                                    ${details.bookingDetailId}
                                                                </td>
                                                                <td class="text-center">
                                                                    ${details.date}
                                                                </td>
                                                                <td class="text-center">
                                                                    ${slotDAO.getSlotbySlotId(details.slotId).startTime.substring(0,8)} - ${slotDAO.getSlotbySlotId(details.slotId).endTime.substring(0,8)}
                                                                </td>
                                                                <td class="text-center">
                                                                    ${(mentorDAO.getMentorByUserId(mentor.userId)).hourlyRate * 2}
                                                                </td>
                                                            </tr>
                                                        </c:forEach>


                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xl-4 ms-auto">
                                            <div class="table-responsive">
                                                <table class="invoice-table-two table">
                                                    <tbody>
                                                        <tr>
                                                            <th>Total Amount:</th>
                                                            <td><span>VND${requestScope.bookingDetails.size() *2* (mentorDAO.getMentorByUserId(mentor.userId)).hourlyRate}</span></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <a href="book?mentor-id=${mentorDAO.getMentorByUserId(mentor.userId).mentorId}&user-id=${user.userId}">
                                    <button class="btn btn-primary">
                                        Book Again
                                    </button>
                                </a>

                                <div id="proceed-btn" class="submit-section proceed-btn text-end">
                                    <a href="bookingsuccessful" type="submit" class="btn btn-primary submit-btn">SAVE BOOKING</a>
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


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/script.js"></script>
    </body>

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/invoice-view.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:30 GMT -->
</html>