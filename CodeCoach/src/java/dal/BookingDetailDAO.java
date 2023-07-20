/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import controller.booking.Book;
import model.BookingDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author giang
 */
public class BookingDetailDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public static String getCurrentDate() {
        DateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(new java.util.Date());
    }

    //10/07/2023 to 2023-07-10
    public static String formatDate(String date) {
        String[] arr = date.split("/");
        return arr[2] + "-" + arr[1] + "-" + arr[0];
    }

    private final String ADD_BOOKING_DETAIL = "INSERT INTO [dbo].[BookingDetails] (bookingId, slotId, date) VALUES (?,?,?)";

    public int addBookingDetail(BookingDetails bookingDetails) {
        try ( Connection conn = new DBContext().getConnection();  PreparedStatement ps = conn.prepareStatement(ADD_BOOKING_DETAIL)) {
            ps.setInt(1, bookingDetails.getBookingId());
            ps.setInt(2, bookingDetails.getSlotId());
            ps.setString(3, bookingDetails.getDate());
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return 0;
    }

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

    public int countBookingsByYearAndMonth(int year, int month) {
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

    public int getTotalBookingSlotByMenteeId(int menteeId) {
        String query = "  select count(bd.bookingDetailId) as Total from BookingDetails bd join Booking b on bd.bookingId = b.bookingId where b.menteeId = " + menteeId + " and status = 'Accepted'";
        try {
            int total = 0;
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
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

    public int getMonthlyMoneySpentByMenteeId(int menteeId, int year, int month) {
        String query = "select  sum(cast(m.hourlyRate as int)) as Total  from BookingDetails bd \n"
                + "   join Booking b on bd.bookingId = b.bookingId \n"
                + "   join Mentors m on m.mentorId = b.mentorId\n"
                + "   where b.menteeId = " + menteeId + " and status = 'Accepted' and YEAR(bd.date) = " + year + " and month(bd.date) = " + month + "";
        try {
            int total = 0;
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt("Total");
                return total * 2;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Object[]> getListAcceptedTransactions() {
        List<Object[]> list = new ArrayList<>();
        String query = "SELECT b.bookingId, \n"
                + "    mentees.menteeId, menteeUsers.userId AS menteeUserId, menteeUsers.fName AS menteeFName, menteeUsers.lName AS menteeLName,\n"
                + "    mentors.mentorId, mentorUsers.userId AS mentorUserId, mentorUsers.fName AS mentorFName, mentorUsers.lName AS mentorLName, mentors.hourlyRate,\n"
                + "    s.skillName AS skill,\n"
                + "    b.status,\n"
                + "    COUNT(bd.bookingDetailId) AS bookingDetailCount,\n"
                + "	mentors.hourlyRate * 2 * COUNT(bd.bookingDetailId) AS totalCost\n"
                + "FROM bookingdetails bd\n"
                + "JOIN booking b ON bd.bookingId = b.bookingId\n"
                + "JOIN mentees ON b.menteeId = mentees.menteeId\n"
                + "JOIN mentors ON b.mentorId = mentors.mentorId\n"
                + "JOIN Users menteeUsers ON mentees.userId = menteeUsers.userId\n"
                + "JOIN Users mentorUsers ON mentors.userId = mentorUsers.userId\n"
                + "JOIN Skills s ON b.skillId = s.skillId\n"
                + "where b.status = 'Accepted'\n"
                + "GROUP BY b.bookingId, mentees.menteeId, menteeUsers.userId, menteeUsers.fName, menteeUsers.lName,\n"
                + "    mentors.mentorId, mentorUsers.userId, mentorUsers.fname, mentorUsers.lName, s.skillName, b.status, mentors.hourlyRate;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            DecimalFormat formatter = new DecimalFormat("#,###");
            while (rs.next()) {
                Object[] transactionInfo = new Object[15];
                transactionInfo[0] = rs.getInt("bookingId");
                transactionInfo[1] = rs.getInt("menteeId");
                transactionInfo[2] = rs.getInt("menteeUserId");
                transactionInfo[3] = rs.getString("menteeFName");
                transactionInfo[4] = rs.getString("menteeLName");
                transactionInfo[5] = rs.getInt("mentorId");
                transactionInfo[6] = rs.getInt("mentorUserId");
                transactionInfo[7] = rs.getString("mentorFName");
                transactionInfo[8] = rs.getString("mentorLName");
                transactionInfo[9] = rs.getString("hourlyRate");
                transactionInfo[10] = rs.getString("skill");
                transactionInfo[11] = rs.getString("status");
                transactionInfo[12] = rs.getString("bookingDetailCount");
                transactionInfo[13] = rs.getInt("totalCost");
                transactionInfo[14] = formatter.format(transactionInfo[13]) + " VND";
                list.add(transactionInfo);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

    public List<BookingDetails> getBookingDetailbyMentorId(int mentorId) {
        List<BookingDetails> listBookingDetails = new ArrayList<>();
        String query = "SELECT bd.bookingdetailId, bd.bookingId, slotId,date FROM BookingDetails bd join Booking b on bd.bookingId = b.bookingId\n"
                + "WHERE b.mentorId = " + mentorId + " and b.status = 'Accepted'";
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

    private final String CHECK_BOOKING_DETAILS_EXISTED = "SELECT *\n"
            + "FROM BookingDetails\n"
            + "WHERE slotId = ?\n"
            + "  AND [date] = ?\n"
            + "  AND bookingId IN (\n"
            + "    SELECT bookingId\n"
            + "    FROM Booking\n"
            + "    WHERE mentorId = ?\n"
            + ");";

    public boolean isBookingDetailsExisted(BookingDetails bookingDetails, int mentorId) {
        try ( Connection conn = new DBContext().getConnection();  PreparedStatement ps = conn.prepareStatement(CHECK_BOOKING_DETAILS_EXISTED)) {
            ps.setInt(1, bookingDetails.getSlotId());
            ps.setString(2, bookingDetails.getDate());
            ps.setInt(3, mentorId);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return false;
    }

    public int deleteByBookingDetailsID(int bookingId) {
        String query = "delete from BookingDetails where bookingId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, bookingId);
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<BookingDetails> getBookingDetailByBookingId(int bookingId) {
        List<BookingDetails> bookingdetails = new ArrayList<>();
        String query = "SELECT * FROM BookingDetails WHERE bookingId = '" + bookingId + "';";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                bookingdetails.add(new BookingDetails(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return bookingdetails;
    }

}
