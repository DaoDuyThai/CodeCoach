/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import model.Mentees;
import model.Users;

/**
 *
 * @author MrTuan
 */
public class MenteeDAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Mentees getMenteeByUserId(int userId) {
        String query = "select * from Mentees m\n"
                + "inner join Users u\n"
                + "on m.userId=u.userId\n"
                + "wHere m.userId=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Mentees mentee = new Mentees();
                mentee.setUserId(rs.getInt("userId"));
                mentee.setMenteeId(rs.getInt("menteeId"));

                Users users = new Users();
                users.setfName(rs.getString("fName"));
                users.setlName(rs.getString("lName"));
                users.setEmail(rs.getString("email"));
                users.setAddress(rs.getString("address"));
                users.setPhoneNum(rs.getString("phoneNum"));
                users.setGender(rs.getString("gender"));
                users.setAvatar(rs.getString("avatar"));

                mentee.setUsers(users);

                return mentee;

            }
        } catch (Exception e) {
        }
        return null;
    }
    public static void main(String[] args) {
        MenteeDAO mdao = new MenteeDAO();
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
//        List<Mentees> cl = mdao.getMenteeByUserId(3);
        Mentees mte=mdao.getMenteeByUserId(3);
        System.out.println(mte.getMenteeId());
    }
}
