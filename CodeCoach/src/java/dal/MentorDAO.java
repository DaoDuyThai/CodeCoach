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
    
    public List<Object> getAllMentorAndUserAttribute() {
        List<Object> list = new ArrayList<>();
        String querry = "select * from Mentors join Users on mentors.userId = users.userId";
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
    public static void main(String[] args) {
        MentorDAO dao = new MentorDAO();
        List<Mentors> list = dao.getAll();
        for (Mentors mentor : list) {
            System.out.println(mentor);
        }
    }
    
}
