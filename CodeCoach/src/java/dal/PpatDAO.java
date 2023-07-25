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
import model.Ppat;
import model.Skills;

/**
 *
 * @author Duy Thai
 */
public class PpatDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Ppat> getAll() {
        List<Ppat> list = new ArrayList<>();
        String querry = "Select * from PrivacyPolicyAndTerms";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Ppat(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Ppat getPrivacyPolicyAndTermsById(int id) {
        String query = "select * from PrivacyPolicyAndTerms where id =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Ppat ppat = new Ppat(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
                return ppat;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void insertPrivacyPolicyAndTerms(Ppat ppat) {
        String query = "INSERT INTO PrivacyPolicyAndTerms (id, type, summary, content) VALUES (?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, ppat.getId());
            ps.setInt(2, ppat.getType());
            ps.setString(3, ppat.getSummary());
            ps.setString(4, ppat.getContent());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updatePrivacyPolicyAndTerms(Ppat ppat) {
        String query = "UPDATE PrivacyPolicyAndTerms SET summary = ?, content = ? WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ppat.getSummary());
            ps.setString(2, ppat.getContent());
            ps.setInt(3, ppat.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deletePrivacyPolicyAndTerms(int id) {
        String query = "DELETE FROM PrivacyPolicyAndTerms WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String countPpat() {
        String query = "select count (id) from PrivacyPolicyAndTerms";
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

    public int getBottomId() {
        int id = 0;
        String query = "select top 1 id from PrivacyPolicyAndTerms\n"
                + "order by id desc";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return id;
    }

}
