/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


/**
 *
 * @author giang
 */
public class BookingDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private final String GET_BOOKING_BY_MENTOR_ID = "SELECT * FROM [dbo].[Booking] WHERE mentorId = ?";


    public ArrayList<Booking> getBookingMentorId(int mentorId) {
        ArrayList<Booking> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(GET_BOOKING_BY_MENTOR_ID);
            ps.setInt(1, mentorId);
            rs = ps.executeQuery();
            while (rs.next()) {
                //Booking(int bookingId, int mentorId, int menteeId, int skillId, String status, boolean getAllInfo)
                list.add(new Booking(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5), true));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
     public Booking getBookingLatestbyMenteeId(String menteeId) {
        Booking b = new Booking();
        String querry = "SELECT * FROM [dbo].[Booking] WHERE menteeId = "+menteeId+" AND bookingId = (SELECT MAX(bookingId) FROM [dbo].[Booking] WHERE menteeId = "+menteeId+");";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                b = new Booking(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5));
            }
        } catch (Exception e) {
        }
        return b;
    }

    public void updateBookingStatus(int bookingId, String status) {
        String querry = "UPDATE [dbo].[Booking] SET status = ? WHERE bookingId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            ps.setString(1, status);
            ps.setInt(2, bookingId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        //test updateBookingStatus
        new BookingDAO().updateBookingStatus(1, "Pending");
    }
}
