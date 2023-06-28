<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.Users" %>
<%@ page import="dal.TinhThanhPhoDAO" %>
<%@ page import="java.nio.charset.StandardCharsets" %>

<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from mentoring.dreamguystech.com/html/template/booking.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:33:02 GMT -->

<head>
  <meta charset="utf-8">
  <title>Mentoring</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

  <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
  <style>
    .tinhthanhpho{
      font-family: "Poppins", Arial, sans-serif;
    }
  </style>
</head>

<body>

<div class="main-wrapper">

  <!-- Header is placed here -->
  <%@include file="../header.jsp" %>
  <!--End of header-->

  <div class="breadcrumb-bar">
    <div class="container-fluid">
      <div class="row align-items-center">
        <div class="col-md-12 col-12">
          <nav aria-label="breadcrumb" class="page-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Booking</li>
            </ol>
          </nav>
          <h2 class="breadcrumb-title">Booking</h2>
        </div>
      </div>
    </div>
  </div>

  <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="currentDate" />
  <fmt:formatDate value="${now}" pattern="EEEE" var="dayOfWeek" />


  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-body">
              <div class="booking-user-info">
                <a href="profile.html" class="booking-user-img">
                  <img src="assets/img/user/user2.jpg" alt="User Image">
                </a>
                <div class="booking-info">
                  <h4><a href="profile.html">${users.lName} ${users.fName}</a></h4>
                  <p class="text-muted mb-0"><i class="fas fa-map-marker-alt"></i><%=new TinhThanhPhoDAO().getTTPNameAndQHName(((Users) session.getAttribute("users")).getUserId())%>

                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-sm-4 col-md-6">
              <h4 class="mb-1">${currentDate}</h4>
              <p class="text-muted">${dayOfWeek}</p>
            </div>
            <div class="col-12 col-sm-8 col-md-6 text-sm-end">
              <select name="select-range" id="select-range">
                <option value="today">This week</option>
                <option value="week">Next Week</option>
                <option value="month">Next of next week</option>
              </select>
            </div>
          </div>

          <div class="card booking-schedule schedule-widget">

            <div class="schedule-header">
              <div class="row">
                <div class="col-md-12">

                  <div class="day-slot">
                    <div id="slotContainer">
                      <ul>
                        <li class="left-arrow">
                          <a href>
                            <i class="fa fa-chevron-left"></i>
                          </a>
                        </li>
                        <li>
                          <span>Mon</span>
                          <span class="slot-date-mon"><small
                                  class="slot-year"></small></span>
                        </li>
                        <li>
                          <span>Tue</span>
                          <span class="slot-date-tue"> <small
                                  class="slot-year"></small></span>
                        </li>
                        <li>
                          <span>Wed</span>
                          <span class="slot-date-wed"><small
                                  class="slot-year"></small></span>
                        </li>
                        <li>
                          <span>Thu</span>
                          <span class="slot-date-thu"><small
                                  class="slot-year"></small></span>
                        </li>
                        <li>
                          <span>Fri</span>
                          <span class="slot-date-fri"><small
                                  class="slot-year"></small></span>
                        </li>
                        <li>
                          <span>Sat</span>
                          <span class="slot-date-sat"><small
                                  class="slot-year"></small></span>
                        </li>
                        <li>
                          <span>Sun</span>
                          <span class="slot-date-sun"><small
                                  class="slot-year"></small></span>
                        </li>
                        <li class="right-arrow">
                          <a href>
                            <i class="fa fa-chevron-right"></i>
                          </a>
                        </li>
                      </ul>
                    </div>
                  </div>

                </div>
              </div>
            </div>


            <div class="schedule-cont">
              <div class="row">
                <div class="col-md-12">

                  <div class="time-slot">
                    <ul class="clearfix">
                      <li>
                        <a class="timing" href="#">
                          <span>9:00</span> <span>AM</span>
                        </a>
                        <a class="timing" href="#">
                          <span>10:00</span> <span>AM</span>
                        </a>
                        <a class="timing" href="#">
                          <span>11:00</span> <span>AM</span>
                        </a>
                      </li>
                      <li>
                        <a class="timing" href="#">
                          <span>9:00</span> <span>AM</span>
                        </a>
                        <a class="timing" href="#">
                          <span>10:00</span> <span>AM</span>
                        </a>
                        <a class="timing" href="#">
                          <span>11:00</span> <span>AM</span>
                        </a>
                      </li>
                      <li>
                        <a class="timing" href="#">
                          <span>9:00</span> <span>AM</span>
                        </a>
                        <a class="timing" href="#">
                          <span>10:00</span> <span>AM</span>
                        </a>
                        <a class="timing" href="#">
                          <span>11:00</span> <span>AM</span>
                        </a>
                      </li>
                      <li>
                        <a class="timing" href="#">
                          <span>9:00</span> <span>AM</span>
                        </a>
                        <a class="timing" href="#">
                          <span>10:00</span> <span>AM</span>
                        </a>
                        <a class="timing" href="#">
                          <span>11:00</span> <span>AM</span>
                        </a>
                      </li>
                      <li>
                        <a class="timing" href="#">
                          <span>9:00</span> <span>AM</span>
                        </a>
                        <a class="timing selected" href="#">
                          <span>10:00</span> <span>AM</span>
                        </a>
                        <a class="timing" href="#">
                          <span>11:00</span> <span>AM</span>
                        </a>
                      </li>
                      <li>
                        <a class="timing" href="#">
                          <span>9:00</span> <span>AM</span>
                        </a>
                        <a class="timing" href="#">
                          <span>10:00</span> <span>AM</span>
                        </a>
                        <a class="timing" href="#">
                          <span>11:00</span> <span>AM</span>
                        </a>
                      </li>
                      <li>
                        <a class="timing" href="#">
                          <span>9:00</span> <span>AM</span>
                        </a>
                        <a class="timing" href="#">
                          <span>10:00</span> <span>AM</span>
                        </a>
                        <a class="timing" href="#">
                          <span>11:00</span> <span>AM</span>
                        </a>
                      </li>
                    </ul>
                  </div>

                </div>
              </div>
            </div>

          </div>


          <div class="submit-section proceed-btn text-end">
            <a href="checkout.html" class="btn btn-primary submit-btn">Proceed to Pay</a>
          </div>

        </div>
      </div>
    </div>
  </div>



  <!--Footer start-->
  <%@include file="../footer.jsp" %>
  <!-- Footer end -->

