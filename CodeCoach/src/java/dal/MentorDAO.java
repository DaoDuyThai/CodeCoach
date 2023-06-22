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
        String querry = "Select * from mentors";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Mentors(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Object[]> getAllMentor() {
        List<Object[]> list = new ArrayList<>();

        String querry = "select m.mentorId, m.userId, m.bio, m.hourlyRate, u.email, u.password, u.fName, u.lName, u.gender, u.phoneNum, u.roleId, u.statusId, u.address, u.maqh, u.facebook, qh.name, ttp.name from mentors m join users u on m.userId = u.userId join quanhuyen qh on u.maqh = qh.maqh join tinhthanhpho ttp on qh.mattp = ttp.mattp";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                Object[] userInfo = new Object[17];

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
                list.add(userInfo);
            }
        } catch (Exception e) {
        }

        return list;
    }
//        public List<Object[]> getSkillOfMenter(int skillId) {
//            List<Object[]> listM = new ArrayList<>();
//        Object[] o = new Object[7];
//        String query = "select m.mentorId, m.userId, m.bio, m.hourlyRate, u.email, u.password, u.fName, u.lName, u.gender, u.phoneNum, u.roleId, u.statusId, u.address, u.maqh, u.facebook, qh.name, ttp.name from mentors m join users u on m.userId = u.userId join quanhuyen qh on u.maqh = qh.maqh join tinhthanhpho ttp on qh.mattp = ttp.mattp where m.mentorId =?";
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, skillId);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                o[0] = rs.getInt(1);
//                o[1] = rs.getInt(2);
//                o[2] = rs.getString(3);
//                o[3] = rs.getInt(4);
//                o[4] = rs.getString(5);
//                o[5] = rs.getString(6);
//                o[6] = rs.getString(7);
//                o[7] = rs.getString(8);
//                
//            }
//        } catch (Exception e) {
//        
//        }
//        return listM;
//    }
    public Object[] getUserInfoByMentorId(int mentorId) {
        Object[] o = new Object[17];
        String query = "select m.mentorId, m.userId, m.bio, m.hourlyRate, u.email, u.password, u.fName, u.lName, u.gender, u.phoneNum, u.roleId, u.statusId, u.address, u.maqh, u.facebook, qh.name, ttp.name from mentors m join users u on m.userId = u.userId join quanhuyen qh on u.maqh = qh.maqh join tinhthanhpho ttp on qh.mattp = ttp.mattp where m.mentorId =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, mentorId);
            rs = ps.executeQuery();
            while (rs.next()) {
                o[0] = rs.getInt(1);
                o[1] = rs.getInt(2);
                o[2] = rs.getString(3);
                o[3] = rs.getInt(4);
                o[4] = rs.getString(5);
                o[5] = rs.getString(6);
                o[6] = rs.getString(7);
                o[7] = rs.getString(8);
                o[8] = rs.getString(9);
                o[9] = rs.getString(10);
                o[10] = rs.getInt(11);
                o[11] = rs.getInt(12);
                o[12] = rs.getString(13);
                o[13] = rs.getInt(14);
                o[14] = rs.getString(15);
                o[15] = rs.getString(16);
                o[16] = rs.getString(17);
            }
        } catch (Exception e) {

        }
        return o;
    }
        public List<Integer> getMentorIdBySkillId(String skillId){
            List<Integer> list = new ArrayList<>();
            String query = "Select * from Expertise where skillId = ?";
            try{
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setString(1, skillId);
                rs = ps.executeQuery();
                while(rs.next()){
                    list.add(rs.getInt(2));
                }
                
            }
            catch(Exception e){              
            }
            return list;
        }
        
        
        public static void main(String[] args) {
        MentorDAO dao = new MentorDAO();
        List<Integer> listMId = dao.getMentorIdBySkillId("1");
        List<Object[]> listUInfo = new ArrayList<>();
        for (Integer mentorId : listMId) {
            Object[] uInfo = dao.getUserInfoByMentorId(mentorId);
            listUInfo.add(uInfo);
        }
        for(Object[] objects : listUInfo){
            for(int i = 0; i < objects.length; i++){
            System.out.print(objects[i] + "");
        }
            System.out.println("");
        }

    }
    
}
