<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">


    <head>
        <meta charset="utf-8">
        <title>Mentoring</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#searchInput").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#dropdownList option").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });
        </script>
        <style>
            p {
                margin-top: 10px;
                color: red;
            }

        </style>
    </head>

    <body class="account-page">

        <div class="main-wrapper">

            <div class="bg-pattern-style bg-pattern-style-register">
                <center>

                </center>
                <div class="w-100 p-3 d-flex align-items-center justify-content-center">
                    <div class="account-content">
                        <div class="account-box">
                            <div class="login-right">
                                <div class="login-header">
                                    <h3><span>CodeCoach</span> Register</h3>
                                    <p class="text-muted">Access to our dashboard</p>
                                </div>

                                <form class="form" action="register" method="post" onsubmit="return validatePassword()" id="form"> 
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-control-label">First Name</label>
                                                <input id="first-name" type="text" class="form-control" name="first_name" required
                                                       autofocus>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-control-label">Last Name</label>
                                                <input id="last-name" type="text" class="form-control" name="last_name" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group" >
                                        Gender :
                                        <label for="male">Male</label>
                                        <input class="form-check-input" type="radio" id="male" name="gender" value="Male" checked >

                                        <label for="female">Female</label>
                                        <input class="form-check-input" type="radio" id="female" name="gender" value="Female">
                                    </div>

                                    <div class="form-group">
                                        <label class="form-control-label">Email Address</label>
                                        <input id="email" type="email" class="form-control" name="email" required onchange="checkEmailExisted()">
                                        <div id="error" style="color: red"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">Phone Number</label>
                                        <input id="phonenumber" type="number" class="form-control" name="phone_number" required>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-control-label">City</label>
                                                <select class="form-select" name="" id="cityList" onchange="changeCity()" required>
                                                    <option value="" selected=""></option>
                                                    <c:forEach items="${requestScope.listCity}" var="i">
                                                        <option value="${i.mattp}">${i.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-control-label">District</label>
                                                <select class="form-select" name="district" id="district" style="display: none" required>

                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">Address</label>
                                        <input id="address" type="text" class="form-control" name="address" required>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-control-label">Facebook</label>
                                        <input id="facebook" type="text" class="form-control" name="facebook" required>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-control-label">Password</label>
                                                <input id="password" type="password" class="form-control" name="password" required>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-control-label">Confirm Password</label>
                                                <input id="password-confirm" type="password" class="form-control"
                                                       name="password_confirmation"  required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-check form-check-xs custom-checkbox">
                                            <input type="checkbox" class="form-check-input" name="agreeCheckboxUser"
                                                   id="agree_checkbox_user" required>
                                            <label class="form-check-label" for="agree_checkbox_user">I agree to
                                                CodeCoach</label> <a tabindex="-1" href="privacypolicyandterms" style="color: blue;text-decoration: underline">Privacy
                                                Policy and Terms </a> 
                                        </div>
                                    </div>
                                    <button  class="btn btn-primary login-btn" type="submit" name="create" id="submit">Create
                                        Account</button>
                                    <p id="message"></p>
                                    <div class="account-footer text-center mt-3">
                                        Already have an account? <a class="forgot-link mb-0" href="login">Login</a>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>

        <script type="text/javascript">
            function changeCity() {
                $.ajax({
                    type: 'POST',
                    data: {
                        id: $('#cityList').val()
                    },
                    url: '${pageContext.request.contextPath}/chooseDistrict',
                    success: function (data, textStatus, jqXHR) {
                        if ($('#cityList').val() !== '') {
                            $('#district').css("display", "inline");
                        } else {
                            $('#district').css("display", "none");
                        }
                        $('#district').html(data)
                    }
                }
                )
            }

            function checkEmailExisted() {
                $.ajax({
                    type: 'POST',
                    data: {
                        email: $('#email').val()
                    },
                    url: '${pageContext.request.contextPath}/checkEmailExisted',
                    success: function (data, textStatus, jqXHR) {
                        if(data){
                            $('#error').html(data);
                            $('#submit').prop('disabled',true);
                        }
                        else {
                            $('#error').html('');
                            $('#submit').removeAttr('disabled')
                        }
                    }
                }
                )
            }
        </script>

        <script>
            function validatePassword() {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("password-confirm").value;
                var message = document.getElementById("message");
                
                if (password !== confirmPassword) {
                    message.style.color = "red";
                    message.innerHTML = "Password Confirm is not match  ! Please re-enter.";
                    return false; // Ng?n ch?n g?i form
                } 
                else{
                    message.innerHTML = '';
                    return true;
                }
                
            }
        </script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/script.js"></script>

    </body>


</html>