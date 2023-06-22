<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

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

        <!--Content start-->
        <section class="section section-search">
            <div class="container">
                <div class="banner-wrapper m-auto text-center aos" data-aos="fade-up">
                    <div class="banner-header">
                        <h1>Search Mentor in <span>CodeCoach Appointment</span></h1>
                        <p>Discover the best Mentors with your desire skills set</p>
                    </div>

                    <div class="search-box">
                        <form action="search" method="post">
                            <div class="form-group search-info">
                                <input name="searchTxt" type="text" class="form-control"
                                       placeholder="Search Skills, Categories, Mentor's name, etc">
                            </div>
                            <button type="submit" class="btn btn-primary search-btn"><i><img
                                        src="assets/img/search-submit.png" alt></i> <span>Search</span></button>
                        </form>
                    </div>

                </div>
            </div>
        </section>

        <section class="section how-it-works">
            <div class="container">
                <div class="section-header text-center aos" data-aos="fade-up">
                    <span>CodeCoach Flow</span>
                    <h2>How does it works ?</h2>
                    <p class="sub-title">Are you looking to join online institutions? Now it's very simple, Sign up with
                        CodeCoach</p>
                </div>
                <div class="row">
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="feature-box text-center aos" data-aos="fade-up">
                            <div class="feature-header">
                                <div class="feature-icon">
                                    <span class="circle"></span>
                                    <i><img src="assets/img/icon-1.png" alt></i>
                                </div>
                                <div class="feature-cont">
                                    <div class="feature-text">Sign up</div>
                                </div>
                            </div>
                            <p class="mb-0">Are you looking to join online Learning? It's very simple
                            </p>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="feature-box text-center aos" data-aos="fade-up">
                            <div class="feature-header">
                                <div class="feature-icon">
                                    <span class="circle"></span>
                                    <i><img src="assets/img/icon-2.png" alt></i>
                                </div>
                                <div class="feature-cont">
                                    <div class="feature-text">Becoming a mentor</div>
                                </div>
                            </div>
                            <p class="mb-0">Collaborate on your own timing, by register with mentor booking</p>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="feature-box text-center aos" data-aos="fade-up">
                            <div class="feature-header">
                                <div class="feature-icon">
                                    <span class="circle"></span>
                                    <i><img src="assets/img/icon-3.png" alt></i>
                                </div>
                                <div class="feature-cont">
                                    <div class="feature-text">Improve & Get Back</div>
                                </div>
                            </div>
                            <p class="mb-0">You can gather different skill set, and you can become mentor too</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="section popular-courses">
            <div class="container">
                <div class="section-header text-center aos" data-aos="fade-up">

                    <h2>Popular Mentors</h2>
                    <p class="sub-title">Do you want to move on next step? Choose your most popular leaning mentors, it
                        will help you to achieve your professional goals.</p>
                </div>

                <!-- carousel of popular mentors -->

                <div class="owl-carousel mentoring-course owl-theme">
                    <c:forEach items="${mentorInfoList}" var="mInfo">
                        <div class="course-box aos" data-aos="fade-up">
                            <div class="product">
                                <div class="product-img">
                                    <a href="viewmentorprofile?mentorId=${mInfo[0]}">
                                        <img class="img-fluid" alt src="assets/images/users/${mInfo[1]}.png" width="600"
                                             height="300">
                                    </a>
                                </div>
                                <div class="product-content">
                                    <h3 class="title"><a href="profile.html">${mInfo[6]} ${mInfo[7]}</a></h3>
                                    <div class="author-info">
                                        <div class="author-name">
                                            ${mInfo[3]} VND/Slot
                                        </div>
                                    </div>

                                    <div class="author-country">
                                        <p class="mb-0"><i class="fas fa-map-marker-alt"></i> ${mInfo[12]}, ${mInfo[15]}, ${mInfo[16]}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>


                </div>
            </div>

            <!-- end of carousel of popular mentors -->
        </section>


        <section class="section path-section">
            <div class="section-header text-center aos" data-aos="fade-up">
                <div class="container">
                    <span>Choose the</span>
                    <h2>Skills</h2>
                    <p class="sub-title"></p>
                </div>
            </div>
            <div class="learning-path-col">
                <div class="container">

                    <div id="skillslist" class="row">

                        <!-- categories/subcategories/skills -->
                        <c:forEach items="${skillList}" var="s">
                            <div class="countskills col-12 col-md-4 col-lg-3">
                                <div class="large-col aos" data-aos="fade-up">
                                    <a href="search?searchTxt=${s.skillName}" class="large-col-image">
                                        <div class="image-col-merge">
                                            <img src="assets/images/skills/${s.skillId}.png" alt>
                                            <div class="text-col">
                                                <h5>${s.skillName}</h5>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- end of categories/subcategories/skills -->

                    </div>
                    <!--this button will load more skills-->
                    <div class="view-all text-center aos" data-aos="fade-up">
                        <button onclick="loadMore()" class="btn btn-primary">Load more</button>
                    </div>
                </div>
            </div>
        </section>


        <script>
<!--        ajax use to load more skills-->
            function loadMore() {
//            get the already-have skills in the current dom
                var amount = document.getElementsByClassName("countskills").length;
                $.ajax({
                    //call to loadskills controller
                    url: "/codecoach/loadskills",
                    type: 'get',
                    //push the data to the load skill controller
                    data: {
                        exist: amount
                    },
                    //if success binding to dom
                    success: function (data) {
                        var skillslist = document.getElementById("skillslist");
                        skillslist.innerHTML += data;
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
            }
        </script>

        <!-- Pre footer -->
        <section class="section statistics-section">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-4">
                        <div class="statistics-list text-center aos" data-aos="fade-up">
                            <span>500+</span>
                            <h3>Happy Clients</h3>
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="statistics-list text-center aos" data-aos="fade-up">
                            <span>120+</span>
                            <h3>Online Appointments</h3>
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="statistics-list text-center aos" data-aos="fade-up">
                            <span>100%</span>
                            <h3>Job Satisfaction</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end of Pre footer -->

        <!--Content end-->

        <!--Footer start-->
        <%@include file="footer.jsp" %>
        <!-- Footer end -->

    </div>


    <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="assets/js/jquery-3.6.0.min.js"></script>

    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <script src="assets/js/owl.carousel.min.js"></script>

    <script src="assets/plugins/aos/aos.js"></script>

    <script src="assets/js/script.js"></script>
</body>
</html>
