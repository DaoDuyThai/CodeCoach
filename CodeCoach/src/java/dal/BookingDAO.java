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


/**
 *
 * @author giang
 */
public class BookingDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    
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
}
