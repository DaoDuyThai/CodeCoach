<%-- 
    Document   : profilesetting
    Created on : Jun 7, 2023, 11:44:30 PM
    Author     : NGHIA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <c:set var="users" value="${sessionScope.users}"/>
    <!-- Mirrored from mentoring.dreamguystech.com/html/template/profile-settings.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:21 GMT -->

    <head>
        <meta charset="utf-8">
        <title>Mentoring</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

        <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>

    <body>

        <div class="main-wrapper">

            <%@include file="header.jsp" %>



            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <h2 class="breadcrumb-title">Profile Settings</h2>
                        </div>
                    </div>
                </div>
            </div>


            <div class="content">
                <c:if test="${not empty users.fName}">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-2 col-lg-2 col-xl-2"></div>
                            <div class="col-md-8 col-lg-8 col-xl-8">
                                <div class="card">
                                    <div class="card-body">

                                        <form>
                                            <div class="row form-row">
                                                <div class="col-12 col-md-12">
                                                    <div class="form-group">
                                                        <div class="change-avatar">
                                                            <div class="profile-img">
                                                                <img src="assets/img/user/user.jpg" alt="User Image">
                                                            </div>
                                                            <div class="upload-img">
                                                                <div class="change-photo-btn">
                                                                    <span><i class="fa fa-upload"></i> Upload Photo</span>
                                                                    <input type="file" class="upload">
                                                                </div>
                                                                <small class="form-text text-muted">Allowed JPG, GIF or PNG. Max
                                                                    size of 2MB</small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <div class="form-group">
                                                        <label>First Name</label>
                                                        <input type="text" class="form-control" value="${users.fName}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <div class="form-group">
                                                        <label>Last Name</label>
                                                        <input type="text" class="form-control" value="${users.lName}">
                                                    </div>
                                                </div>


                                                <div class="col-12 col-md-6">
                                                    <div class="form-group">
                                                        <label>Email ID</label>
                                                        <input type="email" class="form-control" disabled
                                                               value="${users.email}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <div class="form-group">
                                                        <label>Mobile</label>
                                                        <input type="text" value="${users.phoneNum}" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label>Address</label>
                                                        <input type="text" class="form-control" value="${users.address}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <div class="form-group">
                                                        <label>City</label>
                                                        <input type="text" class="form-control" value="${users.address}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <div class="form-group">
                                                        <label>State</label>
                                                        <input type="text" class="form-control" value="Newyork">
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="submit-section">
                                                <button type="submit" class="btn btn-primary submit-btn">Save Changes</button>
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>

  
            <%@include file="footer.jsp" %>

        </div>


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/plugins/select2/js/select2.min.js"></script>

        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <script src="assets/js/script.js"></script>
    </body>

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/profile-settings.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:22 GMT -->

</html>
