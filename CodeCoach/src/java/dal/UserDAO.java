/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Roles;
import model.Users;

/**
 *
 * @author Duy Thai
 */
public class UserDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Roles> getAll() {
        List<Roles> list = new ArrayList<>();
        String querry = "select * from roles";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Roles(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }

        return list;
    }
    public Users checkLogin(String email, String password){
        try {
        String query = "Select * from Users where email =? and password =?";
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
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
    public void changePassword(Users u) throws Exception{
        
        String upd = "Update Users set password=?"
                + " where email=?";
        try{
        conn = new DBContext().getConnection();
        PreparedStatement st = conn.prepareStatement(upd);
        st.setString(1, u.getPassword());
        st.setString(2, u.getEmail());
        st.executeUpdate();
    }
        catch (SQLException e){
               System.out.println(e);
        }
    }

}
