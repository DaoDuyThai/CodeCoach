/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.booking;

import dal.BookingDAO;
import dal.BookingDetailDAO;
import dal.MentorDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Booking;
import model.BookingDetails;
import model.Mentors;
import model.Users;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dai nghia
 */
@WebServlet(name="MenteeBookings", urlPatterns={"/mentee-bookings"})
public class MenteeBookings extends HttpServlet {


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

        String go = request.getParameter("go");
        if(go == null){
            List<Booking> menteeBookings = new BookingDAO().getBookingsByMenteeId(((Users)request.getSession().getAttribute("users")).getUserId());
            request.setAttribute("menteeBookings", menteeBookings);
            request.getRequestDispatcher("booking/mentee-booking.jsp").forward(request, response);
        }
        if("Remove".equals(go)){
            String status = request.getParameter("status");
            String bookingId = request.getParameter("booking-id");

            new BookingDAO().updateBookingStatus(Integer.parseInt(bookingId), status);

            System.out.println("Remove booking id: " + bookingId);
            response.sendRedirect("mentee-bookings");
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



