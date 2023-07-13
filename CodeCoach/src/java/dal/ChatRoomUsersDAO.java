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
    
    public void insertChatRoomUser(int chatRoomId, int userId) {
        String query = "INSERT INTO [ChatRoomUsers]([chatRoomId],[userId]) VALUES ("+chatRoomId+","+userId+")";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);         
            rs = ps.executeQuery();
            
        } catch (Exception e) {
            e.printStackTrace();
        }   
    }
    
    public int getSharedChatRoomIdbyId(int userId1, int userId2) {
        int chatRoomId = 0;
        String query = "SELECT chatRoomId FROM [ChatRoomUsers] WHERE userId IN ("+userId1+", "+userId2+") GROUP BY chatRoomId HAVING COUNT(DISTINCT userId) = 2";
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
        return  chatRoomId;
    }
    

}
