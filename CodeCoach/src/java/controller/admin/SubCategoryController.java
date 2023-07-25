/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dal.CategoryDAO;
import dal.SkillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Categories;
import model.Skills;
import model.SubCategories;

/**
 *
 * @author hoang
 */
@WebServlet(name="SubCategoryController", urlPatterns={"/subcategory"})
public class SubCategoryController extends HttpServlet {
   
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
        String categoryId = request.getParameter("categoryId");   
        List<SubCategories> listS = new CategoryDAO().getSubCategorybyCategoryId(categoryId);
        String countSubCategory = new CategoryDAO().countSubCategory(categoryId);
        request.setAttribute("countSubCategory", countSubCategory);
        request.setAttribute("listS", listS);      
        List<Categories> listCategories = new CategoryDAO().getAll();
        request.setAttribute("listCategories", listCategories);
        request.getRequestDispatcher("subcategory.jsp").forward(request, response);
        
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
        
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String subCategoryName = request.getParameter("subCategoryName");
        SubCategories sub = new SubCategories(categoryId, subCategoryName);
        CategoryDAO categoryDao = new CategoryDAO();
        categoryDao.insertSubCategory(sub); 
        String redirectURL = "subcategory?categoryId=" + categoryId;
        response.sendRedirect(redirectURL);

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
