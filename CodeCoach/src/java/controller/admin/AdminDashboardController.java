/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.BookingDetailDAO;
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
import java.util.List;

/**
 *
 * @author Duy Thai
 */
@WebServlet(name = "AdminDashboardController", urlPatterns = {"/admindashboard"})
public class AdminDashboardController extends HttpServlet {

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
            out.println("<title>Servlet AdminDashboardController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminDashboardController at " + request.getContextPath() + "</h1>");
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
        //create daos
        UserDAO userDao = new UserDAO();
        SkillDAO skillDao = new SkillDAO();
        BookingDetailDAO bookingDetailDao = new BookingDetailDAO();
        MentorDAO mentorDao = new MentorDAO();
        //get total mentor
        int totalMentor = userDao.getTotalUserByRoleId(2);
        //get total mentee
        int totalMentee = userDao.getTotalUserByRoleId(3);
        //get total skill
        int totalSkill = skillDao.getTotalSkill();
        //get total users
        int totalUsers = userDao.getTotalUsers();
        //get total booking by each month and set attributes
        int jan = bookingDetailDao.countBookingsByYearAndMonth(2023, 1);
        request.setAttribute("jan", jan);
        int feb = bookingDetailDao.countBookingsByYearAndMonth(2023, 2);
        request.setAttribute("feb", feb);
        int mar = bookingDetailDao.countBookingsByYearAndMonth(2023, 3);
        request.setAttribute("mar", mar);
        int apr = bookingDetailDao.countBookingsByYearAndMonth(2023, 4);
        request.setAttribute("apr", apr);
        int may = bookingDetailDao.countBookingsByYearAndMonth(2023, 5);
        request.setAttribute("may", may);
        int jun = bookingDetailDao.countBookingsByYearAndMonth(2023, 6);
        request.setAttribute("jun", jun);
        int jul = bookingDetailDao.countBookingsByYearAndMonth(2023, 7);
        request.setAttribute("jul", jul);
        int aug = bookingDetailDao.countBookingsByYearAndMonth(2023, 8);
        request.setAttribute("aug", aug);
        int sep = bookingDetailDao.countBookingsByYearAndMonth(2023, 9);
        request.setAttribute("sep", sep);
        int oct = bookingDetailDao.countBookingsByYearAndMonth(2023, 10);
        request.setAttribute("oct", oct);
        int nov = bookingDetailDao.countBookingsByYearAndMonth(2023, 11);
        request.setAttribute("nov", nov);
        int dec = bookingDetailDao.countBookingsByYearAndMonth(2023, 12);
        request.setAttribute("dec", dec);
        //get top 5 most loved technology
        List<Object[]> listSkillOccurrence = skillDao.getTop5MostBookedSkills();
        //get top booked mentor
        List<Object[]> listMentorOccurence = mentorDao.getTop5MostBookedMentors();
        //send attributes
        request.setAttribute("totalMentor", totalMentor);
        request.setAttribute("totalMentee", totalMentee);
        request.setAttribute("totalSkill", totalSkill);
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("listSkillOccurrence", listSkillOccurrence);
        request.setAttribute("listMentorOccurence", listMentorOccurence);
        request.getRequestDispatcher("admindashboard.jsp").forward(request, response);
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
