/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duy Thai
 */
public class ChatMessages {

    private int chatMessagesId;
    private int chatRoomId;
    private int userId;
    private String message;
    private String sentDateTime;

    public ChatMessages() {
    }

    public ChatMessages(int chatMessagesId, int chatRoomId, int userId, String message, String sentDateTime) {
        this.chatMessagesId = chatMessagesId;
        this.chatRoomId = chatRoomId;
        this.userId = userId;
        this.message = message;
        this.sentDateTime = sentDateTime;
    }

    @Override
    public String toString() {
        return "ChatMessages{" + "chatMessagesId=" + chatMessagesId + ", chatRoomId=" + chatRoomId + ", userId=" + userId + ", message=" + message + ", sentDateTime=" + sentDateTime + '}';
    }

    public int getChatMessagesId() {
        return chatMessagesId;
    }

    public void setChatMessagesId(int chatMessagesId) {
        this.chatMessagesId = chatMessagesId;
    }

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

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSentDateTime() {
        return sentDateTime;
    }

    public void setSentDateTime(String sentDateTime) {
        this.sentDateTime = sentDateTime;
    }

}
