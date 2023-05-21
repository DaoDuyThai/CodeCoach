/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duy Thai
 */
public class Booking {

    private int bookingId;
    private int mentorId;
    private int menteeId;
    private int skillId;
    private String status;

    public Booking() {
    }

    public Booking(int bookingId, int mentorId, int menteeId, int skillId, String status) {
        this.bookingId = bookingId;
        this.mentorId = mentorId;
        this.menteeId = menteeId;
        this.skillId = skillId;
        this.status = status;
    }

    @Override
    public String toString() {
        return "Booking{" + "bookingId=" + bookingId + ", mentorId=" + mentorId + ", menteeId=" + menteeId + ", skillId=" + skillId + ", status=" + status + '}';
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getMentorId() {
        return mentorId;
    }

    public void setMentorId(int mentorId) {
        this.mentorId = mentorId;
    }

    public int getMenteeId() {
        return menteeId;
    }

    public void setMenteeId(int menteeId) {
        this.menteeId = menteeId;
    }

    public int getSkillId() {
        return skillId;
    }

    public void setSkillId(int skillId) {
        this.skillId = skillId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
