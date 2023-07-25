/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentee;

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

/**
 *
 * @author Duy Thai
 */
@WebServlet(name = "MenteeDashboardController", urlPatterns = {"/menteedashboard"})
public class MenteeDashboardController extends HttpServlet {

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
            out.println("<title>Servlet MenteeDashboardController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MenteeDashboardController at " + request.getContextPath() + "</h1>");
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
        //get session
        HttpSession session = request.getSession();
        //create daos
        MenteeDAO menteeDao = new MenteeDAO();
        BookingDAO bookingDao = new BookingDAO();
        BookingDetailDAO bookingDetailDao = new BookingDetailDAO();

        //get user from login session
        Users user = (Users) session.getAttribute("users");
        try {
            if (user == null) {
                response.sendRedirect("accessdeniedfull.jsp");
            } else {
                //get menteeId from user id 
                int menteeId = Integer.parseInt(menteeDao.getMenteeIdbyUserId(Integer.toString(user.getUserId())));
                //get total accepted booking
                int totalAcceptedBooking = bookingDao.getTotalAcceptedBookingByMenteeId(menteeId);
                //get total accepted slots
                int totalSlot = bookingDetailDao.getTotalBookingSlotByMenteeId(menteeId);
                //get total pending booking
                int totalPendingBooking = bookingDao.getTotalPendingBookingByMenteeId(menteeId);
                //get total spendings
                int totalSpending = bookingDao.getTotalMoneySpentByMenteeId(menteeId);
                //get monthly spending
                //get total booking by each month and set attributes
                int jan = bookingDetailDao.getMonthlyMoneySpentByMenteeId(menteeId, 2023, 1);
                request.setAttribute("jan", jan);
                int feb = bookingDetailDao.getMonthlyMoneySpentByMenteeId(menteeId, 2023, 2);
                request.setAttribute("feb", feb);
                int mar = bookingDetailDao.getMonthlyMoneySpentByMenteeId(menteeId, 2023, 3);
                request.setAttribute("mar", mar);
                int apr = bookingDetailDao.getMonthlyMoneySpentByMenteeId(menteeId, 2023, 4);
                request.setAttribute("apr", apr);
                int may = bookingDetailDao.getMonthlyMoneySpentByMenteeId(menteeId, 2023, 5);
                request.setAttribute("may", may);
                int jun = bookingDetailDao.getMonthlyMoneySpentByMenteeId(menteeId, 2023, 6);
                request.setAttribute("jun", jun);
                int jul = bookingDetailDao.getMonthlyMoneySpentByMenteeId(menteeId, 2023, 7);
                request.setAttribute("jul", jul);
                int aug = bookingDetailDao.getMonthlyMoneySpentByMenteeId(menteeId, 2023, 8);
                request.setAttribute("aug", aug);
                int sep = bookingDetailDao.getMonthlyMoneySpentByMenteeId(menteeId, 2023, 9);
                request.setAttribute("sep", sep);
                int oct = bookingDetailDao.getMonthlyMoneySpentByMenteeId(menteeId, 2023, 10);
                request.setAttribute("oct", oct);
                int nov = bookingDetailDao.getMonthlyMoneySpentByMenteeId(menteeId, 2023, 11);
                request.setAttribute("nov", nov);
                int dec = bookingDetailDao.getMonthlyMoneySpentByMenteeId(menteeId, 2023, 12);
                request.setAttribute("dec", dec);

                //set data to jsp
                request.setAttribute("totalAcceptedBooking", totalAcceptedBooking);
                request.setAttribute("totalSlot", totalSlot);
                request.setAttribute("totalPendingBooking", totalPendingBooking);
                request.setAttribute("totalSpending", totalSpending);

                //send data to jsp
                request.getRequestDispatcher("menteedashboard.jsp").forward(request, response);
            }

        } catch (Exception e) {
            System.out.println(e);
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
