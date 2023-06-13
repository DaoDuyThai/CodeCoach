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
    public MentorDTO getMentorInfoForSearchById(int mentorId){
        
        String query = "SELECT\n" +
                        "    m.mentorId,\n" +
                        "    u.userId,\n" +
                        "    u.fName,\n" +
                        "    u.lName,\n" +
                        "    u.gender,\n" +
                        "    u.phoneNum,\n" +
                        "    u.address,\n" +
                        "    u.maqh,\n" +
                        "    qh.name,\n" +
                        "    ttp.name,\n" +
                        "    skillNames = STRING_AGG(sk.skillName, ', '),\n" +
                        "    m.hourlyRate\n" +
                        "FROM\n" +
                        "    Users u\n" +
                        "    LEFT JOIN Mentors m ON u.userId = m.userId\n" +
                        "    INNER JOIN quanhuyen qh ON u.maqh = qh.maqh\n" +
                        "    INNER JOIN tinhthanhpho ttp ON qh.mattp = ttp.mattp\n" +
                        "    JOIN Expertise e ON m.mentorId = e.mentorId\n" +
                        "    JOIN Skills sk ON e.skillId = sk.skillId\n" +
                        "    JOIN SubCategories sc ON sk.subCategoryId = sc.subCategoryId\n" +
                        "    JOIN Categories c ON sc.categoryId = c.categoryId\n" +
                        "WHERE\n" +
                        "    m.mentorId = ?\n" +
                        "GROUP BY\n" +
                        "    m.mentorId,\n" +
                        "    u.userId,\n" +
                        "    u.fName,\n" +
                        "    u.lName,\n" +
                        "    u.gender,\n" +
                        "    u.phoneNum,\n" +
                        "    u.address,\n" +
                        "    u.maqh,\n" +
                        "    qh.name,\n" +
                        "    ttp.name,\n" +
                        "    m.hourlyRate";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, mentorId);
            rs = ps.executeQuery();
            while(rs.next()){
                MentorDTO mentorDTO = new MentorDTO(
                rs.getInt(1),
                rs.getInt(2),
                rs.getString(3),
                rs.getString(4),
                rs.getString(5),
                rs.getString(6),
                rs.getString(7),
                rs.getString(8),
                rs.getString(9),
                rs.getString(10),
                rs.getString(11),
                rs.getString(12)
                );
                return mentorDTO;
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
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
    public static void main(String[] args) {
        MentorDAO mentorDAO = new MentorDAO();
        List<Integer> mentorIds = mentorDAO.getMentorIdBySearch("java");

        List<MentorDTO> mentorList = new ArrayList<>();
        for (Integer mentorId : mentorIds) {
            MentorDTO mentorDTO = mentorDAO.getMentorInfoForSearchById(mentorId);
            mentorList.add(mentorDTO);
        }
        for (MentorDTO mentors: mentorList){
            for (int i =0; i <= mentorList.size();i++){
                System.out.println(mentors);
            }
        }
        }
    public class MentorDTO {
        private int mentorId;
        private int userId;
        private String firstName;
        private String lastName;
        private String gender;
        private String phoneNum;
        private String address;
        private String maqh;
        private String tenqh;
        private String tenttp;
        private String skillName;
        private String hourlyRate;

        public MentorDTO(int mentorId, int userId, String firstName, String lastName, String gender, String phoneNum, String address, String maqh, String tenqh, String tenttp, String skillName, String hourlyRate) {
            this.mentorId = mentorId;
            this.userId = userId;
            this.firstName = firstName;
            this.lastName = lastName;
            this.gender = gender;
            this.phoneNum = phoneNum;
            this.address = address;
            this.maqh = maqh;
            this.tenqh = tenqh;
            this.tenttp = tenttp;
            this.skillName = skillName;
            this.hourlyRate = hourlyRate;
        }

        public int getMentorId() {
            return mentorId;
        }

        public void setMentorId(int mentorId) {
            this.mentorId = mentorId;
        }

        public int getUserId() {
            return userId;
        }

        public void setUserId(int userId) {
            this.userId = userId;
        }

        public String getFirstName() {
            return firstName;
        }

        public void setFirstName(String firstName) {
            this.firstName = firstName;
        }

        public String getLastName() {
            return lastName;
        }

        public void setLastName(String lastName) {
            this.lastName = lastName;
        }

        public String getGender() {
            return gender;
        }

        public void setGender(String gender) {
            this.gender = gender;
        }

        public String getPhoneNum() {
            return phoneNum;
        }

        public void setPhoneNum(String phoneNum) {
            this.phoneNum = phoneNum;
        }

        public String getAddress() {
            return address;
        }

        public void setAddress(String address) {
            this.address = address;
        }

        public String getMaqh() {
            return maqh;
        }

        public void setMaqh(String maqh) {
            this.maqh = maqh;
        }

        public String getTenqh() {
            return tenqh;
        }

        public void setTenqh(String tenqh) {
            this.tenqh = tenqh;
        }

        public String getTenttp() {
            return tenttp;
        }

        public void setTenttp(String tenttp) {
            this.tenttp = tenttp;
        }

        public String getSkillName() {
            return skillName;
        }

        public void setSkillName(String skillName) {
            this.skillName = skillName;
        }

        public String getHourlyRate() {
            return hourlyRate;
        }

        public void setHourlyRate(String hourlyRate) {
            this.hourlyRate = hourlyRate;
        }

        
    }
}
