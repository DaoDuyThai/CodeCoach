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
import model.Expertise;

import static java.sql.DriverManager.getConnection;

/**
 *
 * @author Duy Thai
 */
public class ExpertiseDAO extends DBContext{

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Expertise> getExpertiseByMentorId(int mentorId) {
        String query = "select * from Expertise where mentorId =?";
        List<Expertise> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, mentorId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Expertise(rs.getInt(1), rs.getInt(2), rs.getInt(3)));
            }
        } catch (Exception e) {
        }

        return list;
    }

      public List<Expertise> getExpertiseByMentorIdandSkillId(int mentorId, String skillId) {
        List<Expertise> listExpertises = new ArrayList<>();
        String querry = "select * from Expertise where mentorId = "+mentorId+" and skillId= "+skillId+"";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                listExpertises.add(new Expertise(rs.getInt(1), rs.getInt(2), rs.getInt(3)));
            }
        } catch (Exception e) {
        }
        return listExpertises;
    }
      
      public List<Expertise> getAllBooking(int mentorId, String skillId) {
        List<Expertise> listBookings = new ArrayList<>();
        String querry = "select * from Expertise where mentorId = "+mentorId+" and skillId= "+skillId+"";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                listBookings.add(new Expertise(rs.getInt(1), rs.getInt(2), rs.getInt(3)));
            }
        } catch (Exception e) {
        }
        return listBookings;
    }
    
    public List<Object[]> getExpertiseDetailsByMentorId(int mentorId) {
        String query = "SELECT e.expertiseId, e.mentorId, e.skillId, s.skillName FROM Expertise e JOIN Skills s ON e.skillId = s.skillId WHERE e.mentorId = ?";
        List<Object[]> list = new ArrayList<>();

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, mentorId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Object[] expertiseDetails = new Object[4];
                // Populate the array with data from the ResultSet
                expertiseDetails[0] = rs.getInt(1);
                expertiseDetails[1] = rs.getInt(2);
                expertiseDetails[2] = rs.getInt(3);
                expertiseDetails[3] = rs.getString(4);

                list.add(expertiseDetails);
            }
        } catch (Exception e) {

        }

        return list;
    }
    
    public void insertExpertise(int mentorId, String skillId) {
        String query = "INSERT INTO [dbo].[Expertise]([mentorId],[skillId]) VALUES("+mentorId+","+skillId+")";   
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
           
        } catch (Exception e) {
        }
    }
    
    public static void main(String[] args) {
        List<Expertise> e = new ExpertiseDAO().getAllBooking(1,"10");
        System.out.println(e.size() ==0);
    }


    private static final String GET_ALL_EXPERTISE_SQL = "SELECT * FROM Expertise";
    public List<Expertise> getAllExpertise() {
        List<Expertise> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(GET_ALL_EXPERTISE_SQL);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Expertise(rs.getInt(1), rs.getInt(2), rs.getInt(3)));
            }
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }

    private static final String REMOVE_EXPERTISE_SQL = "DELETE FROM Expertise WHERE expertiseId = ?;";
    public void removeExpertise(int expertiseID) {
        try (PreparedStatement preparedStatement = getConnection().prepareStatement(REMOVE_EXPERTISE_SQL)) {
            preparedStatement.setInt(1, expertiseID);
            preparedStatement.executeUpdate();
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private static final String ADD_EXPERTISE_SQL = "INSERT INTO Expertise(mentorId, skillId) VALUES (?, ?);";
    public void addExpertise(Expertise expertise) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_EXPERTISE_SQL);
            preparedStatement.setInt(1, expertise.getMentorId());
            preparedStatement.setInt(2, expertise.getSkillId());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
