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
        </script>
    </head>
    <body>
        <div class="main-wrapper">
            <script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
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
                            <div class="row">
                                <div class="col-md-12">
                                    <h4 class="mb-4">Mentee Lists</h4>
                                    <div class="card card-table">
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table table-hover table-center mb-0">
                                                    <thead>
                                                        <tr>
                                                            <th>BASIC INFO</th>
                                                            <th>CREATED DATE</th>
                                                            <th class="text-center">TAGS</th>
                                                            <th class="text-center">ACTION</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <h2 class="table-avatar">
                                                                    <a href="profile.html"
                                                                       class="avatar avatar-sm me-2"><img
                                                                            class="avatar-img rounded-circle"
                                                                            src="assets/img/user/user2.jpg"
                                                                            alt="User Image"></a>
                                                                    <a href="profile.html">Tyrone Roberts<span><span
                                                                                class="__cf_email__"
                                                                                data-cfemail="ec98959e8382899e838e899e989fac8d88838e89c28f8381">[email&#160;protected]</span></span></a>
                                                                </h2>
                                                            </td>
                                                            <td>08 April 2020</td>
                                                            <td class="text-center"><span class="pending">PENDING</span>
                                                            </td>
                                                            <td class="text-center"><a href="profile.html"
                                                                                       class="btn btn-sm bg-info-light"><i
                                                                        class="far fa-eye"></i> View</a></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <h2 class="table-avatar">
                                                                    <a href="profile.html"
                                                                       class="avatar avatar-sm me-2"><img
                                                                            class="avatar-img rounded-circle"
                                                                            src="assets/img/user/user1.jpg"
                                                                            alt="User Image"></a>
                                                                    <a href="profile.html">Julie Pennington <span><span
                                                                                class="__cf_email__"
                                                                                data-cfemail="761c031a1f133617121914135815191b">[email&#160;protected]</span></span></a>
                                                                </h2>
                                                            </td>
                                                            <td>08 April 2020</td>
                                                            <td class="text-center"><span class="pending">PENDING</span>
                                                            </td>
                                                            <td class="text-center"><a href="profile.html"
                                                                                       class="btn btn-sm bg-info-light"><i
                                                                        class="far fa-eye"></i> View</a></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <h2 class="table-avatar">
                                                                    <a href="profile.html"
                                                                       class="avatar avatar-sm me-2"><img
                                                                            class="avatar-img rounded-circle"
                                                                            src="assets/img/user/user3.jpg"
                                                                            alt="User Image"></a>
                                                                    <a href="profile.html">Allen Davis <span><span
                                                                                class="__cf_email__"
                                                                                data-cfemail="cfaea3a3aaa1abaeb9a6bc8faeaba0adaae1aca0a2">[email&#160;protected]</span></span></a>
                                                                </h2>
                                                            </td>
                                                            <td>08 April 2020</td>
                                                            <td class="text-center"><span class="pending">PENDING</span>
                                                            </td>
                                                            <td class="text-center"><a href="profile.html"
                                                                                       class="btn btn-sm bg-info-light"><i
                                                                        class="far fa-eye"></i> View</a></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <h2 class="table-avatar">
                                                                    <a href="profile.html"
                                                                       class="avatar avatar-sm me-2"><img
                                                                            class="avatar-img rounded-circle"
                                                                            src="assets/img/user/user4.jpg"
                                                                            alt="User Image"></a>
                                                                    <a href="profile.html">Patricia Manzi <span><span
                                                                                class="__cf_email__"
                                                                                data-cfemail="1161706563787278707c707f6b785170757e73743f727e7c">[email&#160;protected]</span></span></a>
                                                                </h2>
                                                            </td>
                                                            <td>08 April 2020</td>
                                                            <td class="text-center"><span class="accept">ACCEPTED</span>
                                                            </td>
                                                            <td class="text-center"><a href="profile.html"
                                                                                       class="btn btn-sm bg-info-light"><i
                                                                        class="far fa-eye"></i> View</a></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <h2 class="table-avatar">
                                                                    <a href="profile.html"
                                                                       class="avatar avatar-sm me-2"><img
                                                                            class="avatar-img rounded-circle"
                                                                            src="assets/img/user/user5.jpg"
                                                                            alt="User Image"></a>
                                                                    <a href="profile.html">Olive Lawrence <span><span
                                                                                class="__cf_email__"
                                                                                data-cfemail="c9a6a5a0bfaca5a8bebbaca7aaac89a8ada6abace7aaa6a4">[email&#160;protected]</span></span></a>
                                                                </h2>
                                                            </td>
                                                            <td>08 April 2020</td>
                                                            <td class="text-center"><span class="accept">ACCEPTED</span>
                                                            </td>
                                                            <td class="text-center"><a href="profile.html"
                                                                                       class="btn btn-sm bg-info-light"><i
                                                                        class="far fa-eye"></i> View</a></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <h2 class="table-avatar">
                                                                    <a href="profile.html"
                                                                       class="avatar avatar-sm me-2"><img
                                                                            class="avatar-img rounded-circle"
                                                                            src="assets/img/user/user6.jpg"
                                                                            alt="User Image"></a>
                                                                    <a href="profile.html">Frances Foster <span><span
                                                                                class="__cf_email__"
                                                                                data-cfemail="610713000f0204122100050e03044f020e0c">[email&#160;protected]</span></span></a>
                                                                </h2>
                                                            </td>
                                                            <td>08 April 2020</td>
                                                            <td class="text-center"><span class="accept">ACCEPTED</span>
                                                            </td>
                                                            <td class="text-center"><a href="profile.html"
                                                                                       class="btn btn-sm bg-info-light"><i
                                                                        class="far fa-eye"></i> View</a></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <h2 class="table-avatar">
                                                                    <a href="profile.html"
                                                                       class="avatar avatar-sm me-2"><img
                                                                            class="avatar-img rounded-circle"
                                                                            src="assets/img/user/user7.jpg"
                                                                            alt="User Image"></a>
                                                                    <a href="profile.html">Deloris Briscoe <span><span
                                                                                class="__cf_email__"
                                                                                data-cfemail="254140494a574c5647574c56464a406544414a47400b464a48">[email&#160;protected]</span></span></a>
                                                                </h2>
                                                            </td>
                                                            <td>08 April 2020</td>
                                                            <td class="text-center"><span class="reject">REJECTED</span>
                                                            </td>
                                                            <td class="text-center"><a href="profile.html"
                                                                                       class="btn btn-sm bg-info-light"><i
                                                                        class="far fa-eye"></i> View</a></td>
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
    </body>
</html>
