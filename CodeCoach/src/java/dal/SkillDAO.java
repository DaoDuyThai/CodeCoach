/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Skills;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Duy Thai
 */
public class SkillDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private final String getSkillBySkillId = "SELECT * FROM [dbo].[Skills] WHERE skillId = ?";

    public Skills getSkillBySkillId(int skillId) {
        Skills skill = new Skills();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(getSkillBySkillId);
            ps.setInt(1, skillId);
            rs = ps.executeQuery();
            while (rs.next()) {
                skill = new Skills(rs.getInt(1), rs.getString(2), rs.getInt(3));
            }
        } catch (Exception e) {
        }
        return skill;
    }

    public List<Skills> getAll() {
        List<Skills> list = new ArrayList<>();
        String querry = "Select * from skills";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Skills(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Skills> getTop8() {
        List<Skills> list = new ArrayList<>();
        String querry = "Select top 8 * from skills order by skillId";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Skills(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Skills> getNext8(int amount) {
        List<Skills> list = new ArrayList<>();
        String querry = "Select * from skills order by skillId offset ? rows fetch next 8 rows only";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Skills(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalSkill() {
        String query = "select count(skillId) as Total from skills";
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

    public List<Object[]> getTop5MostBookedSkills(){
        String query = "SELECT top 5 s.skillName, COUNT(*) AS occurrence FROM booking b JOIN Skills s ON b.skillId = s.skillId GROUP BY s.skillName order by occurrence desc;";
        List<Object[]> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
               Object[] skillOccurrence = new Object[4];
               skillOccurrence[0] = rs.getString("skillName");
               skillOccurrence[1] = rs.getInt("occurrence");
               list.add(skillOccurrence);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    private static String GET_SKILLID_BY_NAME = "SELECT skillId FROM Skills WHERE skillName = ?";

    public int getSkillIdByName(String skill) {
        int skillId = 0;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(GET_SKILLID_BY_NAME);
            ps.setString(1, skill);
            rs = ps.executeQuery();
            while (rs.next()) {
                skillId = rs.getInt("skillId");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return skillId;
    }

    public List<Skills> getSkillBySubCategoryId(String subCategoryId){
        List<Skills> listS = new ArrayList<>();
        String query = "select * from Skills where subCategoryId = ?";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, subCategoryId);
            rs = ps.executeQuery();
            while(rs.next()){
                listS.add(new Skills(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        }
        catch(Exception e){
        }
        return listS;
    }

    public String countSkill(String subCategoryId) {
        String query = "select count (skillId) from Skills where subCategoryId = ?";
        String count = "None";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, subCategoryId);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return count;
    }
    
    public List<Skills> getAllSkill() {
        List<Skills> list = new ArrayList<>();
        String querry = "Select * from skills";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Skills(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
     public ArrayList<Skills> getSkillByMentorID(String mentorId) {
        ArrayList<Skills> list = new ArrayList<>();
        String query = "SELECT s.*\n" +
                "FROM Mentors m\n" +
                "         JOIN Expertise e ON m.mentorId = e.mentorId\n" +
                "         JOIN Skills s ON e.skillId = s.skillId\n" +
                "WHERE m.mentorId = ?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, mentorId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Skills(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
      
     public void insertSkill(Skills skill) {
        String query = "INSERT INTO [dbo].[Skills]\n"
                + "           ([skillName]\n"
                + "           ,[subCategoryId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        try {
            conn = new DBContext().getConnection();
            PreparedStatement st = conn.prepareStatement(query);
            st.setString(1, skill.getSkillName());
            st.setInt(2, skill.getSubCategoryId());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }



}
