/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.cloudinary.*;
import com.cloudinary.utils.ObjectUtils;
import dal.TinhThanhPhoDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import model.TinhThanhPho;
import model.Users;

/**
 *
 * @author MrTuan
 */
@MultipartConfig
public class MenteeProfileSetting extends HttpServlet {

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
            out.println("<title>Servlet MenteeProfileSetting</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MenteeProfileSetting at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        Users user = (Users) request.getSession().getAttribute("users");
        UserDAO userDAO = new UserDAO();
        TinhThanhPhoDAO dao = new TinhThanhPhoDAO();
        if (user != null) {
            List<TinhThanhPho> list = dao.getAllTinhThanhPho();
            List<Users> listUser = userDAO.getInforUserById(user.getUserId());
            request.setAttribute("listCity", list);
            request.setAttribute("userInf", listUser);
            for (Users users : listUser) {
                System.out.println(users.getAvatar());
            }
            request.getRequestDispatcher("/mentee/profilesetting.jsp").forward(request, response);
        }
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
        Users user = (Users) request.getSession().getAttribute("users");

        if (user != null) {
            Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                    "cloud_name", "ddrjnfihc",
                    "api_key", "295827132792413",
                    "api_secret", "SyPzR-EcBnCG-BSQ5298s4MC9LE"));
            cloudinary.config.secure = true;
            UserDAO userDAO = new UserDAO();
            List<Users> listUser = userDAO.getInforUserById(user.getUserId());
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String maqh = request.getParameter("district");
            Part filePart = request.getPart("image");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            filePart.write(request.getRealPath("image") + fileName);
            Map path = ObjectUtils.asMap(
                    "public_id", "Home/Images/UserProfile/" + user.getUserId(),
                    "overwrite", true,
                    "resource_type", "image"
            );
            Map uploadResult = cloudinary.uploader().upload(request.getRealPath("image") + fileName, path);
            filePart.delete();
            String geturl = uploadResult.get("secure_url").toString();
            userDAO.updateInforUserById(user.getUserId(), fname, lname, address, phone, maqh,geturl);
            response.sendRedirect("/codecoach/profilesetting-mentee");
//            request.setAttribute("userInf", listUser);
//            request.getRequestDispatcher("/profilesetting-mentee").forward(request, response);

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
