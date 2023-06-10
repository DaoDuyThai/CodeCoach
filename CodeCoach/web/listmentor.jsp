<%-- 
    Document   : PrivacyPolicyTerms
    Created on : May 28, 2023, 9:22:44 AM
    Author     : kiet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Privacy Policy & Terms</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body class="account-page">
        <!-- Header is placed here -->
        <%@include file="header.jsp" %>
        <!--End of header-->
        <div class="main-wrapper">
            <div class="content">
                <h2 style="font-weight: bold; text-align: center;">Search Mentor</h2>
                <div class="account-box">              
                    <div class="login-right">
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
<input type="text" class="form-control datetimepicker" placeholder="Select Date">
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
<c:forEach items="${listM}" var="m">
<div class="card">
<div class="card-body">
<div class="mentor-widget">
<div class="user-info-left">
<div class="mentor-img">
<a href="profile.html">
<img src="assets/images/users/${m[0]}.png" class="img-fluid" alt="User Image">
</a>
</div>
<div class="user-info-cont">
<h4 class="usr-name"><a href="profile.html">${m[6]} ${m[7]}</a></h4>
<p class="mentor-type">${m[2]}</p>
<div class="mentor-details">
<p class="user-location">
    <i class="fas fa-map-marker-alt"></i> ${m[12]}  
    <br> ${m[16]} 
</p>

</div>
</div>
</div>
<div class="user-info-right">
<div class="user-infos">
<ul>
<li><i class="far fa-money-bill-alt"></i>${m[3]}<i class="fas fa-info-circle" data-bs-toggle="tooltip" title="Lorem Ipsum"></i> </li>
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
</div>






                        
                    





                    </div>
                </div>
            </div>
            <!-- end of Pre footer -->
            <%@include file="footer.jsp" %>
            <!-- footer is place here -->

            <script src="assets/js/jquery-3.6.0.min.js"></script>

            <script src="assets/js/bootstrap.bundle.min.js"></script>

            <script src="assets/js/script.js"></script>
    </body>

</html>