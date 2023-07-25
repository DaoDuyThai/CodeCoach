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

import static java.sql.DriverManager.getConnection;

/**
 *
 * @author hoang
 */
public class CategoryDAO extends DBContext{
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

    private static final String GET_CATEGORY_BY_SUBCATEGORYID_SQL = "SELECT c.categoryId\n" +
            "FROM Categories c\n" +
            "         JOIN SubCategories sc ON c.categoryId = sc.categoryId\n" +
            "WHERE sc.subCategoryId = ?;";

    public int getCategoryIdBySubCategoryID(int subCategoryId) {
        try (PreparedStatement preparedStatement = getConnection().prepareStatement(GET_CATEGORY_BY_SUBCATEGORYID_SQL)) {
            preparedStatement.setInt(1, subCategoryId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                return rs.getInt("categoryId");
            }
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
        return 0;
    }
    public void InsertCategory(Categories ct) {
        String query = "INSERT INTO Categories (categoryName) VALUES (?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ct.getCategoryName());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void updateCategory(Categories ct) {
        String query = "update Categories set categoryName = ? where categoryId = ?";
        try {
            conn = new DBContext().getConnection();
            PreparedStatement st = conn.prepareStatement(query);
            st.setString(1, ct.getCategoryName());
            st.setInt(2, ct.getCategoryId());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public void insertSubCategory(SubCategories sub) {
        String query = "INSERT INTO [dbo].[SubCategories]\n"
                + "           ([categoryId]\n"
                + "           ,[subCategoryName])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        try {
            conn = new DBContext().getConnection();
            PreparedStatement st = conn.prepareStatement(query);
            st.setInt(1, sub.getCategoryId());
            st.setString(2, sub.getSubCategoryName());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public void updateSubCategory(SubCategories sub) {
        String query = "update SubCategories set subCategoryName = ? where subCategoryId = ? and categoryId = ?";
        try {
            conn = new DBContext().getConnection();
            PreparedStatement st = conn.prepareStatement(query);
            st.setString(1, sub.getSubCategoryName());
            st.setInt(2, sub.getSubCategoryId());
            st.setInt(3, sub.getCategoryId());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public List<SubCategories> getAllSubCategories() {
        List<SubCategories> list = new ArrayList<>();
        String querry = "Select * from SubCategories";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SubCategories(rs.getInt(1),rs.getInt(2),rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }
}
