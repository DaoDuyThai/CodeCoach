/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.TinhThanhPhoDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;
import jakarta.servlet.annotation.WebServlet;
import java.util.List;
import model.TinhThanhPho;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/**
 *
 * @author NGHIA
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/register"})

public class RegisterController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TinhThanhPhoDAO dao = new TinhThanhPhoDAO();
        List<TinhThanhPho> list = dao.getAllTinhThanhPho();
        request.setAttribute("listCity", list);
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO cdb = new UserDAO();
        String fName = request.getParameter("first_name");
        String lName = request.getParameter("last_name");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phoneNum = request.getParameter("phone_number");
        String address = request.getParameter("address");
        String facebook = request.getParameter("facebook");
        String password = request.getParameter("password");
        String maqh = request.getParameter("district");
        String create = request.getParameter("create");
        Users user = new Users(fName, lName, gender, email, phoneNum, address, facebook, password);
        user.setMaqh(maqh);
        if (create != null) {
//          cdb.insert(user);
            // Generate random code
            String verificationCode = generateVerificationCode(6);

            // Send verification code to the user's email
            try {
                sendVerificationCode(email, verificationCode);
            } catch (Exception e) {
                response.sendRedirect("404error.jsp");
                return;
            }

            // Save the verification code in the session
            request.getSession().setAttribute("verificationCode", verificationCode);
            // Save the Users object in the session
            request.getSession().setAttribute("userRegister", user);

            request.getSession().setAttribute("verify", "true");
            request.getRequestDispatcher("verifycode").forward(request, response);

        }
        response.sendRedirect("login");
    }
    
    private String generateVerificationCode(int length) {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder code = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(chars.length());
            code.append(chars.charAt(index));
        }

        return code.toString();
    }

    private void sendVerificationCode(String email, String verificationCode) {
        final String from = "codecoach.project@gmail.com";
        final String password = "phtycutgjbgukddr";

        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new Authenticator() {
            private final String username = from;
            private final String userPassword = password;

            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, userPassword);
            }
        });

        try {
            String subject = "Verification of CodeCoach";
            String body = "Verification code of CodeCoach app is: " + verificationCode;

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject(subject);
            message.setText(body);

            // Gửi email
            Transport.send(message);
            System.out.println("Verification code of CodeCoach app is sent to email: " + email);
        } catch (MessagingException e) {
            // Xử lý ngoại lệ nếu có lỗi xảy ra trong quá trình gửi email
            System.err.println("Error sending verification code to email: " + email);
            e.printStackTrace();
        }
    }




    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
