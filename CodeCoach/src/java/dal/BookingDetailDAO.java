/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.BookingDetails;

/**
 *
 * @author giang
 */
public class BookingDetailDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public BookingDetails getBookingDetailbyBookingId(int bookingId) {
        BookingDetails bookingdetail = new BookingDetails();
        String query = "SELECT * FROM BookingDetails Where bookingId="+bookingId+"";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                bookingdetail = new BookingDetails(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4));
            }
        } catch (Exception e) {
        }
        return bookingdetail;
    }
    
    public static void main(String[] args) {
        BookingDetails bookingdetail = new BookingDetails();
        bookingdetail = new BookingDetailDAO().getBookingDetailbyBookingId(1);
        System.out.println(bookingdetail.getDate());
    }
}
