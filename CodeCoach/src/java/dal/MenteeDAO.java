/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

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

    private final String GET_USER_BY_MENTEE_ID = " SELECT *\n" +
            "FROM Users\n" +
            "JOIN Mentees ON Users.userId = Mentees.userId\n" +
            "WHERE Mentees.menteeId = ?";

    public static void main(String[] args) {
        //Test getUserByMenteeId (int menteeId)
        Users user = new MenteeDAO().getUserByMenteeId(1);
        System.out.println(user);
    }

    public Users getUserByMenteeId (int menteeId) {
        Users user = new Users();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(GET_USER_BY_MENTEE_ID);
            ps.setInt(1, menteeId);
            rs = ps.executeQuery();
            while (rs.next()) {
                //Users(String fName, String lName, String gender, String email, String phoneNum, String address, String facebook,String password)
                user = new Users(rs.getString("fName"), rs.getString("lName"), rs.getString("gender"), rs.getString("email"), rs.getString("PhoneNum"), rs.getString("address"),rs.getString("facebook"),rs.getString("password"));
            }
        } catch (Exception e) {
        }
        return user;
    }

     public String getMenteeIdbyUserId(String userId) {
        String menteeId ="";
        String query = "Select menteeId from Mentees where userId="+userId+"";
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
}
