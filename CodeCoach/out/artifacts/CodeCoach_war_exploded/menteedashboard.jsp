<%-- 
    Document   : menteedashboard
    Created on : Jun 19, 2023, 1:27:23 PM
    Author     : Duy Thai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Mentee Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">

        <script>
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {
                    animationEnabled: true,
                    exportEnabled: true,
                    theme: "light1", // "light1", "light2", "dark1", "dark2"
                    title: {
                        text: "Monthly Spending"
                    },
                    axisY: {
                        includeZero: true
                    },
                    data: [{
                            type: "column", //change type to bar, line, area, pie, etc
                            //indexLabel: "{y}", //Shows y value on all Data Points
                            indexLabelFontColor: "#5A5757",
                            indexLabelFontSize: 16,
                            indexLabelPlacement: "outside",
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
                chart.render();

            }
        </script>
    </head>
    <body>
        <div class="main-wrapper">
            <script type="text/javascript">
                document.addEventListener("DOMContentLoaded", function () {
                    var totalSpendingAfter = ${totalSpending};
                    totalSpendingAfter = totalSpendingAfter.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                    console.log(totalSpendingAfter);
                    document.getElementById("totalSpending").innerHTML = totalSpendingAfter;
                });
            </script>


            <!-- Header is placed here -->
            <%@include file="header.jsp" %>
            <!--End of header-->


            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <h2 class="breadcrumb-title">Mentee Dashboard</h2>
                        </div>
                    </div>
                </div>
            </div>


            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <!-- mentee side bar start -->
                        <%@include file="menteesidebar.jsp" %>
                        <!-- mentee side bar end -->

                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="row">
                                <div class="col-md-12 col-lg-3 dash-board-list blue">
                                    <div class="dash-widget" style="padding: 5px">
                                        <div class="circle-bar">
                                            <div class="icon-col">
                                                <i class="fas fa-calendar-check"></i>
                                            </div>
                                        </div>
                                        <div class="dash-widget-info">
                                            <h3>${totalAcceptedBooking}</h3>
                                            <h6>Total Bookings</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-lg-2 dash-board-list blue">
                                    <div class="dash-widget" style="padding: 5px">
                                        <div class="circle-bar">
                                            <div class="icon-col">
                                                <i class="fas fa-calendar-week"></i>
                                            </div>
                                        </div>
                                        <div class="dash-widget-info">
                                            <h3>${totalSlot}</h3>
                                            <h6>Total<br/>Slots</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-lg-3 dash-board-list yellow">
                                    <div class="dash-widget" style="padding: 5px">
                                        <div class="circle-bar">
                                            <div class="icon-col">
                                                <i class="fas fa-calendar-minus"></i>
                                            </div>
                                        </div>
                                        <div class="dash-widget-info">
                                            <h3>${totalPendingBooking}</h3>
                                            <h6>Pending Bookings</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-lg-4 dash-board-list pink">
                                    <div class="dash-widget" style="padding: 5px">
                                        <div class="circle-bar">
                                            <div class="icon-col">
                                                <i class="fas fa-wallet"></i>
                                            </div>
                                        </div>
                                        <div class="dash-widget-info">
                                            <h3 id="totalSpending"></h3>
                                            <h6>Total<br/> Spending</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <h4 class="mb-4">Monthly Spendings</h4>

                            <div class="row">
                                <!--bar chart start-->
                                <div id="chartContainer" style="height: 300px; width: 100%;"></div>
                                <!--bar chart end-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>


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
