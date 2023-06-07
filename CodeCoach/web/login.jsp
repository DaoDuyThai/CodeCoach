<%-- 
    Document   : login
    Created on : Jun 7, 2023, 10:05:53 AM
    Author     : Duy Thai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

            <div class="bg-pattern-style">
                <div class="content">

                    <div class="account-content">
                        <div class="account-box">
                            <div class="login-right">
                                <div class="login-header">
                                    <h3>Login <span>CodeCoach</span></h3>
                                    <p class="text-muted">Access to our dashboard to explore endless possibilities</p>
                                </div>
                                <form action="<%=request.getContextPath()%>/login" method="post">
                                    <div class="form-group">
                                        <label class="form-control-label">Email Address</label>
                                        <input type="email" name= "email" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">Password</label>
                                        <div class="pass-group">
                                            <input type="password" name="password" class="form-control pass-input">
                                            <span class="fas fa-eye toggle-password"></span>
                                        </div>
                                    </div>
                                    <div class="text-end">
                                        <a class="forgot-link" href="forgotpass">Forgot Password?</a>
                                    </div>
                                    <button class="btn btn-primary login-btn" type="submit" value ="login">Login</button>
                                    <%
                                        String error = (String) request.getAttribute("error");
                                        if (error != null) {
                                    %>
                                    <div style="color: red"><%=error%></div>
                                    <%}
                                    %>
                                    <div class="text-center dont-have">Don’t have an account? <a
                                            href="register">Register</a></div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>


        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/script.js"></script>
</html>
