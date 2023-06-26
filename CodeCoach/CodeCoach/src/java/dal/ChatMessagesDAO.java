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
import model.ChatMessages;

/**
 *
 * @author giang
 */
public class ChatMessagesDAO extends DBContext{
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<ChatMessages> getChatMessagesbySelectedChatRoomId(String selectedChatRoom) {
        List<ChatMessages> chatMessagess = new ArrayList<>();
        String query = "SELECT * FROM [ChatMessages] Where chatRoomId = "+selectedChatRoom+"";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);         
            rs = ps.executeQuery();
            while (rs.next()) {
                chatMessagess.add(new ChatMessages(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return chatMessagess;
    }
    
    public void insertChatMessage(String userId, String selectedChatRoomId, String message) {
        String query = "INSERT INTO ChatMessages([chatRoomId],[userId],[message],[sentDateTime]) VALUES("+selectedChatRoomId+","+userId+",'"+message+"',CURRENT_TIMESTAMP)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);         
            rs = ps.executeQuery();           
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
