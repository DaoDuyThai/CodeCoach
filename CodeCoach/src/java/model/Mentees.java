/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duy Thai
 */
public class Mentees {
    private int menteeId;
    private int userId;

    public Mentees() {
    }

    @Override
    public String toString() {
        return "Mentees{" + "menteeId=" + menteeId + ", userId=" + userId + '}';
    }

    public Mentees(int menteeId, int userId) {
        this.menteeId = menteeId;
        this.userId = userId;
    }

    public int getMenteeId() {
        return menteeId;
    }

    public void setMenteeId(int menteeId) {
        this.menteeId = menteeId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
}
