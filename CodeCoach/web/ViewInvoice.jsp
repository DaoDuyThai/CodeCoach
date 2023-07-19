<%-- 
    Document   : ViewInvoice
    Created on : Jul 13, 2023, 11:56:08 AM
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
    <body>
        <%@include file="header.jsp" %>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <%@include file="menteesidebar.jsp" %>
                    <div class="col-md-7 col-lg-8 col-xl-9">
                        <div class="invoice-content">
                            <div class="invoice-item">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="invoice-logo">
                                            <img src="assets/img/logo.png" alt="logo">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="invoice-item">
                                <div class="row">
                                    <div class="col-md-6">
                                        <c:if test="${sessionScope.users.roleId != 2}">
                                            <div class="invoice-info invoice-info2">
                                                <strong class="customer-text">Mentor</strong>
                                                <p class="invoice-details">
                                                    ${requestScope.mentor.getFullName()} <br>
                                                    ${requestScope.mentor.address} <br>
                                                    ${requestScope.mentor.phoneNum} <br>
                                                </p>
                                            </div>
                                        </c:if>
                                        <c:if test="${sessionScope.users.roleId == 2}">
                                            <div class="invoice-info invoice-info2">
                                                <strong class="customer-text">Mentee</strong>
                                                <p class="invoice-details">
                                                    ${requestScope.mentor.getFullName()} <br>
                                                    ${requestScope.mentor.address} <br>
                                                    ${requestScope.mentor.phoneNum} <br>
                                                </p>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>


                            <div class="invoice-item invoice-table-wrap">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <table class="invoice-table table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>Description</th>
                                                        <th class="text-center">Number of Slot</th>
                                                        <th class="text-center">Number of Hours</th>
                                                        <th class="text-end">Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Total Amount</td>
                                                        <td class="text-center">${requestScope.totalDTO.totalSlots}</td>
                                                        <td class="text-center">${requestScope.totalDTO.totalHours}</td>
                                                        <td class="text-end">${requestScope.totalDTO.totalHours * requestScope.rate}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xl-4 ms-auto">
                                        <div class="table-responsive">
                                            <table class="invoice-table-two table">
                                                <tbody>
                                                    <tr>
                                                        <th>Total Amount:</th>
                                                        <td><span>${requestScope.totalDTO.totalHours * requestScope.rate}</span></td>
                                                    </tr>
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


        <script src="assets/js/jquery-3.6.0.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/script.js"></script>
    </body>
</html>
