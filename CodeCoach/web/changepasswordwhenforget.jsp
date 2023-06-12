<%-- 
    Document   : changepasswordwhenforget
    Created on : Jun 4, 2023, 11:08:16 PM
    Author     : Duy Thai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Change Password</title>
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
            <%@include file="header.jsp" %>
            <!--End of header-->

            <!--content start-->

            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">

                            <h2 class="breadcrumb-title">Change Password</h2>
                            <p>Change your password in three easy steps. This will help you to secure your password!</p>
                            <p>1. Enter your email address below</p>
                            <p>2. Our system will send you an OTP to your email</p>
                            <p>3. Enter the OTP code</p>
                        </div>
                    </div>
                </div>
            </div>


            <div class="content">
                <div class="container-fluid">
                    <div class="row">

                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row ">
                                        <div class="col-md-12 col-lg-12">

                                            <form action="changepasswordwhenforget" method="post">
                                                <div class="form-group">
                                                    <label>Enter new password</label>
                                                    <input type="text" name="password" class="form-control" required="">
                                                </div>
                                                <!--error if encountered-->
                                                <%
                                                    String error = (String) request.getAttribute("error");
                                                    if (error != null) {
                                                %>
                                                <div style="color: red"><%=error%></div>
                                                <%}
                                                %>


                                                <div class="submit-section">
                                                    <button type="submit" class="btn btn-primary submit-btn" value="change">Get new password</button>
                                                </div>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--content end-->

            <!-- footer is place here -->

            <%@include file="footer.jsp" %>
            <!-- end of footer -->


        </div>


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <script src="assets/js/script.js"></script>
    </body>
</html>