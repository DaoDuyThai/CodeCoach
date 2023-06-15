/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duy Thai
 */
public class Mentors {

    private int mentorId;
    private int userId;
    private String bio;
    private String hourlyRate;
    
    private Users users;

    @Override
    public String toString() {
        return "Mentors{" + "mentorId=" + mentorId + ", userId=" + userId + ", bio=" + bio + ", hourlyRate=" + hourlyRate + '}';
    }

    public Mentors() {
    }

    public Mentors(int mentorId, int userId, String bio, String hourlyRate, Users users) {
        this.mentorId = mentorId;
        this.userId = userId;
        this.bio = bio;
        this.hourlyRate = hourlyRate;
        this.users = users;
    }


    

    public Mentors(int mentorId, int userId, String bio, String hourlyRate) {
        this.mentorId = mentorId;
        this.userId = userId;
        this.bio = bio;
        this.hourlyRate = hourlyRate;
    }

    public int getMentorId() {
        return mentorId;
    }

    public void setMentorId(int mentorId) {
        this.mentorId = mentorId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getHourlyRate() {
        return hourlyRate;
    }

    public void setHourlyRate(String hourlyRate) {
        this.hourlyRate = hourlyRate;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }
}
