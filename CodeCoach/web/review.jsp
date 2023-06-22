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
                    
                    <!-- mentor sidebar start -->
                    <%@include file="mentorsidebar.jsp" %>
                    <!-- mentor sidebar end -->
                    
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