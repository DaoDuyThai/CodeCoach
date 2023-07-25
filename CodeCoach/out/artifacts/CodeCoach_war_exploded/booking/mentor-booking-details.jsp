<%@ page import="dal.SlotDAO" %><%--
    Document   : viewbooking
    Created on : Jun 12, 2023, 9:54:34 PM
    Author     : MrTuan
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
  <title>CodeCoach</title>

  <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.png">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.theme.default.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/aos/aos.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
  <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>


<div class="main-wrapper">

  <!-- Header is placed here -->
  <%@include file="../header.jsp" %>
  <!--End of header-->


  <div class="content">
    <div class="container-fluid">
      <div class="row">




        <div class="col-md-7 col-lg-8 col-xl-9">
          <h3 class="pb-3">Booking details</h3>

          <div class="tab-pane show active" id="mentee-list">
            <div class="card card-table">
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-hover table-center mb-0">
                    <thead>
                    <tr>
                      <th class="text-center">Date</th>
                      <th class="text-center">Slot</th>
                    </tr>
                    </thead>
                    <%request.setAttribute("daoSlot", new SlotDAO());%>
                    <tbody>
                    <c:forEach items="${requestScope.bookingDetails}" var="details">
                      <tr>
                        <td class="text-center">
                            ${details.date}
                        </td>
                        <td class="text-center">
                          ${daoSlot.getSlotbySlotId(details.slotId).startTime.substring(0, 8)} - ${daoSlot.getSlotbySlotId(details.slotId).endTime.substring(0, 8)}
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

        <a href="mentor-booking">
          <button class="btn btn-primary">
            Return to Booking list
          </button>
        </a>

      </div>
    </div>
  </div>
  <!--Footer start-->
  <%@include file="../footer.jsp" %>
  <!-- Footer end -->

</div>


<script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="../assets/js/jquery-3.6.0.min.js"></script>

<script src="../assets/js/bootstrap.bundle.min.js"></script>

<script src="../assets/js/owl.carousel.min.js"></script>

<script src="../assets/plugins/aos/aos.js"></script>

<script src="../assets/js/script.js"></script>
</body>
</html>



