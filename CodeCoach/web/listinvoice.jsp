<%@page import="model.BookingDetails"%>
<%@page import="model.Mentees"%>
<%@page import="model.Mentors"%>
<%@page import="model.Booking"%>
<%@page import="model.Users"%>
<%@page import="java.util.List"%>
<%@page import="model.ChatRoom"%>
<%@page import="model.ChatMessages"%>

<!DOCTYPE html>
<html lang="en">
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
        <!-- Header is placed here -->
        <%@include file="header.jsp" %>
        <!--End of header-->
       
        <div class="account-box">              
            <div class="login-right">
                <div class="accordion" id="accordionExample">
                    
                    <c:forEach items="${bookings}" var="b">
                     
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="heading${b.getBookingId()}">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${b.getBookingId()}" aria-expanded="false" aria-controls="collapse${b.getBookingId()}">                                 
                                    <table>
                                        <tr>
                                            <td>
                                                <c:forEach items="${mentors}" var="mentor">
                                                    <c:if test="${mentor.getMentorId()==b.getMentorId()}">
                                                        <c:set var="userIdMentor" value="${mentor.getUserId()}"/>                                                 
                                                    </c:if>                                                   
                                                </c:forEach>
                                                <c:forEach items="${listusers}" var="listusers">
                                                    <c:if test="${listusers.getUserId()==userIdMentor}">
                                                        <p>${listusers.getfName()} ${listusers.getlName()}</p>                                                     
                                                    </c:if>                                                   
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <c:forEach items="${mentees}" var="mentee">
                                                    <c:if test="${mentee.getMenteeId()==b.getMenteeId()}">
                                                        <c:set var="userIdMentee" value="${mentee.getUserId()}"></c:set>                                                     
                                                    </c:if>                                                   
                                                </c:forEach>
                                                <c:forEach items="${listusers}" var="listusers">
                                                    <c:if test="${listusers.getUserId()==userIdMentee}">
                                                        <p>${listusers.getfName()} ${listusers.getlName()}</p>                                                     
                                                    </c:if>                                                   
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <c:forEach items="${skills}" var="skill">
                                                    <c:if test="${skill.getSkillId()==b.getSkillId()}">
                                                        <p>${skill.getSkillName()}</p>                                                
                                                    </c:if>                                                   
                                                </c:forEach>
                                            </td>
                                            <td>                                                
                                                 <%List<BookingDetails> li = (List<BookingDetails>) request.getAttribute("bookingDetails");
                                                 for (int i=0;i<li.size();i++) {
                                                 %><p><%out.print(li.get(i).getBookingDetailId());%></p><%
                                                     }
                                                 %>
                                                 
                                                 
                                                 
                                                
                                            </td>
                                        </tr>
                                    </table>
                                </button>
                            </h2>
                            <div id="collapse${b.getBookingId()}" class="accordion-collapse collapse" aria-labelledby="heading${b.getBookingId()}" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <c:forEach items="bookingDetails" var="bookingDetails">
                                        
                                    </c:forEach>
                                </div>
                            </div>
                        </div>  
                    </c:forEach>                                                 
                </div>
            </div>
        </div>


        <script src="assets/js/jquery-3.6.0.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/script.js"></script>
        <%@include file="footer.jsp" %>
    </body>
</html>
