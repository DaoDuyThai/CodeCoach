/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duy Thai
 */
public class ChatRoom {

    private int chatRoomId;
    private String chatRoomName;

    public ChatRoom() {
    }

    @Override
    public String toString() {
        return "ChatRoom{" + "chatRoomId=" + chatRoomId + ", chatRoomName=" + chatRoomName + '}';
    }

    public ChatRoom(int chatRoomId, String chatRoomName) {
        this.chatRoomId = chatRoomId;
        this.chatRoomName = chatRoomName;
    }

    public int getChatRoomId() {
        return chatRoomId;
    }

    public void setChatRoomId(int chatRoomId) {
        this.chatRoomId = chatRoomId;
    }

    public String getChatRoomName() {
        return chatRoomName;
    }

    public void setChatRoomName(String chatRoomName) {
        this.chatRoomName = chatRoomName;
    }

}
