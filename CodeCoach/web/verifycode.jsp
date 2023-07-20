<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Mentoring</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
        <style>
            .blue-text {
                color: #0080ff; /* Mã màu xanh da trời */
            }
        </style>
    </head>
    <body class="account-page">

        <div class="main-wrapper">

            <div class="bg-pattern-style bg-pattern-style-register">
                <div class="content">

                    <div class="account-content">
                        <div class="account-box">
                            <div class="login-right">
                                <div class="login-header">
                                    <h3><span>CODECOACH </span> Register</h3>
                                    <p class="text-muted">Access to our dashboard</p>
                                </div>

                                <form action="verifycode" method="post">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label class="form-control-label">Code sent to your email <span class="blue-text">${email}</span> is:</label>
                                                <input id="verify-code" type="text" class="form-control" name="verification_code" autofocus>
                                            </div>
                                        </div>
                                    </div>
                                    <button class="btn btn-primary login-btn" type="submit">Create Account</button>
                                    <div class="account-footer text-center mt-3">
                                        Already have an account? <a class="forgot-link mb-0" href="login">Login</a>
                                    </div>
                                </form>

                                <%-- Display error message if the verification code is incorrect --%>
                                <c:if test="${not empty error}">
                                    <p style="color: red;">${error}</p>
                                </c:if>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>


        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/script.js"></script>
    </body>
</html>



