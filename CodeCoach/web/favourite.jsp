<%-- 
    Document   : favourite
    Created on : 19-Jun-2023, 13:50:03
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">



<head>
    <meta charset="utf-8">
    <title>CodeCoach</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

    <link href="assets/img/favicon.png" rel="icon">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>

    <div class="main-wrapper">

        


        <div class="breadcrumb-bar">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-md-8 col-12">
                        <h2 class="breadcrumb-title">Favourites</h2>
                    </div>
                    <div class="col-md-4 col-12">
                        <form class="search-form custom-search-form">
                            <div class="input-group">
                                <input type="text" placeholder="Search Favourites..." class="form-control">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                            </div>
                        </form>
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
                                    <li><a href="dashboard-mentee.html"><i class="fas fa-home"></i>Dashboard <span><i
                                                    class="fas fa-chevron-right"></i></span></a></li>
                                    <li><a href="bookings-mentee.html"><i class="fas fa-clock"></i>Bookings <span><i
                                                    class="fas fa-chevron-right"></i></span></a></li>
                                    <li><a href="chat-mentee.html"><i class="fas fa-comments"></i>Messages <span><i
                                                    class="fas fa-chevron-right"></i></span></a></li>
                                    <li><a href="favourites.html" class="active"><i class="fas fa-star"></i>Favourites
                                            <span><i class="fas fa-chevron-right"></i></span></a></li>
                                    <li><a href="profile-mentee.html"><i class="fas fa-user-cog"></i>Profile <span><i
                                                    class="fas fa-chevron-right"></i></span></a></li>
                                    <li><a href="login.html"><i class="fas fa-sign-out-alt"></i>Logout <span><i
                                                    class="fas fa-chevron-right"></i></span></a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-7 col-lg-8 col-xl-9">
                        <div class="row row-grid">
                            <div class="col-md-6 col-lg-4 col-xl-3">
                                <div class="profile-widget">
                                    <div class="user-avatar">
                                        <a href="profile.html">
                                            <img class="img-fluid" alt="User Image" src="assets/img/user/user.jpg">
                                        </a>
                                        <a href="javascript:void(0)" class="fav-btn">
                                            <i class="far fa-bookmark"></i>
                                        </a>
                                    </div>
                                    <div class="pro-content">
                                        <h3 class="title">
                                            <a href="profile.html">Ruby Perrin</a>
                                            <i class="fas fa-check-circle verified"></i>
                                        </h3>
                                        <p class="speciality">Digital Marketer</p>
                                        <div class="rating">
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star filled"></i>
                                            <span class="d-inline-block average-rating">(17)</span>
                                        </div>
                                        <ul class="available-info">
                                            <li>
                                                <i class="fas fa-map-marker-alt"></i> Florida, USA
                                            </li>
                                            <li>
                                                <i class="far fa-clock"></i> Available on Fri, 22 Mar
                                            </li>
                                            <li>
                                                <i class="far fa-money-bill-alt"></i> $300 - $1000 <i
                                                    class="fas fa-info-circle" data-toggle="tooltip"
                                                    title="Lorem Ipsum"></i>
                                            </li>
                                        </ul>
                                        <div class="row row-sm">
                                            <div class="col-6">
                                                <a href="profile.html" class="btn view-btn">View Profile</a>
                                            </div>
                                            <div class="col-6">
                                                <a href="booking.html" class="btn book-btn">Book Now</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        <div class="blog-pagination mt-4">
                            <nav>
                                <ul class="pagination justify-content-center">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" tabindex="-1"><i
                                                class="fas fa-angle-double-left"></i></a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">1</a>
                                    </li>
                                    <li class="page-item active">
                                        <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">3</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#"><i class="fas fa-angle-double-right"></i></a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>


       

    </div>


    <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="assets/js/jquery-3.6.0.min.js"></script>

    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
    <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

    <script src="assets/js/script.js"></script>
</body>



</html>