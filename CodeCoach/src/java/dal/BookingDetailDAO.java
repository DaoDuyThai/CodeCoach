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
        String query = "SELECT * FROM BookingDetails Where bookingId=" + bookingId + "";
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
    public List<BookingDetails> getAllBookingDetails() {
        List<BookingDetails> listBookingDetails = new ArrayList<>();
        String query = "Select * from BookingDetails";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                listBookingDetails.add(new BookingDetails(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return listBookingDetails;
    }

    public List<Integer> countBookingDetailsbyId() {
        List<Integer> listCount = new ArrayList<>();
        int bookingMax = 0;
        String query = "SELECT MAX(bookingId) FROM Booking";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                bookingMax = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        for (int i = 1; i <= bookingMax; i++) {
            String queryy = "SELECT COUNT(*) FROM BookingDetails WHERE bookingId = " + i + "";
            try {
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(queryy);
                rs = ps.executeQuery();
                while (rs.next()) {
                    listCount.add(rs.getInt(1));
                }
            } catch (Exception e) {
            }
        }

        return listCount;
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
