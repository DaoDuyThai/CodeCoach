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

/**
 *
 * @author dai nghia
 */
@WebServlet(name="MentorBookingDetailsController", urlPatterns={"/mentor-booking-details"})
public class MentorBookingDetailsController extends HttpServlet {


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

        String bookingID = request.getParameter("booking-id");

        ArrayList<BookingDetails> allBookingDetails = (ArrayList<BookingDetails>) new BookingDetailDAO().getAllBookingDetails();

        ArrayList<BookingDetails> bookingDetails = new ArrayList<>();

        for(BookingDetails bookingDetail : allBookingDetails){
            if(bookingDetail.getBookingId() == Integer.parseInt(bookingID)){
                bookingDetails.add(bookingDetail);
            }
        }

        request.setAttribute("bookingDetails", bookingDetails);
        request.getRequestDispatcher("booking/mentor-booking-details.jsp").forward(request, response);


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


