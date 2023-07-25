/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Mentors;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import static java.sql.DriverManager.getConnection;
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
public class MentorDAO extends DBContext{

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private String GET_MENTOR_BY_USER_ID = "SELECT * FROM [dbo].[Mentors] WHERE userId = ?";

    public Mentors getMentorByUserId(int userId) {
        Mentors mentor = new Mentors();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(GET_MENTOR_BY_USER_ID);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                mentor = new Mentors(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
            }
        } catch (Exception e) {
        }
        return mentor;
    }

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
            while(rs.next()){
                list.add(rs.getInt(2));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }


    public List<Integer> getMentorIdBySearch(String searchTxt) {
        List<Integer> list = new ArrayList<>();
        String query = "select distinct m.mentorId \n"
                + "from Users u left join Mentors m \n"
                + "on u.userId = m.userId inner join quanhuyen qh on u.maqh = qh.maqh inner join tinhthanhpho ttp on qh.mattp = ttp.mattp join Expertise e \n"
                + "on m.mentorId = e.mentorId  join Skills sk\n"
                + "on e.skillId = sk.skillId  join SubCategories sc\n"
                + "on sk.subCategoryId = sc.subCategoryId join Categories c \n"
                + "on sc.categoryId = c.categoryId\n"
                + "where u.fName like ? or u.lName like ? or sk.skillName like ? or sc.subCategoryName like ? or c.categoryName like ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + searchTxt + "%");
            ps.setString(2, "%" + searchTxt + "%");
            ps.setString(3, "%" + searchTxt + "%");
            ps.setString(4, "%" + searchTxt + "%");
            ps.setString(5, "%" + searchTxt + "%");
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


    private static final String GET_MENTOR_ID_BY_USER = "SELECT m.mentorId\n" +
            "FROM Users u\n" +
            "         JOIN Mentors m ON u.userId = m.userId\n" +
            "WHERE u.userId = ?;";
    public int getMentorIdByUser(int users) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_MENTOR_ID_BY_USER);
            preparedStatement.setInt(1, users);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return rs.getInt("mentorId");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return -1;
    }

    private static final String UPDATE_MENTOR = "UPDATE Mentors\n" +
            "SET bio = ?, hourlyRate = ?\n" +
            "WHERE mentorId = ?;";
    public void updateMentor(Mentors mentor) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_MENTOR);
            preparedStatement.setString(1, mentor.getBio());
            preparedStatement.setString(2, mentor.getHourlyRate());
            preparedStatement.setInt(3, mentor.getMentorId());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private static final String GET_USER_BY_MENTOR_ID = "SELECT u.*\n" +
            "FROM Users u\n" +
            "         JOIN Mentors m ON u.userId = m.userId\n" +
            "WHERE m.mentorId = ?;";
    public Users getUserByMentorID(String attribute) {
        try(PreparedStatement preparedStatement = getConnection().prepareStatement(GET_USER_BY_MENTOR_ID)){
            preparedStatement.setString(1, attribute);
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()){
                return new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11), rs.getString(12));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
