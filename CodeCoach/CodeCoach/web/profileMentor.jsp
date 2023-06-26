<%-- 
    Document   : viewbooking
    Created on : Jun 12, 2023, 9:54:34 PM
    Author     : MrTuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>CodeCoach</title>

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">

        <link rel="stylesheet" href="assets/plugins/aos/aos.css">

        <link rel="stylesheet" href="assets/css/style.css">
        <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
                                    <li class="breadcrumb-item active" aria-current="page">Mentor Profile</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Mentor Profile</h2>
                        </div>
                    </div>
                </div>
            </div>


            <div class="content">
                <div class="container">
                    <div class="row justify-content-center">
                        <c:set var="minf" value="${requestScope.infoMentor}" />

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
                                                    <p class="user-location m-0"><i class="fas fa-map-marker-alt"></i> ${minf.getUsers().getAddress()}</p>
                                                </div>
                                            </div>
                                            <div class="user-info-cont">
                                                <h4 class="usr-name">${minf.getUsers().getfName()} ${minf.getUsers().getlName()}</h4>
                                                <p class="mentor-type">English Literature (M.A)</p>
                                                <div class="mentor-action">
                                                    <p class="mentor-type social-title">Contact Me</p>
                                                    <a href="javascript:void(0)" class="btn-blue">
                                                        <i class="fas fa-comments"></i>
                                                    </a>
                                                    <a href="chat.html" class="btn-blue">
                                                        <i class="fas fa-envelope"></i>
                                                    </a>
                                                    <a href="javascript:void(0)" class="btn-blue" data-toggle="modal" data-target="#voice_call">
                                                        <i class="fas fa-phone-alt"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="user-info-right d-flex align-items-end flex-wrap">
                                            <div class="hireme-btn text-center">
                                                <span class="hire-rate">${minf.getHourlyRate()}đ / Hour</span>
                                                <a class="blue-btn-radius" onclick="HireMe(${minf.getUserId()})">Hire Me</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="card">
                                <div class="card-body custom-border-card pb-0">

                                    <div class="widget about-widget custom-about mb-0">
                                        <h4 class="widget-title">About Me</h4>
                                        <hr/>
                                        <p>${minf.getBio()}</p>
                                    </div>

                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body custom-border-card pb-0">

                                    <div class="widget education-widget mb-0">
                                        <h4 class="widget-title">Personal Details</h4>
                                        <hr/>
                                        <div class="experience-box">
                                            <ul class="experience-list profile-custom-list">
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Gender</span>
                                                            <div class="row-result">${minf.getUsers().getGender()}</div>
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
                                                <!--                                                    <li>
                                                                                                        <div class="experience-content">
                                                                                                            <div class="timeline-content">
                                                                                                                <span>Where did you hear about us?</span>
                                                                                                                <div class="row-result">Through web search</div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </li>-->
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!--                                <div class="card">
                                                                <div class="card-body custom-border-card pb-0">
                            
                                                                    <div class="widget experience-widget mb-0">
                                                                        <h4 class="widget-title">Qualification</h4>
                                                                        <hr/>
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
                                                            </div>-->
                            <div class="card">
                                <div class="card-body pb-1 custom-border-card">

                                    <div class="widget awards-widget m-0">
                                        <h4 class="widget-title">Location</h4>
                                        <hr/>
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
            <!--Footer start-->
            <%@include file="footer.jsp" %>
            <!-- Footer end -->

        </div>
        <script>
            function HireMe(userId) {
                window.location.href = "/codecoach/hire?mentorId=" + userId;
            }
        </script>


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/owl.carousel.min.js"></script>

        <script src="assets/plugins/aos/aos.js"></script>

        <script src="assets/js/script.js"></script>
    </body>
</html>
