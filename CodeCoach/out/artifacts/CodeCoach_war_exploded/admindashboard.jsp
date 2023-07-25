<%-- 
    Document   : admindashboard
    Created on : Jun 19, 2023, 1:43:08 PM
    Author     : Duy Thai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Admin Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
        <script>
            window.onload = function () {
            //bar chart start
            var barChart = new CanvasJS.Chart("barChartContainer", {
            animationEnabled: true,
                    theme: "light2", // "light1", "light2", "dark1", "dark2"
                    title: {
                    text: "Monthly Booking Statistics"
                    },
                    axisY: {
                    title: "Number of bookings"
                    },
                    data: [{
                    type: "column",
                            showInLegend: true,
                            legendMarkerColor: "grey",
                            legendText: " ",
                            dataPoints: [
                            {y: ${jan}, label: "Jan"},
                            {y: ${feb}, label: "Feb"},
                            {y: ${mar}, label: "Mar"},
                            {y: ${apr}, label: "Apr"},
                            {y: ${may}, label: "May"},
                            {y: ${jun}, label: "Jun"},
                            {y: ${jul}, label: "Jul"},
                            {y: ${aug}, label: "Aug"},
                            {y: ${sep}, label: "Sep"},
                            {y: ${oct}, label: "Oct"},
                            {y: ${nov}, label: "Nov"},
                            {y: ${dec}, label: "Dec"}
                            ]
                    }]
            });
            //bar chart end

            //pie chart start
            var pieChart = new CanvasJS.Chart("pieChartContainer", {
            theme: "light2", // "light1", "light2", "dark1", "dark2"
                    exportEnabled: true,
                    animationEnabled: true,
                    title: {
                    text: "Most Loved Technology"
                    },
                    data: [{
                    type: "pie",
                            startAngle: 25,
                            toolTipContent: "<b>{label}</b>: {y}",
                            showInLegend: "true",
                            legendText: "{label}",
                            indexLabelFontSize: 16,
                            indexLabel: "{label} - {y}",
                            dataPoints: [
            <c:forEach var="lso" items="${listSkillOccurrence}">
                            {y: ${lso[1]}, label: "${lso[0]}"},
            </c:forEach>
                            ]
                    }]
            });
            //pie char end


            //axis chart start
            var axisChart = new CanvasJS.Chart("axisChartContainer", {
            theme: "light1", // "light1", "light2", "dark1"
                    animationEnabled: true,
                    exportEnabled: true,
                    title: {
                    text: "Most Booked Mentors"
                    },
                    axisX: {
                    margin: 10,
                            labelPlacement: "inside",
                            tickPlacement: "inside"
                    },
                    axisY2: {
                    title: "Booking",
                            titleFontSize: 14,
                            includeZero: true,
                            suffix: "booking"
                    },
                    data: [{
                    type: "bar",
                            axisYType: "secondary",
                            yValueFormatString: "#,###.##booked",
                            indexLabel: "{y}",
                            dataPoints: [
            <c:forEach items="${listMentorOccurence}" var="lmo">
                            {label: "${lmo[2]} ${lmo[3]}", y: ${lmo[4]}},
            </c:forEach>


                                                ]
                                        }]
                                });
                                //axis chart end

                                barChart.render();
                                pieChart.render();
                                axisChart.render();
                                }
        </script>
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
                                <h2 class="breadcrumb-title">Admin Dashboard</h2>
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
                                <!--count start-->                   

                                <div class="row">
                                    <div class="col-md-12 col-lg-3 dash-board-list blue">
                                        <a href="">
                                            <div class="dash-widget">
                                                <div class="circle-bar">
                                                    <div class="icon-col">
                                                        <i class="fas fa-users"></i>
                                                    </div>
                                                </div>
                                                <div class="dash-widget-info">
                                                    <h3>${totalMentee}</h3>
                                                    <h6>Number of Mentees</h6>
                                                </div>
                                            </div>
                                        </a>
                                    </div>

                                    <div class="col-md-12 col-lg-3 dash-board-list yellow">
                                        <a href="">
                                            <div class="dash-widget">
                                                <div class="circle-bar">
                                                    <div class="icon-col">
                                                        <i class="fas fa-user-graduate"></i>
                                                    </div>
                                                </div>
                                                <div class="dash-widget-info">
                                                    <h3>${totalMentor}</h3>
                                                    <h6>Number of Mentors</h6>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-md-12 col-lg-3 dash-board-list pink">
                                        <a href="">
                                            <div class="dash-widget">
                                                <div class="circle-bar">
                                                    <div class="icon-col">
                                                        <i class="fas fa-wallet"></i>
                                                    </div>
                                                </div>
                                                <div class="dash-widget-info">
                                                    <h3>${totalSkill}</h3>
                                                    <h6>Number of Skills</h6>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-md-12 col-lg-3 dash-board-list blue">
                                        <a href="">
                                            <div class="dash-widget">
                                                <div class="circle-bar">
                                                    <div class="icon-col">
                                                        <i class="fas fa-users"></i>
                                                    </div>
                                                </div>
                                                <div class="dash-widget-info">
                                                    <h3>${totalUsers}</h3>
                                                    <h6>Number of Users</h6>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <br/><br/>
                                <!--count end-->   

                                <div class="row">
                                    <!--bar chart start-->
                                    <div id="barChartContainer" style="height: 300px; width: 100%;"></div>
                                    <!--bar chart end-->
                                </div>

                                <br/><br/>

                                <div class="row">
                                    <!--pie chart start-->
                                    <div class="col-md-6">
                                        <div id="pieChartContainer" style="height: 300px; width: 100%;"></div>
                                    </div>
                                    <!--pie chart end-->

                                    <!--axis chart start-->
                                    <div class="col-md-6">
                                        <div id="axisChartContainer" style="height: 300px; width: 100%;"></div>
                                    </div>
                                    <!--axis chart end-->

                                </div>

                                <br/><br/>



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
