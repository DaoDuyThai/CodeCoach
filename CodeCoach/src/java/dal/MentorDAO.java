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
import model.Mentors;
import model.Skills;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Duy Thai
 */
public class MentorDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Mentors> getAll() {
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
    public List<Mentors> searchMentors(String searchTxt){
            List<Mentors> mtrList = new ArrayList<>();
            String query = "select u.fName, u.lName, m.hourlyRate, e.expertiseId\n" +
                            "from (((((Users u left join Mentors m \n" +
                            "on u.userId = m.userId) inner join Expertise e\n" +
                            "on m.mentorId = e.mentorId) inner join Skills sk\n" +
                            "on e.skillId = sk.skillId) inner join SubCategories sc\n" +
                            "on sk.subCategoryId = sc.subCategoryId) inner join Categories c\n" +
                            "on sc.categoryId = c.categoryId)\n" +
                            "where u.fName = ? "
                          + "or sk.skillName = ? or "
                          + "sc.subCategoryName = ? "
                          + "or c.categoryName = ?";
            try{
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setString(1, "%"+searchTxt+"%");
                ps.setString(2, "%"+searchTxt+"%");
                ps.setString(3, "%"+searchTxt+"%");
                ps.setString(4, "%"+searchTxt+"%");
                rs = ps.executeQuery();
                while(rs.next()){
                    mtrList.add(new Mentors(
                    rs.getInt(1),
                    rs.getInt(2),
                    rs.getString(3),
                    rs.getString(4)));
                }
                
            }
            catch(Exception e) {
                e.printStackTrace();
            }
            return mtrList;
    }
    public static void main(String[] args) {
        MentorDAO dao = new MentorDAO();
       List<Mentors> m = dao.searchMentors("Ruby");
        System.out.println(m);
    }

}
