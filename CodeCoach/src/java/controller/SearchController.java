/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.MentorDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Mentors;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="SearchMentorController", urlPatterns={"/search"})
public class SearchController extends HttpServlet {
   
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
        String searchTxt = request.getParameter("searchTxt");
        MentorDAO mentorDAO = new MentorDAO();
        List<Integer> mentorIds = mentorDAO.getMentorIdBySearch(searchTxt);

        List<Object> mentorInformationList = new ArrayList<>();
        try{
        if (searchTxt!= null){
        for (Integer mentorId : mentorIds) {
             List<Object> mentorInformation = mentorDAO.getMentorInformationByIdFromSearch(mentorId);
            mentorInformationList.add(mentorInformation);
        }
        request.setAttribute("mentors", mentorInformationList);
        request.getRequestDispatcher("search.jsp").forward(request, response);
        }
        else {response.sendRedirect(request.getContextPath());}

        }
        catch (Exception e){
            System.err.println(e);
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
        String searchTxt = request.getParameter("searchTxt");
        MentorDAO mentorDAO = new MentorDAO();
        List<Integer> mentorIds = mentorDAO.getMentorIdBySearch(searchTxt);

        List<Object> mentorInformationList = new ArrayList<>();
        try{
        if (searchTxt!= null){
        for (Integer mentorId : mentorIds) {
             List<Object> mentorInformation = mentorDAO.getMentorInformationByIdFromSearch(mentorId);
            mentorInformationList.add(mentorInformation);
        }
        request.setAttribute("mentors", mentorInformationList);
        request.getRequestDispatcher("search.jsp").forward(request, response);
        }
        else {response.sendRedirect(request.getContextPath());}
        
        }
        catch (Exception e){
            System.err.println(e);
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
