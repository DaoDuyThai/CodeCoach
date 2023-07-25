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
import model.Notifications;

/**
 *
 * @author hoang
 */
public class MenteeNotificationDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Notifications> getAll() {
        List<Notifications> list = new ArrayList<>();
        String querry = "Select * from Notifications";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Notifications(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

   public List<Notifications> getNotificationsByMenteeID(int id) {
        List<Notifications> list = new ArrayList<>();
        String querry = "Select * from Notifications where userId = ? order by [dateTime] desc";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Notifications(rs.getInt(1),rs.getInt(2),rs.getInt(3), rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

}
