/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import jakarta.servlet.jsp.jstl.sql.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hoang
 */
public class EmailDAO extends DBContext {
    
    Connection conn = null;
    PreparedStatement stm = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    public void addVerificationCode(String email, String code) {
        try {
            
            String sql = "UPDATE Users SET verification_code = ? WHERE email = ?";
            conn = new DBContext().getConnection();
//            PreparedStatement stm = connection.prepareStatement(sql);
            stm = conn.prepareStatement(sql);
            stm.setString(1, code);
            stm.setString(2, email);
            
            stm.executeUpdate();
            stm.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean verifyEmail(String email, String verificationToken) {
        try {
            // Tạo câu lệnh SQL để kiểm tra thông tin email và token
            String sql = "SELECT * FROM users WHERE email = ? AND verification_code = ?";
//            PreparedStatement statement = connection.prepareStatement(sql);
            conn = new DBContext().getConnection();
            stm = conn.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, verificationToken);

            // Thực thi câu lệnh SQL
            ResultSet resultSet = stm.executeQuery();

            // Kiểm tra kết quả trả về từ cơ sở dữ liệu
            if (resultSet.next()) {
                // Email và token hợp lệ, thực hiện xác minh email
                String updateSql = "UPDATE users SET statusId = 1, verification_code = null  \n"
                        + "WHERE email = ?";
                conn = new DBContext().getConnection();
                PreparedStatement statement = conn.prepareStatement(updateSql);
                statement.setString(1, email);

                // Thực thi câu lệnh SQL để cập nhật trạng thái xác minh email
                int rowsAffected = statement.executeUpdate();

                if (rowsAffected > 0) {
                    return true; // Email hợp lệ và đã được xác minh
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false; // Email không hợp lệ hoặc token không đúng
    }
    public String getTokenByEmail(String email){
        String token = null;
        try{
        String query = "SELECT verification_code FROM users WHERE email = ?";
           conn = new DBContext().getConnection();
           stmt = conn.prepareStatement(query);
           stmt.setString(1, email);
           rs = stmt.executeQuery();

            // Lấy token từ kết quả truy vấn
            if (rs.next()) {
              token = rs.getString("verification_code");
              System.out.println("Token: " + token);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return token;
    }

}
