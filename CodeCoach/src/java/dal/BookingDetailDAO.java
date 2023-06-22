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
    
    public int countBookingsByYearAndMonth(int year, int month){
        String query = "select count(bookingDetailId) as Total from bookingdetails where YEAR(date) = ? and month(date) = ?";
        try {
            int total = 0;
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, year);
            ps.setInt(2, month);
            rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt("Total");
                return total;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
    
    public static void main(String[] args) {
        BookingDetailDAO dao = new BookingDetailDAO();
        System.out.println(dao.countBookingsByYearAndMonth(2023, 3));
    }
}
