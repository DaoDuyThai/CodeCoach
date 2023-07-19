<%-- 
    Document   : Invoices
    Created on : Jul 13, 2023, 11:17:34 AM
    Author     : kienb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>List Invoice</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }

            table th, table td {
                border: 1px solid black;
                padding: 8px;
                width: calc(100% / 4);
            }
        </style>
    </head>
    <body class="chat-page">
        <%@include file="header.jsp" %>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <%@include file="menteesidebar.jsp" %>
                    <div class="col-md-7 col-lg-8 col-xl-9">
                        <div class="card card-table">
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-hover table-center mb-0">
                                        <thead>
                                            <tr>
                                                <th>Invoice No</th>
                                                <th>Mentor</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.list}" var="i" varStatus="idx">
                                                <tr>
                                                    <td>
                                                        ${idx.index + 1}
                                                    </td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="#">${i.mentor.users.getFullName()}</a>
                                                        </h2>
                                                    </td>
                                                    <td class="text-center">
                                                        <div class="table-action">
                                                            <a href="ViewInvoice?id=${i.bookingId}" class="btn btn-sm bg-info-light">
                                                                <i class="far fa-eye"></i> View
                                                            </a>
                                                        </div>
                                                    </td>
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


        <script src="assets/js/jquery-3.6.0.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/script.js"></script>
    </body>
</html>
