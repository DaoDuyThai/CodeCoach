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
import model.ContactUs;
import model.Faq;

/**
 *
 * @author NGHIA
 */
public class ContactUsDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<ContactUs> getAll() {
        List<ContactUs> list = new ArrayList<>();
        String querry = "Select * from ContactUs";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ContactUs(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public void insertInfo(ContactUs contactUs) {
        String query = "INSERT INTO ContactUs (infor, href) VALUES (?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, contactUs.getInfor());
            ps.setString(2, contactUs.getHref());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateInfo(ContactUs contactUs) {
        String query = "UPDATE ContactUs SET infor = ?, href = ? WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, contactUs.getInfor());
            ps.setString(2, contactUs.getHref());
            ps.setInt(3, contactUs.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteInfo(int id) {
        String query = "DELETE FROM ContactUs WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public String countInfo() {
        String query = "select count (id) from ContactUs";
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
    
    public static void main(String[] args) {
        ContactUsDAO d = new ContactUsDAO();
        List<ContactUs> list = d.getAll();
        for(ContactUs l : list){
            System.out.println(l);
        }
    }
}
