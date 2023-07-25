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
import model.Experience;
import model.Roles;
import model.Users;

/**
 *
 * @author Duy Thai
 */
public class ExperienceDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Experience> getExperienceByMentorId(int mentorId) {
        String query = "select * from Experience where mentorId =?";
        List<Experience> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, mentorId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Experience(rs.getInt(1), rs.getInt(2), rs.getString(3)));
            }
        } catch (Exception e) {
        }

        return list;
    }
    
    public void insertExperience(int mentorId, String description) {
        String query = "INSERT INTO [dbo].[Experience]([mentorId],[description]) VALUES("+mentorId+",'"+description+"')";   
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();         
        } catch (Exception e) {
        }
    }

    public static final String GET_EXPERIENCE_BY_USER_ID = "SELECT e.*\n" +
            "FROM Users u\n" +
            "         JOIN Mentors m ON u.userId = m.userId\n" +
            "         JOIN Experience e ON m.mentorId = e.mentorId\n" +
            "WHERE u.userId = ?;\n";
    public Experience getExperienceByUserID(int userId) {
        Experience experience = new Experience();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(GET_EXPERIENCE_BY_USER_ID);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                experience = new Experience(rs.getInt("experienceId"), rs.getInt("mentorId"), rs.getString("description"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return experience;

    }
}


