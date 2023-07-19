/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.mentor;

import dal.BookingDAO;
import dal.MentorDAO;
import dal.SlotDAO;
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
import model.SlotDTO;
import model.Users;

/**
 *
 * @author kienb
 */
@WebServlet(name="ViewInvoiceController", urlPatterns={"/ViewInvoice"})
public class ViewInvoiceController extends HttpServlet {
   
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
            String id = request.getParameter("id");
            BookingDAO bookingDAO = new BookingDAO();
            Booking booking = bookingDAO.getBookingbyId(Integer.parseInt(id));
            Users u ;
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("users");
            if(user.getRoleId() == 2){
               u =  new UserDAO().getUserById(booking.getMentee().getUserId());
            }
            else {
               u = new UserDAO().getUserById(booking.getMentor().getUserId());
            }
            int rate = Integer.parseInt(new MentorDAO().getMentorByMentorId(booking.getMentor().getMentorId()).getHourlyRate());
            SlotDAO slo = new SlotDAO();
            SlotDTO s = slo.getDataByBookingID(booking.getBookingId());
            request.setAttribute("rate", rate);
            request.setAttribute("mentor", u);
            request.setAttribute("totalDTO", s);
            request.setAttribute("booking", booking);
            request.getRequestDispatcher("ViewInvoice.jsp").forward(request, response);
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
