/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Slot;

/**
 *
 * @author giang
 */
public class SlotDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Slot getSlotbySlotId(int slotId) {
        Slot slot = new Slot();
        String query = "SELECT * FROM Slot Where slotId = "+slotId+"";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                slot = new Slot(rs.getInt(1), rs.getString(2), rs.getString(3));
        }
        } catch (Exception e) {
        }
        return slot;
    }
}
