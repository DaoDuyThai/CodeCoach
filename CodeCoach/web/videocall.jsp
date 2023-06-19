<%-- 
    Document   : videocall
    Created on : Jun 19, 2023, 1:09:34 PM
    Author     : Duy Thai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Video Call</title>
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
            <div class="content">
                <div class="container-fluid">

                    <div class="call-wrapper">
                        <div class="call-main-row">
                            <div class="call-main-wrapper">
                                <div class="call-view">
                                    <div class="call-window">

                                        <div class="fixed-header">
                                            <div class="navbar">
                                                <div class="user-details">
                                                    <div class="float-start user-img">
                                                        <a class="avatar avatar-sm me-2" href="profile.html"
                                                           title="Jonathan Doe">
                                                            <img src="assets/img/user/user.jpg" alt="User Image"
                                                                 class="rounded-circle">
                                                            <span class="status online"></span>
                                                        </a>
                                                    </div>
                                                    <div class="user-info float-start">
                                                        <a href="profile.html"><span>Jonathan Doe</span></a>
                                                        <span class="last-seen">Online</span>
                                                    </div>
                                                </div>
                                                <ul class="nav float-end custom-menu">
                                                    <li class="nav-item dropdown dropdown-action">
                                                        <a href="#" class="nav-link dropdown-toggle"
                                                           data-bs-toggle="dropdown" aria-expanded="false"><i
                                                                class="fa fa-cog"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-end">
                                                            <a href="javascript:void(0)" class="dropdown-item">Settings</a>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>


                                        <div class="call-contents">
                                            <div class="call-content-wrap">
                                                <div class="user-video">
                                                    <img src="assets/img/video-call.jpg" alt="User Image">
                                                </div>
                                                <div class="my-video">
                                                    <ul>
                                                        <li>
                                                            <img src="assets/img/user/user.jpg" class="img-fluid"
                                                                 alt="User Image">
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="call-footer">
                                            <div class="call-icons">
                                                <span class="call-duration">00:59</span>
                                                <ul class="call-items">
                                                    <li class="call-item">
                                                        <a href title="Enable Video" data-placement="top"
                                                           data-bs-toggle="tooltip">
                                                            <i class="fas fa-video camera"></i>
                                                        </a>
                                                    </li>
                                                    <li class="call-item">
                                                        <a href title="Mute Audio" data-placement="top"
                                                           data-bs-toggle="tooltip">
                                                            <i class="fa fa-microphone microphone"></i>
                                                        </a>
                                                    </li>
                                                    <li class="call-item">
                                                        <a href title="Add User" data-placement="top"
                                                           data-bs-toggle="tooltip">
                                                            <i class="fa fa-user-plus"></i>
                                                        </a>
                                                    </li>
                                                    <li class="call-item">
                                                        <a href title="Full Screen" data-placement="top"
                                                           data-bs-toggle="tooltip">
                                                            <i class="fas fa-arrows-alt-v full-screen"></i>
                                                        </a>
                                                    </li>
                                                </ul>
                                                <div class="end-call">
                                                    <a href="javascript:void(0);">
                                                        <i class="material-icons">call_end</i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!--content end-->

            <!--Footer start-->
            <%@include file="footer.jsp" %>
            <!-- Footer end -->

        </div>


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/script.js"></script>
    </body>
</html>
