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
import model.Users;

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

    public List<Mentors> getAllMentor() {
        List<Mentors> list = new ArrayList<>();
        String query = "select * from Mentors m\n"
                + "inner join Users u\n"
                + "on m.userId=u.userId";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Mentors mentors = new Mentors();
                mentors.setUserId(rs.getInt("userId"));
                mentors.setBio(rs.getString("bio"));
                mentors.setHourlyRate(rs.getString("hourlyRate"));

                Users users = new Users();
                users.setfName(rs.getString("fName"));
                users.setlName(rs.getString("lName"));
                users.setEmail(rs.getString("email"));
                users.setAddress(rs.getString("address"));
                users.setPhoneNum(rs.getString("phoneNum"));
                users.setGender(rs.getString("gender"));
                users.setAvatar(rs.getString("avatar"));

                mentors.setUsers(users);

                list.add(mentors);

            }
        } catch (Exception e) {
        }
        return list;
    }

    public Mentors getMentorByUserId(int userId) {
        String query = "select * from Mentors m\n"
                + "inner join Users u\n"
                + "on m.userId=u.userId\n"
                + "wHere m.userId=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Mentors mentors = new Mentors();
                mentors.setUserId(rs.getInt("userId"));
                mentors.setBio(rs.getString("bio"));
                mentors.setHourlyRate(rs.getString("hourlyRate"));

                Users users = new Users();
                users.setfName(rs.getString("fName"));
                users.setlName(rs.getString("lName"));
                users.setEmail(rs.getString("email"));
                users.setAddress(rs.getString("address"));
                users.setPhoneNum(rs.getString("phoneNum"));
                users.setGender(rs.getString("gender"));
                users.setAvatar(rs.getString("avatar"));

                mentors.setUsers(users);

                return mentors;

            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        MentorDAO mdao = new MentorDAO();
        UserDAO udao = new UserDAO();
//        List<Integer> listMId = mdao.getAllMentorIdBySkillId(13);
//        List<Object[]> listUInfo = new ArrayList<>();
//        for (Integer mentorId : listMId) {
//            Object[] uInfo = udao.getUserInfoByMentorId(mentorId);
//            listUInfo.add(uInfo);
//        }
//        for (Object[] objects : listUInfo) {
//            for (int i = 0; i < objects.length; i++) {
//                System.out.print(objects[i] + " ");
//            }
//            System.out.println("");
//        }
        List<Mentors> cl = mdao.getAllMentor();
        for (Mentors mentors : cl) {
            System.out.println(mentors.getHourlyRate());
        }
    }
}
