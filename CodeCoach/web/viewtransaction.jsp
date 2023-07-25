<%-- 
    Document   : viewtransaction
    Created on : Jul 10, 2023, 1:55:53 PM
    Author     : Duy Thai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>View transaction</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
        <!-- Header is placed here -->
        <%@include file="header.jsp" %>
        <!--End of header-->

        <!--content start-->
        <div class="main-wrapper">


            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <h2 class="breadcrumb-title">View Transactions</h2>
                        </div>
                    </div>
                </div>
            </div>

            <div class="page-wrapper">
                <div class="content container-fluid">







                    <div class="row">
                        <!-- mentee side bar start -->
                        <%@include file="adminsidebar.jsp" %>
                        <!-- mentee side bar end -->

                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="datatable table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th class="text-center">No</th>
                                                    <th class="text-center">Mentee</th>
                                                    <th class="text-center">Mentor</th>
                                                    <th class="text-center">Total Amount</th>
                                                    <th class="text-center">Skill</th>
                                                    <!--<th class="text-center">Actions</th>-->
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%int count = 1;%>
                                                <c:forEach items="${listAcceptedTransactions}" var="lat">
                                                    <tr>
                                                        <td class="text-center" ><a href=""><%=count%></a></td>
                                                            <%count++;%>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <a href="" class="avatar avatar-sm me-2"><img
                                                                        class="avatar-img rounded-circle"
                                                                        src="assets/images/users/${lat[2]}.png" alt="User Image"></a>
                                                                <a href="">${lat[3]} ${lat[4]}</a>
                                                            </h2>
                                                        </td>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <a href="viewmentorprofile?mentorId=${lat[5]}" class="avatar avatar-sm me-2"><img
                                                                        class="avatar-img rounded-circle"
                                                                        src="assets/images/users/${lat[6]}.png" alt="User Image"></a>
                                                                <a href="viewmentorprofile?mentorId=${lat[6]}">${lat[7]} ${lat[8]}</a>
                                                            </h2>
                                                        </td>
                                                        <td class="text-center">${lat[14]}</td>
                                                        <td class="text-center">
                                                            <span class="text-center">${lat[10]}</span>
                                                        </td>
<!--                                                        <td class="text-end text-center" >
                                                            <div class="actions">
                                                                <a href="invoice-controller?booking-id=${lat[0]}&mentor-id=${lat[5]}">
                                                                    <div class="btn btn-sm bg-primary-light"><span class="fe fe-pencil fa fa-eye"></span> Details</div>
                                                                </a>
                                                               
                                                                
                                                            </div>
                                                        </td>-->
                                                    </tr>


                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        


        
        <div class="row">

            <!--Footer start-->
            <%@include file="footer.jsp" %>
            <!-- Footer end -->
        </div>


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <script src="assets/js/script.js"></script>

        <script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
    </body>
</html>
