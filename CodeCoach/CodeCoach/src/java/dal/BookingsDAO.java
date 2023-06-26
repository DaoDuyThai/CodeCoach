/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
                
                Mentees mentees=new Mentees();
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

    public static void main(String[] args) {
        BookingsDAO db = new BookingsDAO();
        List<Booking> arrL = db.getAllForMentorId(1);
        for (Booking booking : arrL) {
            System.out.println(booking.getBookingDetails().getBookingId());
        }
    }

}
