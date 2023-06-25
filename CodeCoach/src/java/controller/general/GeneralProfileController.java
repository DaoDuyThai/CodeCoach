/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.general;

import dal.TinhThanhPhoDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.TinhThanhPho;
import model.Users;

import java.io.IOException;
import java.util.List;

/**
 *
 * @author Duy Thai
 */
@WebServlet(name="GeneralProfileController", urlPatterns={"/general-profile"})
public class GeneralProfileController extends HttpServlet {


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
        request.getRequestDispatcher("profile-settings/general-profile.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fName = request.getParameter("first_name");
        String lName = request.getParameter("last_name");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phoneNum = request.getParameter("phone_number");
        String address = request.getParameter("address");
        String facebook = request.getParameter("facebook");
        String maqh = request.getParameter("district");
        Users user = new Users();
        if("".equals(maqh) || maqh == null)
            maqh = ((Users) request.getSession().getAttribute("users")).getMaqh();
        user.setMaqh(maqh);
        user.setfName(fName);
        user.setlName(lName);
        user.setPhoneNum(phoneNum);
        user.setAddress(address);
        user.setGender(gender);
        user.setEmail(email);
        user.setFacebook(facebook);
        user.setPassword(((Users) request.getSession().getAttribute("users")).getPassword());
        user.setUserId(((Users) request.getSession().getAttribute("users")).getUserId());
        user.setRoleId(((Users) request.getSession().getAttribute("users")).getRoleId());
        user.setStatusId(((Users) request.getSession().getAttribute("users")).getStatusId());
        UserDAO dao = new UserDAO();
        dao.updateUsers(user);
        HttpSession session = request.getSession();
        session.setAttribute("users", user);

        response.sendRedirect(request.getContextPath() + "/home");
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
