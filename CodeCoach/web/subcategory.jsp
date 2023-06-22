<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Sub Category</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <script src="assets/js/jquery-3.6.0.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/script.js"></script>
    </head>
    <body class="account-page">
        <!-- Header is placed here -->
        <%@include file="header.jsp" %>
        <!-- End of header -->

        <div class="main-wrapper">
            <div class="content">
                <h2 style="font-weight: bold; text-align: center;">Sub Category</h2>
                <div class="account-box">              
                    <div class="login-right">
                        <div class="content">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-12 col-lg-8 col-xl-9">
                                        <c:forEach items="${listS}" var="s">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="mentor-widget">
                                                        <div class="user-info-left">

                                                            <div class="user-info-cont">
                                                                <h4 class="usr-name">
                                                                <a>${s.subCategoryName}</a></h4>
                                                                
         
                                                            </div>
                                                        </div>
                                                        <div class="user-info-right">
     
                                                            <div class="mentor-booking">
                                                                <a class="apt-btn" href="subcategorydetail?subCategoryId=${s.subCategoryId}">More Details</a>
                                                                
                                                            </div>
                                                        </div>
                                                                
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        
               <c:forEach items="${listsk}" var="skill">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="mentor-widget">
                                                        <div class="user-info-left">
                                                            <div class="mentor-img">
                                                                <a href="profile.html">
                                                                    <img src="assets/images/skills/${skill.skillId}.png" class="img-fluid" alt="Skill Image">
                                                                </a>
                                                            </div>
                                                            <div class="user-info-cont">
                                                                <h4 class="usr-name"><a href="profile.html">   ${skill.skillName}</a></h4>
                                                                                                             
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
                    </div>
                </div>
            </div>
        </div>

        <!-- End of Pre footer -->
        <%@include file="footer.jsp" %>
        <!-- End of footer -->
    </body>
</html>