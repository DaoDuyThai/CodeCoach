/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.QuanHuyen;
import model.Roles;
import model.TinhThanhPho;

/**
 *
 * @author Duy Thai
 */
public class TinhThanhPhoDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<TinhThanhPho> getAllTinhThanhPho() {
        List<TinhThanhPho> list = new ArrayList<>();
        String querry = "SELECT *\n"
                + "  FROM [CodeCoach].[dbo].[tinhthanhpho]";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TinhThanhPho(rs.getString(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<QuanHuyen> getDistrictByCityID(String id) {
        List<QuanHuyen> list = new ArrayList<>();
        String querry = "SELECT *\n"
                + "  FROM [CodeCoach].[dbo].[quanhuyen] where mattp = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new QuanHuyen(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }
}
