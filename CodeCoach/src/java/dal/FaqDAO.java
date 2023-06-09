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
import model.Faq;

/**
 *
 * @author Duy Thai
 */
public class FaqDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Faq> getAll() {
        List<Faq> list = new ArrayList<>();
        String querry = "Select * from faq";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Faq(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Faq getFaqById(int id) {

        String query = "select * from faq where id =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Faq faq = new Faq(rs.getInt(1), rs.getString(2), rs.getString(3));
                return faq;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        FaqDAO d = new FaqDAO();
        System.out.println(d.getFaqById(1));
    }
}
