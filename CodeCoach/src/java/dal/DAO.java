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
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Roles> getAll() {
        List<Roles> list = new ArrayList<>();
        String querry = "select * from roles";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Roles(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Roles> list = dao.getAll();
        for (Roles r : list) {
            System.out.println(r);
        }
    }

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
