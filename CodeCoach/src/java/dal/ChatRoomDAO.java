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
import model.ChatRoom;

/**
 *
 * @author giang
 */
public class ChatRoomDAO extends DBContext{
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<ChatRoom> getChatRoombyUserId(String userId) {
        List<ChatRoom> chatRooms = new ArrayList<>();
        String query = "SELECT cr.chatRoomId, cr.chatRoomName FROM ChatRoom cr INNER JOIN ChatMessages cm ON cr.chatRoomId = cm.chatRoomId WHERE cm.userId = "+userId+" GROUP BY cr.chatRoomId, cr.chatRoomName ORDER BY MAX(cm.sentDateTime) DESC;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);         
            rs = ps.executeQuery();
            while (rs.next()) {
                chatRooms.add(new ChatRoom(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return chatRooms;
    }
    
    public static void main(String[] args) {
         List<ChatRoom> listChatRoom =  new ChatRoomDAO().getChatRoombyUserId("3");
         System.out.println(listChatRoom.size());
    }
    
    public List<ChatRoom> getAllChatRoom() {
        List<ChatRoom> chatRooms = new ArrayList<>();
        String query = "Select * From ChatRoom";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);         
            rs = ps.executeQuery();
            while (rs.next()) {
                chatRooms.add(new ChatRoom(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }     
        return chatRooms;
    }
    
    public void insertChatRoom(String mentorName, String menteeName) {
        String query = "INSERT INTO ChatRoom ([chatRoomName]) VALUES ('"+mentorName+" - "+menteeName+"')";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);         
            rs = ps.executeQuery();
            
        } catch (Exception e) {
            e.printStackTrace();
        }         
    }
    
    public int getLatestChatRoomId() {
        int chatRoomId=0;
        String query = "Select MAX(chatRoomId) from ChatRoom";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);         
            rs = ps.executeQuery();
            while (rs.next()) {
                chatRoomId = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return chatRoomId;
    }
}
