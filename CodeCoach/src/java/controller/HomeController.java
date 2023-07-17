/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ContactUsDAO;
import dal.MentorDAO;
import dal.SkillDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.ContactUs;
import model.Mentors;
import model.Skills;

/**
 *
 * @author Duy Thai
 */
@WebServlet(name = "HomeController", urlPatterns = {"/home"})
public class HomeController extends HttpServlet {

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
            out.println("<title>Servlet HomeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeController at " + request.getContextPath() + "</h1>");
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
        //get skills list
        SkillDAO skillDao = new SkillDAO();
        List<Skills> skillList = skillDao.getTop8();
        request.setAttribute("skillList", skillList);
        //get mentor list
        MentorDAO mentorDao = new MentorDAO();
        List<Mentors> mentorList = mentorDao.getAllMentor();
        request.setAttribute("mentorList", mentorList);
        //get Mentor user's info list
        UserDAO userDao = new UserDAO();
        List<Object[]> mentorInfoList = userDao.getAllUserInfoOfMentor();
        HttpSession session = request.getSession();
        List<ContactUs> listContactUs = new ContactUsDAO().getAll();
        String location = listContactUs.get(0).getInfor();
        String tel = listContactUs.get(1).getInfor();
        String email = listContactUs.get(2).getInfor();
        String website = listContactUs.get(3).getInfor();
        session.setAttribute("location", location);
        session.setAttribute("tel", tel);
        session.setAttribute("email", email);
        session.setAttribute("website", website);
        //set attribute and push to the page
        request.setAttribute("mentorInfoList", mentorInfoList);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
        processRequest(request, response);
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
