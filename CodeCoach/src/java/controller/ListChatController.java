/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ChatRoomDAO;
import dal.ChatRoomUsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.ChatMessages;
import model.ChatRoom;
import dal.ChatMessagesDAO;
import dal.UserDAO;
import jakarta.servlet.http.HttpSession;
import model.Users;

/**
 *
 * @author giang
 */
@WebServlet(name = "ListChatController", urlPatterns = {"/listchat"})
public class ListChatController extends HttpServlet {

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
            out.println("<title>Servlet ListChatController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListChatController at " + request.getContextPath() + "</h1>");
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
        try {
            HttpSession session = request.getSession();
            Users u = (Users) session.getAttribute("users");
            String userId = Integer.toString(u.getUserId());
            if (userId != null) {
                List<ChatRoom> chatRooms = new ChatRoomDAO().getChatRoombyUserId(userId);
                request.setAttribute("chatRooms", chatRooms);
                String selectedChatRoomId = request.getParameter("chatRoomId");
                if (selectedChatRoomId != null) {
                    List<ChatMessages> listChatMessages = new ChatMessagesDAO().getChatMessagesbySelectedChatRoomId(selectedChatRoomId);
                    List<ChatRoom> listChatRooms = new ChatRoomDAO().getAllChatRoom();
                    List<Users> listUsers = new UserDAO().getAllUser();
                    request.setAttribute("listChatRooms", listChatRooms);
                    request.setAttribute("listChatMessages", listChatMessages);
                    request.setAttribute("selectedChatRoomId", selectedChatRoomId);
                    request.setAttribute("listUsers", listUsers);
                    request.setAttribute(userId, this);
                }
                request.getRequestDispatcher("listchat.jsp").forward(request, response);
            } else {
                response.sendRedirect("login");
            }

        } catch (Exception e) {
            response.sendRedirect("login");
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
        HttpSession session = request.getSession();
        Users u = (Users) session.getAttribute("users");
//        String userId = request.getParameter("userId");
//        out.print(u);
        String userId = Integer.toString(u.getUserId());
        if (userId != null) {
            String chatRoomId = request.getParameter("chatRoomId");
            String message = request.getParameter("message");
            new ChatMessagesDAO().insertChatMessage(userId, chatRoomId, message);
            response.sendRedirect("listchat?chatRoomId=" + chatRoomId);
        } else {
            response.sendRedirect("login");
        }
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
