/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.BookingDAO;
import dal.BookingDetailDAO;
import dal.MenteeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;
import dal.MentorDAO;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import model.BookingDetails;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="MentorDashboardController", urlPatterns={"/mentordashboard"})
public class MentorDashboardController extends HttpServlet {
   
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
            out.println("<title>Servlet MentorDashboardController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MentorDashboardController at " + request.getContextPath () + "</h1>");
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
        //get session
        HttpSession session = request.getSession();
        //create daos
        MenteeDAO menteeDao = new MenteeDAO();
        BookingDAO bookingDao = new BookingDAO();
        BookingDetailDAO bookingDetailDao = new BookingDetailDAO();
        MentorDAO mentorDao = new MentorDAO();

        //get user from login session
        Users user = (Users) session.getAttribute("users");
        int userId = user.getUserId();
        try {
            if (user == null) {
                response.sendRedirect("accessdeniedfull.jsp");
            } else {
                //get menteeId from user id 
                int mentorId = mentorDao.getMentorIdByUserId(userId, 0);
                //get total number of mentees
                int menteeNumber = menteeDao.getTotalMenteeByMentorId(mentorId);
                //get total accepted booking
                int totalAppointment = bookingDao.getTotalBookingByMentorId(mentorId);
                //get total spendings
                int totalIncome = bookingDao.getTotalMoneyEarnByMentorId(mentorId);
                //get booking info
                List<Object> infoList = bookingDao.getBookingInfoByMentorId(mentorId);
                //set data to jsp
                request.setAttribute("totalMentee", menteeNumber);
                request.setAttribute("totalAppointment", totalAppointment);
                request.setAttribute("totalIncome", totalIncome);
                request.setAttribute("BookingInfo", infoList);
                
                 // Retrieve booking details for the mentor
                List<BookingDetails> bookingDetails = bookingDetailDao.getBookingDetailbyMentorId(mentorId);

                // Set booking details in the request attributes
                request.setAttribute("bookingDetails", bookingDetails);


                //send data to jsp
                request.getRequestDispatcher("mentordashboard.jsp").forward(request, response);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
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