</div>


<script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

<script>
  $(document).ready(function () {
    // Get the current date
    var currentDate = new Date();
    var currentDay = currentDate.getDay();
    var difference = currentDay - 1;

    currentDate.setDate(currentDate.getDate() - difference);


    // Listen for changes in the select box
    selectBox.addEventListener("change", function () {
      // Get the selected option value
      var selectedOption = selectBox.value;

      // Update the slot date and slot year based on the selected option
      for (var i = 0; i < slotDateElements.length; i++) {
        var slotDate = currentDate.getDate();
        var slotYear = currentDate.getFullYear();
        if (selectedOption === "week") {
          var nextWeekDate = new Date(currentDate.getTime() + 7 * 24 * 60 * 60 * 1000);
          slotDate = nextWeekDate.getDate();
          slotYear = nextWeekDate.getFullYear();
        } else if (selectedOption === "month") {
          var nextMonthDate = new Date(currentDate.getTime() + 30 * 24 * 60 * 60 * 1000);
          slotDate = nextMonthDate.getDate();
          slotYear = nextMonthDate.getFullYear();
        }
        slotDateElements[i].textContent = slotDate;
        slotYearElements[i].textContent = slotYear;
      }
    });
  });

</script>


</body>

<!-- Mirrored from mentoring.dreamguystech.com/html/template/booking.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:33:03 GMT -->

</html>
