/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.SkillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Skills;

/**
 *
 * @author Duy Thai
 */
@WebServlet(name = "LoadMoreSkillsController", urlPatterns = {"/loadskills"})
public class LoadMoreSkillsController extends HttpServlet {

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
        //get the amount of skills already have in dom
        String amount = request.getParameter("exist");
        try {
            //parse amount to int
            int iamount = Integer.parseInt(amount);
            //get list of skills which are not in dom yet
            SkillDAO skillDao = new SkillDAO();
            List<Skills> skillList = skillDao.getNext8(iamount);
            //print the structure of the html and return them
            PrintWriter out = response.getWriter();
            for (Skills s : skillList) {
                out.println("<div class=\"countskills col-12 col-md-4 col-lg-3\">\n"
                        + "                                <div class=\"large-col aos aos-init aos-animate\" data-aos=\"fade-up\">\n"
                        + "                                    <a href=\"\" class=\"large-col-image\">\n"
                        + "                                        <div class=\"image-col-merge\">\n"
                        + "                                            <img src=\"assets/images/skills/" + s.getSkillId() + ".png\" alt>\n"
                        + "                                            <div class=\"text-col\">\n"
                        + "                                                <h5>" + s.getSkillName() + "</h5>\n"
                        + "                                            </div>\n"
                        + "                                        </div>\n"
                        + "                                    </a>\n"
                        + "                                </div>\n"
                        + "                            </div>");
            }
        } catch (Exception e) {
            System.out.println(e);
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
        processRequest(request, response);
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
