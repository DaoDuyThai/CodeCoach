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
import model.Mentees;
import model.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author giang
 */
public class MenteeDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private final String GET_USER_BY_MENTEE_ID = " SELECT *\n"
            + "FROM Users\n"
            + "JOIN Mentees ON Users.userId = Mentees.userId\n"
            + "WHERE Mentees.menteeId = ?";

    public Users getUserByMenteeId(int menteeId) {
        Users user = new Users();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(GET_USER_BY_MENTEE_ID);
            ps.setInt(1, menteeId);
            rs = ps.executeQuery();
            while (rs.next()) {
                //Users(String fName, String lName, String gender, String email, String phoneNum, String address, String facebook,String password)
                user = new Users(rs.getString("fName"), rs.getString("lName"), rs.getString("gender"), rs.getString("email"), rs.getString("PhoneNum"), rs.getString("address"), rs.getString("facebook"), rs.getString("password"));
            }
        } catch (Exception e) {
        }
        return user;
    }

    public String getMenteeIdbyUserId(String userId) {
        String menteeId = "";
        String query = "Select menteeId from Mentees where userId=" + userId + "";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                menteeId = rs.getString(1);
            }
        } catch (Exception e) {
        }
        return menteeId;
    }

    public List<Mentees> getAllMentee() {
        List<Mentees> listMentees = new ArrayList<>();
        String querry = "select * from Mentees";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                listMentees.add(new Mentees(rs.getInt(1), rs.getInt(2)));
            }
        } catch (Exception e) {
        }

        return listMentees;
    }

    public int getTotalMenteeNumber() {
        String query = "select count(menteeid) as Total from mentees";
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

    public int getTotalMenteeByMentorId(int mentorId) {
        String query = "select count(distinct menteeId) as Total from Booking where mentorId =" + mentorId + "";
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

    public List<Object[]> getAllMenteeInfo() {
        String query = "select m.menteeId, u.* from mentees m join users u on m.userId = u.userId";
        List<Object[]> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Object[] menteeInfo = new Object[6];
                menteeInfo[0] = rs.getInt("menteeId");
                menteeInfo[1] = rs.getInt("userId");
                menteeInfo[2] = rs.getString("email");
                menteeInfo[3] = rs.getString("fName");
                menteeInfo[4] = rs.getString("lName");
                menteeInfo[5] = rs.getString("phoneNum");

                list.add(menteeInfo);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Mentees getMenteebyUserId(int userID) {
        String query = "Select * from Mentees where menteeId = " + userID;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Mentees(rs.getInt(1), rs.getInt(2));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public Mentees getMenteeIdbyMentees(int userId) {
        String query = "Select menteeId from Mentees where userId=" + userId + "";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                 return new Mentees(rs.getInt(1), rs.getInt(2));
            }
        } catch (Exception e) {
        }
        return null;
    }

}
