<%-- 
    Document   : feedback
    Created on : 15-Jun-2023, 10:44:56
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">


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
                        <nav aria-label="breadcrumb" class="page-breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Reviews</li>
                            </ol>
                        </nav>
                        <h2 class="breadcrumb-title">Reviews</h2>
                    </div>
                </div>
            </div>
        </div>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">

                        <div class="profile-sidebar">
                            <div class="user-widget">
                                <div class="pro-avatar">JD</div>
                                <div class="rating">
                                    <i class="fas fa-star filled"></i>
                                    <i class="fas fa-star filled"></i>
                                    <i class="fas fa-star filled"></i>
                                    <i class="fas fa-star filled"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="user-info-cont">
                                    <h4 class="usr-name">Jonathan Doe</h4>
                                    <p class="mentor-type">English Literature (M.A)</p>
                                </div>
                            </div>
                            <div class="progress-bar-custom">
                                <h6>Complete your profiles ></h6>
                                <div class="pro-progress">
                                    <div class="tooltip-toggle" tabindex="0"></div>
                                    <div class="tooltip">80%</div>
                                </div>
                            </div>
                            <div class="custom-sidebar-nav">
                                <ul>
                                    <li><a href="dashboard.html"><i class="fas fa-home"></i>Dashboard <span><i
                                                    class="fas fa-chevron-right"></i></span></a></li>
                                    <li><a href="bookings.html"><i class="fas fa-clock"></i>Bookings <span><i
                                                    class="fas fa-chevron-right"></i></span></a></li>
                                    <li><a href="schedule-timings.html"><i class="fas fa-hourglass-start"></i>Schedule
                                            Timings <span><i class="fas fa-chevron-right"></i></span></a></li>
                                    <li><a href="chat.html"><i class="fas fa-comments"></i>Messages <span><i
                                                    class="fas fa-chevron-right"></i></span></a></li>
                                    <li><a href="invoices.html"><i class="fas fa-file-invoice"></i>Invoices <span><i
                                                    class="fas fa-chevron-right"></i></span></a></li>
                                    <li><a href="reviews.html" class="active"><i class="fas fa-eye"></i>Reviews <span><i
                                                    class="fas fa-chevron-right"></i></span></a></li>
                                    <li><a href="blog.html"><i class="fab fa-blogger-b"></i>Blog <span><i
                                                    class="fas fa-chevron-right"></i></span></a></li>
                                    <li><a href="profile.html"><i class="fas fa-user-cog"></i>Profile <span><i
                                                    class="fas fa-chevron-right"></i></span></a></li>
                                    <li><a href="login.html"><i class="fas fa-sign-out-alt"></i>Logout <span><i
                                                    class="fas fa-chevron-right"></i></span></a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-7 col-lg-8 col-xl-9">
                        <div class="doc-review review-listing">

                            <ul class="comments-list">

                                <li>
                                    <div class="comment">
                                        <img class="avatar rounded-circle" alt="User Image"
                                            src="assets/img/user/user.jpg">
                                        <div class="comment-body">
                                            <div class="meta-data">
                                                <span class="comment-author">Richard Wilson</span>
                                                <span class="comment-date">Reviewed 2 Days ago</span>
                                                <div class="review-count rating">
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star"></i>
                                                </div>
                                            </div>
                                            <p class="recommended"><i class="far fa-thumbs-up"></i> I recommend the
                                                consectetur</p>
                                            <p class="comment-content">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                Ut enim ad minim veniam, quis nostrud exercitation.
                                                Curabitur non nulla sit amet nisl tempus
                                            </p>
                                            <div class="comment-reply">
                                                <a class="comment-btn" href="#">
                                                    <i class="fas fa-reply"></i> Reply
                                                </a>
                                                <p class="recommend-btn">
                                                    <span>Recommend?</span>
                                                    <a href="#" class="like-btn">
                                                        <i class="far fa-thumbs-up"></i> Yes
                                                    </a>
                                                    <a href="#" class="dislike-btn">
                                                        <i class="far fa-thumbs-down"></i> No
                                                    </a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>

                                    <ul class="comments-reply">

                                        <li>
                                            <div class="comment">
                                                <img class="avatar rounded-circle" alt="User Image"
                                                    src="assets/img/user/user.jpg">
                                                <div class="comment-body">
                                                    <div class="meta-data">
                                                        <span class="comment-author">Dr. Darren Elder</span>
                                                        <span class="comment-date">Reviewed 3 Days ago</span>
                                                    </div>
                                                    <p class="comment-content">
                                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                        sed do eiusmod tempor incididunt ut labore et dolore magna
                                                        aliqua.
                                                        Ut enim ad minim veniam.
                                                        Curabitur non nulla sit amet nisl tempus
                                                    </p>
                                                    <div class="comment-reply">
                                                        <a class="comment-btn" href="#">
                                                            <i class="fas fa-reply"></i> Reply
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>

                                    </ul>

                                </li>


                                <li>
                                    <div class="comment">
                                        <img class="avatar rounded-circle" alt="User Image"
                                            src="assets/img/user/user.jpg">
                                        <div class="comment-body">
                                            <div class="meta-data">
                                                <span class="comment-author">Travis Trimble</span>
                                                <span class="comment-date">Reviewed 4 Days ago</span>
                                                <div class="review-count rating">
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                </div>
                                            </div>
                                            <p class="comment-content">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                Ut enim ad minim veniam, quis nostrud exercitation.
                                                Curabitur non nulla sit amet nisl tempus
                                            </p>
                                            <div class="comment-reply">
                                                <a class="comment-btn" href="#">
                                                    <i class="fas fa-reply"></i> Reply
                                                </a>
                                                <p class="recommend-btn">
                                                    <span>Recommend?</span>
                                                    <a href="#" class="like-btn">
                                                        <i class="far fa-thumbs-up"></i> Yes
                                                    </a>
                                                    <a href="#" class="dislike-btn">
                                                        <i class="far fa-thumbs-down"></i> No
                                                    </a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </li>


                                <li>
                                    <div class="comment">
                                        <img class="avatar rounded-circle" alt="User Image"
                                            src="assets/img/user/user3.jpg">
                                        <div class="comment-body">
                                            <div class="meta-data">
                                                <span class="comment-author">Carl Kelly</span>
                                                <span class="comment-date">Reviewed 5 Days ago</span>
                                                <div class="review-count rating">
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                </div>
                                            </div>
                                            <p class="comment-content">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                Ut enim ad minim veniam, quis nostrud exercitation.
                                                Curabitur non nulla sit amet nisl tempus
                                            </p>
                                            <div class="comment-reply">
                                                <a class="comment-btn" href="#">
                                                    <i class="fas fa-reply"></i> Reply
                                                </a>
                                                <p class="recommend-btn">
                                                    <span>Recommend?</span>
                                                    <a href="#" class="like-btn">
                                                        <i class="far fa-thumbs-up"></i> Yes
                                                    </a>
                                                    <a href="#" class="dislike-btn">
                                                        <i class="far fa-thumbs-down"></i> No
                                                    </a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                            </ul>

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