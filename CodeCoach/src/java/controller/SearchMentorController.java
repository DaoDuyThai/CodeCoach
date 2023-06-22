/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.MentorDAO;
import dal.SkillDAO;
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
import model.Skills;

/**
 *
 * @author hoang
 */
@WebServlet(name="SearchMentorController", urlPatterns={"/searchmentor"})
public class SearchMentorController extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String skillId = request.getParameter("skillId");
        MentorDAO mdao = new MentorDAO();
        List<Integer> listMId = mdao.getMentorIdBySkillId(skillId);
        List<Object[]> listUInfo = new ArrayList<>();
        SkillDAO sdao = new SkillDAO();
        List<Skills> listS = sdao.getAll();
        for (Integer mentorId : listMId) {
            Object[] uInfo = mdao.getUserInfoByMentorId(mentorId);
            listUInfo.add(uInfo);
        }
        request.setAttribute("listM", listUInfo); // Truyền danh sách mentor cho JSP
        request.setAttribute("listS", listS);
        request.getRequestDispatcher("listmentor.jsp").forward(request, response);
        
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
