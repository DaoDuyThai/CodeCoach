<%-- 
    Document   : viewmentorprofle
    Created on : Jun 7, 2023, 11:56:21 AM
    Author     : Duy Thai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>View Mentor Profile</title>
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
                            <h2 class="breadcrumb-title">Mentor Profile</h2>
                        </div>
                    </div>
                </div>
            </div>


            <div class="content">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-10">

                            <div class="card">
                                <div class="card-body">
                                    <div class="mentor-widget">
                                        <div class="user-info-left align-items-center">
                                            <div class="mentor-img d-flex flex-wrap justify-content-center">
                                                <div class="pro-avatar">JD</div>
                                                <div class="rating text-center">
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star"></i>
                                                </div>
                                                <div class="mentor-details m-0">
                                                    <p class="user-location m-0"><i class="fas fa-map-marker-alt"></i> Tamil
                                                        Nadu, India</p>
                                                </div>
                                            </div>
                                            <div class="user-info-cont">
                                                <h4 class="usr-name">Jonathan Doe</h4>
                                                <p class="mentor-type">English Literature (M.A)</p>
                                                <div class="mentor-action">
                                                    <p class="mentor-type social-title">Contact Me</p>
                                                    <a href="javascript:void(0)" class="btn-blue">
                                                        <i class="fas fa-comments"></i>
                                                    </a>
                                                    <a href="chat.html" class="btn-blue">
                                                        <i class="fas fa-envelope"></i>
                                                    </a>
                                                    <a href="javascript:void(0)" class="btn-blue" data-toggle="modal"
                                                       data-target="#voice_call">
                                                        <i class="fas fa-phone-alt"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="user-info-right d-flex align-items-end flex-wrap">
                                            <div class="hireme-btn text-center">
                                                <span class="hire-rate">$500 / Hour</span>
                                                <a class="blue-btn-radius" href="booking.html">Hire Me</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="card">
                                <div class="card-body custom-border-card pb-0">

                                    <div class="widget about-widget custom-about mb-0">
                                        <h4 class="widget-title">About Me</h4>
                                        <hr />
                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
                                            Ipsum has been the industry's standard dummy text ever since the 1500s, when an
                                            unknown printer took a galley of type and scrambled it to make a type specimen
                                            book. It has survived not only five centuries, but also the leap into electronic
                                            typesetting, remaining essentially unchanged.</p>
                                        <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots
                                            in a piece of classical Latin literature from 45 BC, making it over 2000 years
                                            old.</p>
                                    </div>

                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body custom-border-card pb-0">

                                    <div class="widget education-widget mb-0">
                                        <h4 class="widget-title">Personal Details</h4>
                                        <hr />
                                        <div class="experience-box">
                                            <ul class="experience-list profile-custom-list">
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Gender</span>
                                                            <div class="row-result">Male</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Date of Birth</span>
                                                            <div class="row-result">01 - 02 - 2000</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Where did you hear about us?</span>
                                                            <div class="row-result">Through web search</div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body custom-border-card pb-0">

                                    <div class="widget experience-widget mb-0">
                                        <h4 class="widget-title">Qualification</h4>
                                        <hr />
                                        <div class="experience-box">
                                            <ul class="experience-list profile-custom-list">
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Undergraduate College</span>
                                                            <div class="row-result">Coimbatore University</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Undergraduate Major</span>
                                                            <div class="row-result">Mathematics</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Graduate College</span>
                                                            <div class="row-result">Coimbatore University</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Type of Degree</span>
                                                            <div class="row-result">B.Sc (Maths)</div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body pb-1 custom-border-card">

                                    <div class="widget awards-widget m-0">
                                        <h4 class="widget-title">Location</h4>
                                        <hr />
                                        <div class="experience-box">
                                            <ul class="experience-list profile-custom-list">
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Address 1</span>
                                                            <div class="row-result">No : 5 ABC Avenue</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Address 2</span>
                                                            <div class="row-result">National highway road</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Country</span>
                                                            <div class="row-result">India</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>City</span>
                                                            <div class="row-result">Coimbatore</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>State</span>
                                                            <div class="row-result">Tamil Nadu</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Postal Code</span>
                                                            <div class="row-result">641001</div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
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

        <script src="assets/js/script.js"></script>
    </body>
</html>
