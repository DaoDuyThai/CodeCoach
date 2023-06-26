/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duy Thai
 */
public class ChatRoomUsers {

    private int chatRoomId;
    private int userId;

    public int getChatRoomId() {
        return chatRoomId;
    }

    public void setChatRoomId(int chatRoomId) {
        this.chatRoomId = chatRoomId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "ChatRoomUsers{" + "chatRoomId=" + chatRoomId + ", userId=" + userId + '}';
    }

    public ChatRoomUsers(int chatRoomId, int userId) {
        this.chatRoomId = chatRoomId;
        this.userId = userId;
    }

    public ChatRoomUsers() {
    }
}
