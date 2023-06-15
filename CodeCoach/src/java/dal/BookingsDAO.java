/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Booking;
import model.BookingDetails;
import model.Mentees;
import model.Slot;
import model.Users;

/**
 *
 * @author MrTuan
 */
public class BookingsDAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Booking> getAllForMentorId(int mentorId) {
        List<Booking> list = new ArrayList<>();
        String query = "SELECT * FROM Booking b \n"
                + "INNER JOIN Mentees mte\n"
                + "ON b.menteeId=mte.menteeId\n"
                + "INNER JOIN Users u \n"
                + "ON mte.userId=u.userId\n"
                + "INNER JOIN BookingDetails bd \n"
                + "ON b.bookingId = bd.bookingId INNER JOIN Slot s\n"
                + "ON bd.slotId=s.slotId\n"
                + "WHERE b.mentorId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, mentorId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("bookingId"));
                booking.setMentorId(rs.getInt("mentorId"));
                booking.setMenteeId(rs.getInt("menteeId"));
                booking.setSkillId(rs.getInt("skillId"));
                booking.setStatus(rs.getString("status"));

                Mentees mentees = new Mentees();
                mentees.setUserId(rs.getInt("userId"));

                Users users = new Users();
                users.setfName(rs.getString("fName"));
                users.setlName(rs.getString("lName"));

                BookingDetails bookingDetails = new BookingDetails();
                bookingDetails.setBookingDetailId(rs.getInt("bookingDetailId"));
                bookingDetails.setBookingId(rs.getInt("bookingId"));
                bookingDetails.setDate(rs.getString("date"));
                bookingDetails.setSlotId(rs.getInt("slotId"));

                Slot slot = new Slot();
                slot.setSlotId(rs.getInt("slotId"));
                slot.setStartTime(rs.getString("startTime"));
                slot.setEndTime(rs.getString("endTime"));

                booking.setUsers(users);
                booking.setMentees(mentees);
                booking.setBookingDetails(bookingDetails);
                booking.setSlot(slot);
                list.add(booking);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Booking> getAll() {
        List<Booking> list = new ArrayList<>();
        String query = "Select * from mentors";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Booking(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public boolean insert(Booking booking, BookingDetails bookingDetails) {
    String sql = "INSERT INTO Booking (menteeId, mentorId, skillId, [status]) VALUES (?, ?, ?, ?)";
    try {
        PreparedStatement st = getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        st.setInt(1, booking.getMenteeId());
        st.setInt(2, booking.getMentorId());
        st.setInt(3, booking.getSkillId());
        st.setString(4, booking.getStatus());
        st.executeUpdate();

        ResultSet generatedKeys = st.getGeneratedKeys();
        if (generatedKeys.next()) {
            int bookingId = generatedKeys.getInt(1);
            booking.setBookingId(bookingId);

            // Thực hiện insert BookingDetails
            String sql2 = "INSERT INTO BookingDetails (bookingId, slotId, [date]) VALUES (?, ?, ?)";
            try {
                PreparedStatement st1 = getConnection().prepareStatement(sql2);
                st1.setInt(1, bookingId);
                st1.setInt(2, bookingDetails.getSlotId());
                st1.setString(3, bookingDetails.getDate());
                st1.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return true;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

    public static void main(String[] args) {
        BookingsDAO db = new BookingsDAO();
        boolean bk = db.insert(new Booking(1, 1, 1, "Pending"),new BookingDetails( 2, "2023-06-18"));
        System.out.println(bk);

    }

}
