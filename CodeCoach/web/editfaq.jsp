<%-- 
    Document   : editfaq
    Created on : Jun 9, 2023, 4:08:36 PM
    Author     : Duy Thai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Edit FAQ</title>
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
                            <h2 class="breadcrumb-title">Edit FAQ</h2>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <!--Admin sidebar start-->
                        <%@include file="adminsidebar.jsp" %>
                        <!--Admin sidebar end-->
                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="row">
                                <div class="col-md-12 col-lg-2 dash-board-list pink"></div>
                                <div class="col-md-12 col-lg-8 dash-board-list blue">
                                    <div class="dash-widget">
                                        <div class="circle-bar">
                                            <div class="icon-col">
                                                <i class="fas fa-users"></i>
                                            </div>
                                        </div>
                                        <div class="dash-widget-info">
                                            <%
                                                String countFaq = (String) request.getAttribute("countFaq");
                                            %>
                                            <h3><%= countFaq%></h3>
                                            <h6>Frequent Asked Questions</h6>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12 col-lg-2 dash-board-list pink"></div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <h4 class="mb-4">Frequent Asked Questions Lists</h4>
                                    <button class="btn btn-success">Add more FAQ</button>
                                    <div class="card card-table">
                                        <div class="card-body">
                                            <div class="table-responsive">

                                                <table style="border-collapse: collapse; width: 100%;" class="table table-hover table-center">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 100px;">No.</th>
                                                            <th style="width: 100px;">Question</th>
                                                            <th style="width: 100px;">Answer</th>
                                                            <th style="width: 100px;">ACTION</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${faqList}" var="fl">
                                                            <tr>
                                                                <td style="width: 100px; white-space: pre-wrap;">${fl.id}</td>
                                                                <td style="width: 100px; white-space: pre-wrap;">${fl.question}</td>
                                                                <td style="width: 100px; white-space: pre-wrap;">${fl.answer}</td>
                                                                <td style="width: 100px;"><a><button class="btn btn-primary">Edit</button></a> <a><button class="btn btn-danger">Delete</button></a></td>
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
            </div>


            <!-- end of Pre footer -->
            <%@include file="footer.jsp" %>
            <!-- footer is place here -->

        </div>


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <script src="assets/js/script.js"></script>
    </body>
</html>
