/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duy Thai
 */
public class MenteeInterests {

    private int menteeInterestId;
    private int menteeId;
    private int categoryId;
    private int subCategoryId;
    private int skillId;

    public MenteeInterests() {
    }

    public MenteeInterests(int menteeInterestId, int menteeId, int categoryId, int subCategoryId, int skillId) {
        this.menteeInterestId = menteeInterestId;
        this.menteeId = menteeId;
        this.categoryId = categoryId;
        this.subCategoryId = subCategoryId;
        this.skillId = skillId;
    }

    public int getMenteeInterestId() {
        return menteeInterestId;
    }

    public void setMenteeInterestId(int menteeInterestId) {
        this.menteeInterestId = menteeInterestId;
    }

    public int getMenteeId() {
        return menteeId;
    }

    public void setMenteeId(int menteeId) {
        this.menteeId = menteeId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getSubCategoryId() {
        return subCategoryId;
    }

    public void setSubCategoryId(int subCategoryId) {
        this.subCategoryId = subCategoryId;
    }

    public int getSkillId() {
        return skillId;
    }

    public void setSkillId(int skillId) {
        this.skillId = skillId;
    }

    @Override
    public String toString() {
        return "MenteeInterests{" + "menteeInterestId=" + menteeInterestId + ", menteeId=" + menteeId + ", categoryId=" + categoryId + ", subCategoryId=" + subCategoryId + ", skillId=" + skillId + '}';
    }

}
