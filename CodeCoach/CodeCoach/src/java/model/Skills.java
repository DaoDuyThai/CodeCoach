/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duy Thai
 */
public class Skills {
    private int skillId;
    private String skillName;
    private int subCategoryId;

    public Skills() {
    }

    public Skills(int skillId, String skillName, int subCategoryId) {
        this.skillId = skillId;
        this.skillName = skillName;
        this.subCategoryId = subCategoryId;
    }

    public int getSkillId() {
        return skillId;
    }

    public void setSkillId(int skillId) {
        this.skillId = skillId;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public int getSubCategoryId() {
        return subCategoryId;
    }

    public void setSubCategoryId(int subCategoryId) {
        this.subCategoryId = subCategoryId;
    }

    @Override
    public String toString() {
        return "Skills{" + "skillId=" + skillId + ", skillName=" + skillName + ", subCategoryId=" + subCategoryId + '}';
    }
    
}
