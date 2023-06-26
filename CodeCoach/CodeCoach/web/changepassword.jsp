<%-- 
    Document   : Change Password
    Created on : 25-May-2023, 15:48:16
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta charset="utf-8">
    <title>CodeCoach</title>
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


        <div class="breadcrumb-bar">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-md-12 col-12">

                        <h2 class="breadcrumb-title">Change Password</h2>
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
                                <div class="row">
                                    <div class="col-md-12 col-lg-6">

                                        <form action="changepassword" method="post">
                                            <div class="form-group">
                                                <label>Old Password</label>
                                                <input type="password" name="opass" class="form-control">
                                                <input type="hidden" name="email" value="${sessionScope.users.email}">
                                            </div>
                                            <%
                                                String error = (String) request.getAttribute("error");
                                                if (error != null) {
                                            %>
                                            <div style="color: red"><%=error%></div>
                                            <%}
                                            %>
                                            <div class="form-group">
                                                <label>New Password</label>
                                                <input type="password" name="pass" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label>Confirm Password</label>
                                                <input type="password" name="rpass" class="form-control">
                                            </div>
                                            <%
                                                String err1 = (String) request.getAttribute("err1");
                                                if (err1 != null) {
                                            %>
                                            <div style="color: red"><%=err1%></div>
                                            <%}
                                            %>

                                            <div class="submit-section">
                                                <button type="submit" class="btn btn-primary submit-btn" value="change">Save
                                                    Changes</button>
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


        <!-- end of Pre footer -->
        <%@include file="footer.jsp" %>
        <!-- footer is place here -->

    </div>


    <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="assets/js/jquery-3.6.0.min.js"></script>

    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
    <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

    <script src="assets/js/script.js"></script>
</body>

</html>