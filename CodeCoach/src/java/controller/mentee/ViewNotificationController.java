/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.mentee;

import dal.BookingDAO;
import dal.MenteeNotificationDAO;
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
import model.Booking;
import model.Skills;
import model.Users;

/**
 *
 * @author kienb
 */
@WebServlet(name="ViewNotificationController", urlPatterns={"/ViewNotification"})
public class ViewNotificationController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Users u = (Users) session.getAttribute("users");
            String id = request.getParameter("id");
            BookingDAO bookingDAO = new BookingDAO();
            Booking booking = bookingDAO.getBookingbyId(Integer.parseInt(id));
            SkillDAO skillDAO = new SkillDAO();
            Skills skill = skillDAO.getSkillBySkillId(booking.getSkillId());
            Users sender = u.getUserId() == booking.getMentee().getUserId()? new UserDAO().getUserById(booking.getMentor().getUserId()) : 
                    new UserDAO().getUserById(booking.getMenteeId());
            int status = booking.getStatus().equals("Accepted") ? 1 : (booking.getStatus().equals("Rejected") ? 2 : 3);
            String name = sender.getfName() + " " + sender.getlName();
            request.setAttribute("name", name);
            request.setAttribute("status", status);
            request.setAttribute("booking", booking);
            request.setAttribute("skill", skill);
            request.setAttribute("sender", sender);
            request.getRequestDispatcher("ViewNotification.jsp").forward(request, response);
        }
    } 

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
        processRequest(request, response);
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
        processRequest(request, response);
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



