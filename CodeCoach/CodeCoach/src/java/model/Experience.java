/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duy Thai
 */
public class Experience {
    private int experienceId;
    private int mentorId;
    private String description;

    public Experience() {
    }

    @Override
    public String toString() {
        return "Experience{" + "experienceId=" + experienceId + ", mentorId=" + mentorId + ", description=" + description + '}';
    }

    public Experience(int experienceId, int mentorId, String description) {
        this.experienceId = experienceId;
        this.mentorId = mentorId;
        this.description = description;
    }

    public int getExperienceId() {
        return experienceId;
    }

    public void setExperienceId(int experienceId) {
        this.experienceId = experienceId;
    }

    public int getMentorId() {
        return mentorId;
    }

    public void setMentorId(int mentorId) {
        this.mentorId = mentorId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
}
