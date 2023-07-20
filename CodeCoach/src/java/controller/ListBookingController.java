/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Booking;
import dal.BookingDAO;
import dal.BookingDetailDAO;
import dal.MenteeDAO;
import dal.MentorDAO;
import dal.SkillDAO;
import model.BookingDetails;
import model.Mentees;
import model.Mentors;
import model.Skills;

/**
 *
 * @author giang
 */
@WebServlet(name="ListBookingController", urlPatterns={"/listbooking"})
public class ListBookingController extends HttpServlet {
   
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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListBookingController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListBookingController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        List<Booking> listBookings = new BookingDAO().getAllBooking();
        List<BookingDetails> listBookingDetails = new BookingDetailDAO().getAllBookingDetails();
        List<Skills> listSkills = new SkillDAO().getAllSkill();
        List<Mentors> listMentors = new MentorDAO().getAllMentor();
        List<Mentees> listMentees = new MenteeDAO().getAllMentee();
        request.setAttribute("listMentors", listMentors);
        request.setAttribute("listMentees", listMentees);
        request.setAttribute("listSkills", listSkills);
        request.setAttribute("listBookings", listBookings);
        request.setAttribute("listBookingDetails", listBookingDetails);
        request.getRequestDispatcher("listbooking.jsp").forward(request, response);
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



