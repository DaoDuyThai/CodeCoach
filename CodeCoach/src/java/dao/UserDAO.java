/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import dal.DBContext;
import model.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ADMIN
 */
public class UserDAO extends DBContext {
    Connection c = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public Users checkLogin(String email, String password){
        try {
        String query = "Select * from Users where email = ? and password = ?";
        c = new DBContext().getConnection();
        ps = c.prepareStatement(query);
        ps.setString(1, email);
        ps.setString(2, password);
        rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getInt(1) ,rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getString(6), rs.getString(7),
                                    rs.getInt(8),rs.getInt(9), rs.getString(10), rs.getString(11), rs.getString(12));
                return u;
            }
            }
        catch (Exception e){
            e.printStackTrace();
        }
        return null;
        }
    public void changePassword(Users u){
        String upd = "Update Users where password= ? where email= ?";
        try{
        PreparedStatement st = c.prepareStatement(upd);
        st.setString(1, u.getEmail());
        st.setString(2, u.getPassword());
        st.executeUpdate();
    }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
