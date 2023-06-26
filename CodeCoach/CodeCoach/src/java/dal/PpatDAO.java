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
                list.add(new Ppat(rs.getInt(1),rs.getInt(2), rs.getString(3), rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public static void main(String[] args) {
        PpatDAO d = new PpatDAO();
        List<Ppat> L = d.getAll();
        for (Ppat ppat : L) {
            System.out.println(ppat);
        }
    }
}
