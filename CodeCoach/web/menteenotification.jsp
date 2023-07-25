<%-- 
    Document   : About Us
    Created on : May 27, 2023, 8:22:44 PM
    Author     : hoang
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Notification</title>
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
        <div class="breadcrumb-bar">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-md-12 col-12">
                        <h2 class="breadcrumb-title">Notification</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="main-wrapper">
            <div class="container-fluid">


                <div class="row">

                    

                    <div class="col-md-12 col-lg-12 col-xl-12">

                        <div class="card card-table">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover table-center mb-0">
                                        <thead>
                                            <tr>
                                                <th class="text-center">STT</th>
                                                <th class="text-center">Receive Date</th>
                                                <th class="text-center">Title</th>
                                                <th class="text-center">Status</th>
                                                <th class="text-center">ACTION</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.listN}" var="i" varStatus="idx">
                                                <tr>
                                                    <td class="text-center">
                                                        ${idx.index + 1}
                                                    </td>
                                                    <fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss" value="${i.dateTime}" var="date" />
                                                    <td class="text-center">${date}</td>
                                                    <td class="text-center">${i.content}</td>
                                                    <td class="text-center"><span class="pending">${i.status}</span></td>
                                                    <td class="text-center"><a href="ViewNotification?id=${i.bookingId}" class="btn btn-sm bg-info-light"><i class="far fa-eye"></i> View</a></td>
                                                </tr>
                                            </c:forEach>
                                            <!-- More table rows... -->
                                        </tbody>
                                    </table>
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

        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/script.js"></script>
    </body>

</html>


