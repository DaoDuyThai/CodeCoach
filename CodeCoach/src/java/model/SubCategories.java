/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duy Thai
 */
public class SubCategories {
    private int subCategoryId;
    private int categoryId;
    private String subCategoryName;

    public SubCategories() {
    }

    public SubCategories(int subCategoryId, int categoryId, String subCategoryName) {
        this.subCategoryId = subCategoryId;
        this.categoryId = categoryId;
        this.subCategoryName = subCategoryName;
    }

    public int getSubCategoryId() {
        return subCategoryId;
    }

    public void setSubCategoryId(int subCategoryId) {
        this.subCategoryId = subCategoryId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getSubCategoryName() {
        return subCategoryName;
    }

    public void setSubCategoryName(String subCategoryName) {
        this.subCategoryName = subCategoryName;
    }

    @Override
    public String toString() {
        return "SubCategories{" + "subCategoryId=" + subCategoryId + ", categoryId=" + categoryId + ", subCategoryName=" + subCategoryName + '}';
    }
    
}
