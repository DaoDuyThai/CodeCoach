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
            <%@include file="../header.jsp" %>
            <!--End of header-->
            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Profile Settings</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Profile Settings</h2>
                        </div>
                    </div>
                </div>
            </div>


            <div class="content">
                <div class="container-fluid">
                    <div class="row">

                        <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">

                            <div class="profile-sidebar">
                                <c:forEach items="${requestScope.userInf}" var="user">
                                    <div class="user-widget">
                                        <div class="pro-avatar" >JD</div>
                                        <div class="rating">
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star"></i>
                                        </div>
                                        <div class="user-info-cont">
                                            <h4 class="usr-name">${user.getfName()} ${user.getlName()}</h4>
                                            <p class="mentor-type">${user.getAddress()}</p>
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="progress-bar-custom">
                                    <h6>Complete your profiles ></h6>
                                    <div class="pro-progress">
                                        <div class="tooltip-toggle" tabindex="0"></div>
                                        <div class="tooltip">80%</div>
                                    </div>
                                </div>
                                <div class="custom-sidebar-nav">
                                    <ul>
                                        <li><a href="dashboard.html"><i class="fas fa-home"></i>Dashboard <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="bookings.html"><i class="fas fa-clock"></i>Bookings <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="schedule-timings.html"><i class="fas fa-hourglass-start"></i>Schedule Timings <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="chat.html"><i class="fas fa-comments"></i>Messages <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="profile.html"><i class="fas fa-user-cog"></i>Profile <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="login.html"><i class="fas fa-sign-out-alt"></i>Logout <span><i class="fas fa-chevron-right"></i></span></a></li>
                                    </ul>
                                </div>
                            </div>

                        </div>

                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="card">
                                <div class="card-body">
                                    <form action="profilesetting-mentee" method="POST" enctype="multipart/form-data">
                                        <c:forEach items="${requestScope.userInf}" var="us">
                                            <div class="row form-row">
                                                <div class="col-12 col-md-12">
                                                    <div class="form-group">
                                                        <div class="change-avatar">
                                                            <div class="profile-img">
                                                                <img id="selected-image" src="${us.getAvatar()== null ? "https://res.cloudinary.com/ddrjnfihc/image/upload/v1667138651/Home/images/UserProfile/default.jpg" : us.getAvatar()}" alt="User Image">
                                                            </div>
                                                            <div class="upload-img">
                                                                <div class="change-photo-btn">
                                                                    <span><i class="fa fa-upload"></i> Upload Photo</span>
                                                                    <input type="file" id="file" class="upload" id="file" name="image" accept="image/png,image/jpeg" multiple="multiple" onchange="displaySelectedImage(event)">
                                                                </div>
                                                                <small class="form-text text-muted">Allowed JPG, GIF or PNG. Max size of 2MB</small>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <div class="form-group">
                                                        <label>First Name</label>
                                                        <input type="text" id="fname" name="fname" class="form-control" value="${us.fName}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <div class="form-group">
                                                        <label>Last Name</label>
                                                        <input type="text" id="lname" name="lname" class="form-control" value="${us.lName}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <div class="form-group">
                                                        <label>Email ID</label>
                                                        <input disabled type="email" name="email" class="form-control" value="${us.email}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <div class="form-group">
                                                        <label>Mobile</label>
                                                        <input type="text" id="phone" name="phone" value="${us.phoneNum}" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label>Address</label>
                                                        <input type="text" id="address" name="address" class="form-control" value="${us.address}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <div class="form-group">
                                                        <label>City</label>
                                                        <select class="form-select" name="" id="cityList" onchange="changeCity()">
                                                            <option value="" selected="">${us.getTinhthanhpho().name}</option>
                                                            <c:forEach items="${requestScope.listCity}" var="i">
                                                                <option value="${i.mattp}">${i.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <div class="form-group">
                                                        <label class="form-control-label">District</label>
                                                        <select class="form-select" name="district" id="district" >
                                                            <option value="" selected="">${us.getQuanhuyen().name}</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <div class="submit-section">
                                            <button type="submit" class="btn btn-primary submit-btn">Save Changes</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--Footer start-->
            <%@include file="../footer.jsp" %>
            <!-- Footer end -->

        </div>
        <script>
            function displaySelectedImage(event) {
                var selectedFile = event.target.files[0];
                var reader = new FileReader();

                reader.onload = function (event) {
                    var imgElement = document.getElementById("selected-image");
                    imgElement.src = event.target.result;
                };

                reader.readAsDataURL(selectedFile);
            }
            function changeCity() {
                $.ajax({
                    type: 'POST',
                    data: {
                        id: $('#cityList').val()
                    },
                    url: '${pageContext.request.contextPath}/chooseDistrict',
                    success: function (data, textStatus, jqXHR) {
                        if ($('#cityList').val() !== '') {
                            $('#district').css("display", "inline");
                        } else {
                            $('#district').css("display", "none");
                        }
                        $('#district').html(data)
                    }
                }
                )
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
