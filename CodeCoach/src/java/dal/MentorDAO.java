/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
import model.Mentors;
import model.Skills;
import java.util.HashMap;
import java.util.Map;
import model.Users;

/**
 *
 * @author Duy Thai
 */
public class MentorDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Mentors> getAllMentor() {
        List<Mentors> list = new ArrayList<>();
        String query = "Select * from mentors";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Mentors(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Mentors getMentorByMentorId(int mentorId) {
        String query = "select * from mentors where mentorId =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, mentorId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Mentors mentor = new Mentors(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
                return mentor;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public Mentors getMentorByUserId(String userId) {
        String query = "select * from mentors where userId ="+userId+"";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);          
            rs = ps.executeQuery();
            while (rs.next()) {
                Mentors mentor = new Mentors(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
                return mentor;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public void registerMentor(String userId, String biography, String hourlyRate) {
        String query = "INSERT INTO [dbo].[Mentors]([userId],bio,[hourlyRate]) VALUES(" + userId + ",'" + biography + "'," + hourlyRate + ")";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
        } catch (Exception e) {
        }
    }

    public List<Integer> getAllMentorIdBySkillId(int skillId) {
        String query = "select * from expertise where skillid =?";
        List<Integer> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, skillId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(2));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

   public List<Integer> getMentorIdBySearchAndFilter(String searchTxt, String[] filterOptions) {
    List<Integer> list = new ArrayList<>();
    StringBuilder query = new StringBuilder("SELECT DISTINCT m.mentorId FROM Mentors m ");
    query.append("INNER JOIN Users u ON m.userId = u.userId ");
    query.append("INNER JOIN Expertise e ON m.mentorId = e.mentorId ");
    query.append("INNER JOIN Skills s ON e.skillId = s.skillId ");
    query.append("INNER JOIN SubCategories sc ON s.subCategoryId = sc.subCategoryId ");
    query.append("INNER JOIN Categories c ON sc.categoryId = c.categoryId ");
    query.append("WHERE (u.fName LIKE ? OR u.lName LIKE ? OR s.skillName LIKE ? OR sc.subCategoryName LIKE ? OR c.categoryName LIKE ?)");

    if (filterOptions != null && filterOptions.length > 0) {
        query.append(" AND s.skillId IN (");
        for (int i = 0; i < filterOptions.length; i++) {
            query.append("?");
            if (i < filterOptions.length - 1) {
                query.append(",");
            }
        }
        query.append(")");
    }

    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query.toString());

        ps.setString(1, "%" + searchTxt + "%");
        ps.setString(2, "%" + searchTxt + "%");
        ps.setString(3, "%" + searchTxt + "%");
        ps.setString(4, "%" + searchTxt + "%");
        ps.setString(5, "%" + searchTxt + "%");

        if (filterOptions != null && filterOptions.length > 0) {
            for (int i = 0; i < filterOptions.length; i++) {
                ps.setString(i + 6, filterOptions[i]);
            }
        }

        rs = ps.executeQuery();
        while (rs.next()) {
            list.add(rs.getInt(1));
        }
    } catch (Exception e) {
        System.out.println(e);
    }
    return list;
}

    public List<Object> getMentorInformationByIdFromSearch(int mentorId) {
        MentorDAO mentorDAO = new MentorDAO();
        ExpertiseDAO expertiseDAO = new ExpertiseDAO();
        UserDAO userDAO = new UserDAO();

        List<Object> mentorInformation = new ArrayList<>();

        // Get mentor's user information
        Object[] userInfo = userDAO.getUserInfoByMentorId(mentorId);
        mentorInformation.add(userInfo[0]);
        mentorInformation.add(userInfo[1]);
        mentorInformation.add(userInfo[2]);
        mentorInformation.add(userInfo[3]);
        mentorInformation.add(userInfo[4]);
        mentorInformation.add(userInfo[5]);
        mentorInformation.add(userInfo[6]);
        mentorInformation.add(userInfo[7]);
        mentorInformation.add(userInfo[8]);
        mentorInformation.add(userInfo[9]);
        mentorInformation.add(userInfo[10]);
        mentorInformation.add(userInfo[11]);
        mentorInformation.add(userInfo[12]);
        mentorInformation.add(userInfo[13]);
        mentorInformation.add(userInfo[14]);
        mentorInformation.add(userInfo[15]);
        mentorInformation.add(userInfo[16]);

        // Get mentor's skill names
        List<Object[]> expertiseDetails = expertiseDAO.getExpertiseDetailsByMentorId(mentorId);
        for (Object[] expertise : expertiseDetails) {
            String skillName = (String) expertise[3];
            mentorInformation.add(skillName);
        }

        return mentorInformation;
    }

    public List<Object[]> getTop5MostBookedMentors() {
        String query = "SELECT TOP 5 m.mentorId, m.userId, u.fName, u.lName, COUNT(m.mentorId) AS mentorOccurrence\n"
                + "FROM booking b\n"
                + "JOIN mentors m ON b.mentorId = m.mentorId\n"
                + "JOIN users u ON m.userId = u.userId\n"
                + "GROUP BY m.mentorId, u.fName, u.lName, m.userId\n"
                + "ORDER BY mentorOccurrence DESC;";
        List<Object[]> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Object[] mentorOccurrence = new Object[5];
                mentorOccurrence[0] = rs.getInt(1);
                mentorOccurrence[1] = rs.getInt(2);
                mentorOccurrence[2] = rs.getString(3);
                mentorOccurrence[3] = rs.getString(4);
                mentorOccurrence[4] = rs.getInt(5);
                list.add(mentorOccurrence);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalMentorNumber() {
        String query = "select count(mentorid) as Total from mentors";
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
    public String countMentor() {
        String query = "select count (mentorId) from Mentors";
        String count = "None";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return count;
    }

    public int getMentorIdByUserId(int userId, int mentorId){
        String query = "select mentorId from Mentors m join Users u on m.userId=u.userId\n" +
                   "where u.userId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            if (rs.next()){
                mentorId = rs.getInt("mentorId");
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return mentorId;
    
    }
    public List<Integer> getAllMentorId(){
        List<Integer> mentorIdList = new ArrayList<>();
        String query = "Select mentorId from Mentors";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()){
                mentorIdList.add(rs.getInt(1));
            }
    }
        catch(Exception e){
            e.printStackTrace();
        }
        return mentorIdList;
    
}
}
