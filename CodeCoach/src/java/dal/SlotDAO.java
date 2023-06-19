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
import model.Slot;

public class SlotDAO extends DBContext{
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Slot> getAll() {
        List<Slot> list = new ArrayList<>();
        String query = "select * from Slot";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Slot slot = new Slot();
                slot.setSlotId(rs.getInt("slotId"));
                slot.setStartTime(rs.getString("startTime"));
                slot.setEndTime(rs.getString("endTime"));
                list.add(slot);
            }
        } catch (Exception e) {
        }
        return list;
    }

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
    
    public static void main(String[] args) {
        Slot slot = new SlotDAO().getSlotbySlotId(1);
        System.out.println(slot.getStartTime().substring(0, 8));
    }
}
