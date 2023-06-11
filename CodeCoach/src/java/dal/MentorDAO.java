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
    public List<Object[]> searchMentors(String searchTxt){
            List<Object[]> mtrList = new ArrayList<>();
            String query = "select m.mentorId, m.userId, m.bio, m.hourlyRate, u.email, u.password, u.fName, u.lName, u.gender, u.phoneNum, "
                          + "u.roleId, u.statusId, u.address, u.maqh, u.facebook, qh.name, ttp.name, sk.skillName, m.hourlyRate\n" +
                            "from ((((((Users u join Mentors m \n" +
                            "on u.userId = m.userId) join quanhuyen qh on u.maqh = qh.maqh join tinhthanhpho ttp on qh.mattp = ttp.mattp) join Expertise e \n" +
                            "on m.mentorId = e.mentorId)  join Skills sk\n" +
                            "on e.skillId = sk.skillId)  join SubCategories sc\n" +
                            "on sk.subCategoryId = sc.subCategoryId) inner join Categories c \n" +
                            "on sc.categoryId = c.categoryId)\n" +
                            "where u.fName like ? "
                          + "or where u.lName like ?"
                          + "or sk.skillName like ? or "
                          + "sc.subCategoryName like ? "
                          + "or c.categoryName like ?";
            try{
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setString(1, "%"+searchTxt+"%");
                ps.setString(2, "%"+searchTxt+"%");
                ps.setString(3, "%"+searchTxt+"%");
                ps.setString(4, "%"+searchTxt+"%");
                rs = ps.executeQuery();
                while(rs.next()){
                    Object[] userInfo = new Object[19];

                // Populate the array with data from the ResultSet
                userInfo[0] = rs.getString("mentorId");
                userInfo[1] = rs.getString("userId");
                userInfo[2] = rs.getString("bio");
                userInfo[3] = rs.getInt("hourlyRate");
                userInfo[4] = rs.getString("email");
                userInfo[5] = rs.getString("password");
                userInfo[6] = rs.getString("fName");
                userInfo[7] = rs.getString("lName");
                userInfo[8] = rs.getString("gender");
                userInfo[9] = rs.getString("phoneNum");
                userInfo[10] = rs.getInt("roleId");
                userInfo[11] = rs.getInt("statusId");
                userInfo[12] = rs.getString("address");
                userInfo[13] = rs.getString("maqh");
                userInfo[14] = rs.getString("facebook");
                userInfo[15] = rs.getString(16);
                userInfo[16] = rs.getString(17);
                userInfo[17] = rs.getString("skillName");
                userInfo[18] = rs.getString("hourlyRate");
                mtrList.add(userInfo);
                }
                
            }
            catch(Exception e) {
                e.printStackTrace();
            }
            return mtrList;
    }
    public static void main(String[] args) {
        MentorDAO dao = new MentorDAO();
       List<Object[]> m = dao.searchMentors("Ruby");
       for (Object[] mInfo: m)
        System.out.println(mInfo);
    }

}
