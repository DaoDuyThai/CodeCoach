package controller.booking;

import dal.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

@WebServlet(name="Book", urlPatterns={"/book"})
public class Book extends HttpServlet {

    private final String[] days = {"mon", "tue", "wed", "thu", "fri", "sat", "sun"};


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

        String mentorId = request.getParameter("mentor-id");
        String userId = request.getParameter("user-id");

        Mentors mentor = new MentorDAO().getMentorByMentorId(Integer.parseInt(mentorId));
        Users mentorUser = new UserDAO().getUserById(mentor.getUserId());

        ArrayList<Skills> skills = new SkillDAO().getSkillByMentorID(mentorId);

        Calendar calendar = Calendar.getInstance();
        Date now = calendar.getTime();
        request.setAttribute("now", now);
        request.setAttribute("startDate", Utilities.getStartDateOfWeek(calendar));
        request.setAttribute("mentor", mentorUser);
        request.setAttribute("mentorId", mentorId);
        request.setAttribute("userId", userId);
        request.setAttribute("skills", skills);
        request.getRequestDispatcher("booking/book.jsp").forward(request, response);

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
        String go = request.getParameter("go");

        if("changeDate".equals(go)){
            Date date = new Date(request.getParameter("startDate"));
            int incrementNumber = Integer.parseInt(request.getParameter("incrementNumber"));
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            // set the day to next week
            calendar.add(Calendar.DATE, incrementNumber);
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

            try(PrintWriter out = response.getWriter()){
                out.println("<ul>\n" +
                        "                        <li class=\"left-arrow\">\n" +
                        "                          <a href>\n" +
                        "                            <i class=\"fa fa-chevron-left\"></i>\n" +
                        "                          </a>\n" +
                        "                        </li>\n" +
                        "                        <li>\n" +
                        "                          <span>Mon</span>\n" +
                        "                          <span id=\"slot-date-mon\">" + dateFormat.format(calendar.getTime()) + "</span>\n" +
                        "                        </li>");
                calendar.add(Calendar.DATE, 1);
                out.println("<li>\n" +
                        "                          <span>Tue</span>\n" +
                        "                          <span id=\"slot-date-tue\">" + dateFormat.format(calendar.getTime()) + "</span>\n" +
                        "                        </li>");
                calendar.add(Calendar.DATE, 1);
                out.println("<li>\n" +
                        "                          <span>Wed</span>\n" +
                        "                          <span id=\"slot-date-wed\">" + dateFormat.format(calendar.getTime()) + "</span>\n" +
                        "                        </li>");
                calendar.add(Calendar.DATE, 1);
                out.println("<li>\n" +
                        "                          <span>Thu</span>\n" +
                        "                          <span id=\"slot-date-thu\">" + dateFormat.format(calendar.getTime()) + "</span>\n" +
                        "                        </li>");
                calendar.add(Calendar.DATE, 1);
                out.println("<li>\n" +
                        "                          <span>Fri</span>\n" +
                        "                          <span id=\"slot-date-fri\">" + dateFormat.format(calendar.getTime()) + "</span>\n" +
                        "                        </li>");
                calendar.add(Calendar.DATE, 1);
                out.println("<li>\n" +
                        "                          <span>Sat</span>\n" +
                        "                          <span id=\"slot-date-sat\">" + dateFormat.format(calendar.getTime()) + "</span>\n" +
                        "                        </li>");
                calendar.add(Calendar.DATE, 1);
                out.println("<li>\n" +
                        "                          <span>Sun</span>\n" +
                        "                          <span id=\"slot-date-sun\">" + dateFormat.format(calendar.getTime()) + "</span>\n" +
                        "                        </li>\n" +
                        "                        <li class=\"right-arrow\">\n" +
                        "                          <a href>\n" +
                        "                            <i class=\"fa fa-chevron-right\"></i>\n" +
                        "                          </a>\n" +
                        "                        </li>\n" +
                        "                      </ul>");

            }catch(Exception e){
                e.printStackTrace();
            }
        }
        else if ("changeSlotDate".equals(go)) {
            Date date = new Date(request.getParameter("startDate"));
            int incrementNumber = Integer.parseInt(request.getParameter("incrementNumber"));
            String mentorId = request.getParameter("mentorId");
            String skill = request.getParameter("skill");
            String userId = request.getParameter("userId");
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            // set the day to next week
            calendar.add(Calendar.DATE, incrementNumber);
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

            try(PrintWriter out = response.getWriter()){

                out.println("<div class=\"schedule-cont\">\n" +
                        "                                            <div class=\"row\">\n" +
                        "                                                <div class=\"col-md-12\">\n" +
                        "\n" +
                        "                                                    <div class=\"time-slot\">\n" +
                        "                                                        <ul class=\"clearfix\" style=\"text-align: center\">\n" +
                        "                                                            <li>\n" +

                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"mon-1\" id=\"mon-1\" value=\""+ dateFormat.format(calendar.getTime()) +"\">\n" +
                        "                                                                <label for=\"mon-1\">8:00 - 10:00 AM</label>\n" +
                        "                                                                <br>\n" +
                        "                                                                <input type=\"checkbox\" name=\"mon-2\" id=\"mon-2\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"mon-2\">10:00 - 12:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"mon-3\" id=\"mon-3\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"mon-3\">1:00 - 3:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"mon-4\" id=\"mon-4\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"mon-4\">3:00 - 5:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"mon-5\" id=\"mon-5\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"mon-5\">5:00 - 7:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"mon-6\" id=\"mon-6\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"mon-6\">7:00 - 9:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"mon-7\" id=\"mon-7\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"mon-7\">9:00 - 11:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                            </li>\n");
                calendar.add(Calendar.DATE, 1);
                out.println("                                                            <li>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"tue-1\" id=\"tue-1\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"tue-1\">8:00 - 10:00 AM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"tue-2\" id=\"tue-2\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"tue-2\">10:00 - 12:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"tue-3\" id=\"tue-3\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"tue-3\">1:00 - 3:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"tue-4\" id=\"tue-4\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"tue-4\">3:00 - 5:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"tue-5\" id=\"tue-5\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"tue-5\">5:00 - 7:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"tue-6\" id=\"tue-6\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"tue-6\">7:00 - 9:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"tue-7\" id=\"tue-7\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"tue-7\">9:00 - 11:00 PM</label>\n" +
                        "                                                                <br>\n");

                calendar.add(Calendar.DATE, 1);

                out.println("\n" +
                        "                                                            </li>\n" +
                        "                                                            <li>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"wed-1\" id=\"wed-1\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"wed-1\">8:00 - 10:00 AM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"wed-2\" id=\"wed-2\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"wed-2\">10:00 - 12:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"wed-3\" id=\"wed-3\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"wed-3\">1:00 - 3:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"wed-4\" id=\"wed-4\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"wed-4\">3:00 - 5:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"wed-5\" id=\"wed-5\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"wed-5\">5:00 - 7:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"wed-6\" id=\"wed-6\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"wed-6\">7:00 - 9:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"wed-7\" id=\"wed-7\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"wed-7\">9:00 - 11:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "\n" +
                        "                                                            </li>\n");

                calendar.add(Calendar.DATE, 1);


                out.println("<li>\n" +
                        "\n" +
                        "                                                                    <input type=\"checkbox\" name=\"thu-1\" id=\"thu-1\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                    <label for=\"thu-1\">8:00 - 10:00 AM</label>\n" +
                        "                                                                    <br>\n" +
                        "\n" +
                        "                                                                    <input type=\"checkbox\" name=\"thu-2\" id=\"thu-2\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                    <label for=\"thu-2\">10:00 - 12:00 PM</label>\n" +
                        "                                                                    <br>\n" +
                        "\n" +
                        "                                                                    <input type=\"checkbox\" name=\"thu-3\" id=\"thu-3\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                    <label for=\"thu-3\">1:00 - 3:00 PM</label>\n" +
                        "                                                                    <br>\n" +
                        "\n" +
                        "                                                                    <input type=\"checkbox\" name=\"thu-4\" id=\"thu-4\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                    <label for=\"thu-4\">3:00 - 5:00 PM</label>\n" +
                        "                                                                    <br>\n" +
                        "\n" +
                        "                                                                    <input type=\"checkbox\" name=\"thu-5\" id=\"thu-5\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                    <label for=\"thu-5\">5:00 - 7:00 PM</label>\n" +
                        "                                                                    <br>\n" +
                        "\n" +
                        "                                                                    <input type=\"checkbox\" name=\"thu-6\" id=\"thu-6\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                    <label for=\"thu-6\">7:00 - 9:00 PM</label>\n" +
                        "                                                                    <br>\n" +
                        "\n" +
                        "                                                                    <input type=\"checkbox\" name=\"thu-7\" id=\"thu-7\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                    <label for=\"thu-7\">9:00 - 11:00 PM</label>\n" +
                        "                                                                    <br>\n" +
                        "\n" +
                        "\n" +
                        "                                                                </li>");
                calendar.add(Calendar.DATE, 1);
                out.println("                                                            <li>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"fri-1\" id=\"fri-1\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"fri-1\">8:00 - 10:00 AM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"fri-2\" id=\"fri-2\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"fri-2\">10:00 - 12:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"fri-3\" id=\"fri-3\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"fri-3\">1:00 - 3:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"fri-4\" id=\"fri-4\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"fri-4\">3:00 - 5:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"fri-5\" id=\"fri-5\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"fri-5\">5:00 - 7:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"fri-6\" id=\"fri-6\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"fri-6\">7:00 - 9:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"fri-7\" id=\"fri-7\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"fri-7\">9:00 - 11:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                            </li>\n");
                calendar.add(Calendar.DATE, 1);
                out.println("                                                            <li>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"sat-1\" id=\"sat-1\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"sat-1\">8:00 - 10:00 AM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"sat-2\" id=\"sat-2\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"sat-2\">10:00 - 12:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"sat-3\" id=\"sat-3\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"sat-3\">1:00 - 3:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"sat-4\" id=\"sat-4\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"sat-4\">3:00 - 5:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"sat-5\" id=\"sat-5\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"sat-5\">5:00 - 7:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"sat-6\" id=\"sat-6\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"sat-6\">7:00 - 9:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "                                                                <input type=\"checkbox\" name=\"sat-7\" id=\"sat-7\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                <label for=\"sat-7\">9:00 - 11:00 PM</label>\n" +
                        "                                                                <br>\n" +
                        "\n" +
                        "\n" +
                        "                                                            </li>\n");
                calendar.add(Calendar.DATE, 1);
                out.println("<li>\n" +
                        "\n" +
                        "                                                                    <input type=\"checkbox\" name=\"sun-1\" id=\"sun-1\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                    <label for=\"sun-1\">8:00 - 10:00 AM</label>\n" +
                        "                                                                    <br>\n" +
                        "\n" +
                        "                                                                    <input type=\"checkbox\" name=\"sun-2\" id=\"sun-2\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                    <label for=\"sun-2\">10:00 - 12:00 PM</label>\n" +
                        "                                                                    <br>\n" +
                        "\n" +
                        "                                                                    <input type=\"checkbox\" name=\"sun-3\" id=\"sun-3\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                    <label for=\"sun-3\">1:00 - 3:00 PM</label>\n" +
                        "                                                                    <br>\n" +
                        "\n" +
                        "                                                                    <input type=\"checkbox\" name=\"sun-4\" id=\"sun-4\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                    <label for=\"sun-4\">3:00 - 5:00 PM</label>\n" +
                        "                                                                    <br>\n" +
                        "\n" +
                        "                                                                    <input type=\"checkbox\" name=\"sun-5\" id=\"sun-5\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                    <label for=\"sun-5\">5:00 - 7:00 PM</label>\n" +
                        "                                                                    <br>\n" +
                        "\n" +
                        "                                                                    <input type=\"checkbox\" name=\"sun-6\" id=\"sun-6\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                    <label for=\"sun-6\">7:00 - 9:00 PM</label>\n" +
                        "                                                                    <br>\n" +
                        "\n" +
                        "                                                                    <input type=\"checkbox\" name=\"sun-7\" id=\"sun-7\" value=\""+dateFormat.format(calendar.getTime())+"\">\n" +
                        "                                                                    <label for=\"sun-7\">9:00 - 11:00 PM</label>\n" +
                        "                                                                    <br>\n" +
                        "                                                                </li>\n" +
                        "                                                            </ul>");


            } catch(Exception e){
                e.printStackTrace();
            }

        }
        else if("book-time".equals(go)){
            int mentorId = Integer.parseInt(request.getParameter("mentor-id"));
            int userId = ((Users) request.getSession().getAttribute("users")).getUserId();
            int skillId = Integer.parseInt(request.getParameter("skill"));
            int menteeId = ((Users) request.getSession().getAttribute("users")).getUserId();

            Booking booking = new Booking(mentorId, menteeId, skillId, "Pending");

            System.out.println(new BookingDAO().addBooking(booking) + " rows affected");
            int bookingId = new BookingDAO().getBookingIdByBooking(booking);
            for(String day : days){
                for(int i = 1; i <= 7; i++){
                    String slot = request.getParameter(day + "-" + i);
                    if(slot != null){
                        BookingDetails bookingDetails = new BookingDetails(bookingId, i, BookingDetailDAO.formatDate(slot));
                        if(new BookingDetailDAO().isBookingDetailsExisted(bookingDetails, mentorId))
                        {
                            System.out.println("booking existed" + bookingDetails + " " + mentorId);
                            System.out.println(new BookingDetailDAO().deleteByBookingDetailsID(bookingId) + " booking details deleted");
                            System.out.println(new BookingDAO().deleteBooking(bookingId) + " booking deleted");
                            request.getSession().setAttribute("error", "Booking existed Date: " + bookingDetails.getDate() + " Slot: " + bookingDetails.getSlotId());
                            response.sendRedirect("book?mentor-id=" + mentorId + "&user-id=" + userId);
                            return;
                        }
                        int result = new BookingDetailDAO().addBookingDetail(bookingDetails);
                    }
                }
            }

            Notifications notification = new Notifications();
            int userId1 = new MentorDAO().getUserByMentorID(String.valueOf(mentorId)).getUserId();
            notification.setUserId(userId1);
            notification.setContent("You have a new booking request");
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            notification.setDateTime(dateFormat.format(new Date()));
            notification.setStatus("Pending");
            notification.setType("Booking");
            notification.setBookingId(new BookingDAO().getLatestBookingID());
            new NotificationDAO().addNotification(notification);       
        
            notification.setUserId(new MenteeDAO().getUserIdByMenteeId(menteeId));
            new NotificationDAO().addNotification(notification);   

            response.sendRedirect("invoice-controller?booking-id=" + bookingId + "&mentor-id=" + mentorId);
        }



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

