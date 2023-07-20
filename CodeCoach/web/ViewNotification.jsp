<%-- 
    Document   : ViewNotification
    Created on : Jul 13, 2023, 10:41:17 AM
    Author     : kienb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Notification</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body class="account-page">
        <!-- Header is placed here -->
        <%@include file="header.jsp" %>
        <!--End of header-->
        <div class="main-wrapper">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-md-12 col-8 ">
                        <center>
                            <h2 class="breadcrumb-title">Notification Detail</h2>
                        </center>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8 offset-md-2">
                        <div class="card card-table">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover table-center mb-0">
                                        <c:if test="${requestScope.status == 1}">
                                            <tr><td>Người gửi : ${requestScope.name}</td></tr>
                                            <tr><td>Môn học : ${requestScope.skill.skillName}</td></tr>
                                            <tr><td>You are booking successful!</td></tr>
                                        </c:if>

                                        <c:if test="${requestScope.status == 2}">
                                            <tr><td>Hello, your request has been sent, please wait for a response from the system</td></tr>
                                        </c:if>
                                        <c:if test="${requestScope.status == 3}">
                                            <tr><td>I regret to inform you that your booking with the mentor has been declined. We apologize for any inconvenience this may cause</td></tr>
                                        </c:if>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end of Pre footer -->
        <%@include file="footer.jsp" %>
        <!-- footer is place here -->

        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/script.js"></script>
    </body>
</html>



