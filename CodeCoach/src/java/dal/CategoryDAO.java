/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Categories;
import model.SubCategories;

/**
 *
 * @author hoang
 */
public class CategoryDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public List<Categories> getAll() {
        List<Categories> list = new ArrayList<>();
        String querry = "Select * from Categories";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Categories(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }
     public List<SubCategories> getSubCategorybyCategoryId(String categoryId){
            List<SubCategories> listS = new ArrayList<>();
            String query = "select * from SubCategories where categoryId = ?";
            try{
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setString(1, categoryId);
                rs = ps.executeQuery();
                while(rs.next()){
                    listS.add(new SubCategories(rs.getInt(1), rs.getInt(2), rs.getString(3)));
                }              
            }
            catch(Exception e){              
            }
            return listS;
        }
     public String countCategory() {
        String query = "select count (categoryId) from Categories";
        String count = "None";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return count;
    }
     public String countSubCategory(String categoryId) {
        String query = "select count (subCategoryId) from SubCategories where categoryId = ?";
        String count = "None";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, categoryId);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return count;
    }
     
    
}
