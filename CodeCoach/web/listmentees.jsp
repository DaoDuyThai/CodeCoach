<%@page import="model.Mentees"%>
<%@page import="java.util.List"%>
<%@page import="dal.MenteeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>List Mentees</title>
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

            <c:if test="${users.roleId == 1}">
                <div class="breadcrumb-bar">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col-md-12 col-12">
                                <h2 class="breadcrumb-title">List of Mentees</h2>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <!-- mentee side bar start -->
                            <%@include file="adminsidebar.jsp" %>
                            <!-- mentee side bar end -->



                            <div class="col-md-7 col-lg-8 col-xl-9">
                                <div class="col-md-12 col-lg-3 dash-board-list blue">
                                    <div class="dash-widget">
                                        <div class="circle-bar">
                                            <div class="icon-col">
                                                <i class="fas fa-users"></i>
                                            </div>
                                        </div>
                                        <div class="dash-widget-info">
                                            <%int total = (int) request.getAttribute("total");%>
                                            <h3><%= total%></h3>
                                            <h6>Mentees</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">


                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="datatable table table-hover table-center mb-0">
                                                <thead>
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>Mentor Name</th>

                                                        <th>Email</th>
                                                        <th>Phone Number</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <% int counter = 1;%>
                                                    <c:forEach var="mentee" items="${listMentee}">
                                                        <tr>
                                                            <td><%= counter%></td>
                                                            <td>
                                                                <h2 class="table-avatar">
                                                                    <a href="" class="avatar avatar-sm me-2"><img
                                                                            class="avatar-img rounded-circle"
                                                                            src="assets/images/users/${mentee[1]}.png"
                                                                            alt="User Image"></a>
                                                                        ${mentee[3]} ${mentee[4]}
                                                                </h2>
                                                            </td>

                                                            <td>${mentee[2]}</td>
                                                            <td>${mentee[5]}</td>
                                                        </tr>
                                                        <% counter++;%>
                                                    </c:forEach>

                                                </tbody>

                                            </table>
                                        </div>
                                    </div>
                                    <div class="pagination justify-content-center">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <!--not admin start-->
                <c:if test="${users.roleId != 1 || empty users}">
                    <%@include file="accessdenied.jsp" %>
                </c:if>
                <!--not admin end-->

                <%@include file="footer.jsp" %>

            </div>

            <script src="assets/js/jquery-3.6.0.min.js"></script>
            <script src="assets/js/bootstrap.bundle.min.js"></script>
            <script src="assets/js/feather.min.js"></script>
            <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
            <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
            <script src="assets/plugins/datatables/datatables.min.js"></script>
            <script src="assets/js/script.js"></script>

    </body>

</html>
