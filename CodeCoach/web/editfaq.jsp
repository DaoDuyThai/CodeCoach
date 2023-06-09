<%-- 
    Document   : editfaq
    Created on : Jun 9, 2023, 3:48:00 PM
    Author     : Duy Thai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Mentoring - Invoice</title>

        <link rel="shortcut icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/feathericon.min.css">
        <link rel="stylesheet" href="assets/css/feather.css">

        <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

        <link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">

        <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>       
        <!-- Header is placed here -->
        <%@include file="header.jsp" %>
        <!--End of header-->
        <c:if test="${users.roleId != 1 || empty users }">
            <%@include file="accessdenied.jsp" %>
        </c:if>



        <!-- end of Pre footer -->
        <%@include file="footer.jsp" %>
        <!-- footer is place here -->
    </body>
</html>
