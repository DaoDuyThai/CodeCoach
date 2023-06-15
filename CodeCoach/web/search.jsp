<%-- 
    Document   : search
    Created on : 8 Jun 2023, 15:28:37
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

    <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

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
                    <div class="col-md-7 col-12">
                        <nav aria-label="breadcrumb" class="page-breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                            </ol>
                        </nav>
         
                    </div>
                    <div class="col-md-5 col-12 d-md-block d-none">
                        <div class="search-box">
                        <form action="search" method="post">
                          <input name="searchTxt" type="text" id="search-input" class="form-control" placeholder="Search">
                           <button type="submit" id="search-button" class="btn btn-primary">Search</button>
                        </form>
                    </div>
                        <div class="sort-by">
                            <span class="sort-title">Sort by</span>
                            <span class="sortby-fliter">
                                <select class="select">
                                    <option>Select</option>
                                    <option class="sorting">Rating</option>
                                    <option class="sorting">Popular</option>
                                    <option class="sorting">Latest</option>
                                    <option class="sorting">Free</option>
                                </select>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 col-lg-4 col-xl-3 theiaStickySidebar">

                        <div class="card search-filter">
                            <div class="card-header">
                                <h4 class="card-title mb-0">Search Filter</h4>
                            </div>
                            <div class="card-body">
                                <div class="filter-widget">
                                    <div class="cal-icon">
                                        <input type="text" class="form-control datetimepicker"
                                            placeholder="Select Date">
                                    </div>
                                </div>
                                <div class="filter-widget">
                                    <h4>Gender</h4>
                                    <div>
                                        <label class="custom_check">
                                            <input type="checkbox" name="gender_type" checked>
                                            <span class="checkmark"></span> Male
                                        </label>
                                    </div>
                                    <div>
                                        <label class="custom_check">
                                            <input type="checkbox" name="gender_type">
                                            <span class="checkmark"></span> Female
                                        </label>
                                    </div>
                                </div>
                                <div class="filter-widget">
                                    <h4>Select Courses</h4>
                                    <div>
                                        <label class="custom_check">
                                            <input type="checkbox" name="select_specialist" checked>
                                            <span class="checkmark"></span> Digital Marketer
                                        </label>
                                    </div>
                                    <div>
                                        <label class="custom_check">
                                            <input type="checkbox" name="select_specialist" checked>
                                            <span class="checkmark"></span> UNIX, Calculus, Trigonometry
                                        </label>
                                    </div>
                                    <div>
                                        <label class="custom_check">
                                            <input type="checkbox" name="select_specialist">
                                            <span class="checkmark"></span> Computer Programming
                                        </label>
                                    </div>
                                    <div>
                                        <label class="custom_check">
                                            <input type="checkbox" name="select_specialist">
                                            <span class="checkmark"></span> ASP.NET,Computer Gaming
                                        </label>
                                    </div>
                                    <div>
                                        <label class="custom_check">
                                            <input type="checkbox" name="select_specialist">
                                            <span class="checkmark"></span> HTML, Css
                                        </label>
                                    </div>
                                    <div>
                                        <label class="custom_check">
                                            <input type="checkbox" name="select_specialist">
                                            <span class="checkmark"></span> VB, VB.net
                                        </label>
                                    </div>
                                </div>
                                <div class="btn-search">
                                    <button type="button" class="btn btn-block w-100">Search</button>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-12 col-lg-8 col-xl-9">
                        <c:forEach items="${mentors}" var="mInfo">
                        <div class="card">
                            <div class="card-body">
                                <div class="mentor-widget">
                                    <div class="user-info-left">
                                        <div class="mentor-img">
                                            <a href="profile.html">
                                                <img src="assets/img/user/${mInfo[1]}.jpg" class="img-fluid" alt="User Image">
                                            </a>
                                        </div>
                                        <div class="user-info-cont">
                                            <h4 class="usr-name"><a href="profile.html">${mInfo[6]} ${mInfo[7]}</a></h4>
                                            <c:forEach var="skill" items="${mInfo}" begin="17" end="26">
                                            <span class="badge badge-primary">${skill}</span>
                                            </c:forEach>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">(17)</span>
                                            </div>
                                            <div class="mentor-details">
                                                <p class="user-location"><i class="fas fa-map-marker-alt"></i>${mInfo[15]},
                                                    ${mInfo[16]}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="user-info-right">
                                        <div class="user-infos">
                                            <ul>
                                                <li><i class="far fa-comment"></i> 17 Feedback</li>
                                                <li><i class="fas fa-map-marker-alt"></i> ${mInfo[12]}, ${mInfo[16]}</li>
                                                <li><i class="far fa-money-bill-alt"></i> ${mInfo[3]} <i
                                                        class="fas fa-info-circle" data-bs-toggle="tooltip"
                                                        title="Lorem Ipsum"></i> </li>
                                            </ul>
                                        </div>
                                        <div class="mentor-booking">
                                            <a class="apt-btn" href="booking.html">Book Appointment</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>

                   

                        <div class="load-more text-center">
                        <button class="btn btn-primary btn-sm load-more-button">Load More</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <%@include file="footer.jsp" %>


    </div>
    <script>
    $(document).ready(function () {
        var visibleItems = 3; // Number of initially visible items
        var totalItems = ${mentors.length}; // Total number of mentors
        var itemsPerPage = 3; // Number of items to load per page
        var loadMoreButton = $(".load-more-button");

        // Hide mentors beyond the initial visible items
        $(".mentor-widget:gt(" + (visibleItems - 1) + ")").hide();

        // Show/hide Load More button based on the number of mentors
        if (totalItems <= visibleItems) {
            loadMoreButton.hide();
        }

        // Load more mentors when the Load More button is clicked
        loadMoreButton.click(function () {
            var hiddenItems = $(".mentor-widget:hidden");
            var numItemsToShow = Math.min(hiddenItems.length, itemsPerPage);

            hiddenItems.slice(0, numItemsToShow).slideDown();

            // Hide Load More button if no more mentors to show
            if ($(".mentor-widget:hidden").length === 0) {
                loadMoreButton.hide();
            }
        });
    });
</script>


    <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="assets/js/jquery-3.6.0.min.js"></script>

    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
    <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

    <script src="assets/plugins/select2/js/select2.min.js"></script>

    <script src="assets/js/moment.min.js"></script>
    <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

    <script src="assets/js/script.js"></script>
</body>

</html>