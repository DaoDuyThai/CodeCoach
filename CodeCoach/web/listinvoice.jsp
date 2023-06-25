<html>
<head>
    <title>Mentor Stats</title>
</head>
<body>
    <h1>Mentor Stats</h1>
    <table>
        <tr>
            <th>Mentor Name</th>
            <th>Mentee Name</th>
            <th>Skill</th>
            <th>Total Price</th>
        </tr>
        <c:forEach items="${bookings}" var="booking">
            <tr>
                <td>${booking.mentorName}</td>
                <td>${booking.menteeName}</td>
                <td>${booking.skill}</td>
                <td>
                    <a href="/mentor/${booking.mentorId}/booking/${booking.bookingId}/details">
                        ${booking.totalPrice}
                    </a>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <table>
                        <tr>
                            <th>Slot</th>
                            <th>Date</th>
                        </tr>
                        <c:forEach items="${booking.bookingDetails}" var="bookingDetail">
                            <tr>
                                <td>${bookingDetail.slot}</td>
                                <td>${bookingDetail.date}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>