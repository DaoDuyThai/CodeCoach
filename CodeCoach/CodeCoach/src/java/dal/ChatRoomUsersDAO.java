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


/**
 *
 * @author giang
 */
public class ChatRoomUsersDAO extends DBContext{
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
   
    public List<Integer> listChatRoomIdbyUserId(String userId) {
        List<Integer> listChatRoom = new ArrayList<>();
        String query = "SELECT [chatRoomId] FROM [CodeCoach].[dbo].[ChatRoomUsers] WHERE userId="+userId+"";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);         
            rs = ps.executeQuery();
            while (rs.next()) {
                listChatRoom.add(rs.getInt(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }   
        return listChatRoom;
    }
}
