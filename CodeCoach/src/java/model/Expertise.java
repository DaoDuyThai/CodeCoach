/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duy Thai
 */
public class Expertise {

    private int expertiseId;
    private int mentorId;
    private int skillId;

    public Expertise() {
    }

    public Expertise(int expertiseId, int mentorId, int skillId) {
        this.expertiseId = expertiseId;
        this.mentorId = mentorId;
        this.skillId = skillId;
    }

    @Override
    public String toString() {
        return "Expertise{" + "expertiseId=" + expertiseId + ", mentorId=" + mentorId + ", skillId=" + skillId + '}';
    }

    public int getExpertiseId() {
        return expertiseId;
    }

    public void setExpertiseId(int expertiseId) {
        this.expertiseId = expertiseId;
    }

    public int getMentorId() {
        return mentorId;
    }

    public void setMentorId(int mentorId) {
        this.mentorId = mentorId;
    }

    public int getSkillId() {
        return skillId;
    }

    public void setSkillId(int skillId) {
        this.skillId = skillId;
    }

}
