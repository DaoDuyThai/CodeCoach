/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.mentee;

import dal.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.MenteeInterests;
import model.Skills;
import model.TinhThanhPho;
import model.Users;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Duy Thai
 */
@WebServlet(name="MenteeProfileController", urlPatterns={"/mentee-profile"})
public class MenteeProfileController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PrintInvoiceController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PrintInvoiceController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String go = request.getParameter("go");

        if("edit-profile".equals(go)){
            TinhThanhPhoDAO dao = new TinhThanhPhoDAO();
            List<TinhThanhPho> list = dao.getAllTinhThanhPho();
            request.setAttribute("listCity", list);
            request.getRequestDispatcher("profile-settings/mentee-profile.jsp").forward(request, response );
        }

        else if("delete".equals(go)){
            String interestID = request.getParameter("interest-id");
            if(interestID != null){
                System.out.println("Delete interest: " + interestID + " " + new MenteeInterestDAO().removeInterest(Integer.parseInt(interestID)));
            }
            response.sendRedirect("mentee-profile?go=edit-profile");
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
        updateGeneralProfile(request);

        ArrayList<Skills> allSkills = (ArrayList<Skills>) new SkillDAO().getAllSkill();

        for(Skills skills : allSkills){
            final String skillId = request.getParameter(Integer.toString(skills.getSkillId()));
            if(skillId != null){
                int userID = ((Users) request.getSession().getAttribute("users")).getUserId();
                MenteeInterests newInterest = new MenteeInterests();
                newInterest.setMenteeId(Integer.parseInt(new MenteeDAO().getMenteeIdbyUserId(Integer.toString(userID))));
                newInterest.setSkillId(skills.getSkillId());
                System.out.println("Added interest: " + skills.getSkillId() + " " + new MenteeInterestDAO().addInterest(newInterest));
            }
        }

        response.sendRedirect("home");

    }

    public static void updateGeneralProfile(HttpServletRequest request) {
        String fName = request.getParameter("first_name");
        String lName = request.getParameter("last_name");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phoneNum = request.getParameter("phone_number");
        String address = request.getParameter("address");
        String facebook = request.getParameter("facebook");
        String maqh = request.getParameter("district");
        Users user = new Users();
        if("".equals(maqh) || maqh == null)
            maqh = ((Users) request.getSession().getAttribute("users")).getMaqh();
        user.setMaqh(maqh);
        user.setfName(fName);
        user.setlName(lName);
        user.setPhoneNum(phoneNum);
        user.setAddress(address);
        user.setGender(gender);
        user.setEmail(email);
        user.setFacebook(facebook);
        user.setPassword(((Users) request.getSession().getAttribute("users")).getPassword());
        user.setUserId(((Users) request.getSession().getAttribute("users")).getUserId());
        user.setRoleId(((Users) request.getSession().getAttribute("users")).getRoleId());
        user.setStatusId(((Users) request.getSession().getAttribute("users")).getStatusId());
        UserDAO dao = new UserDAO();
        dao.updateUsers(user);
        HttpSession session = request.getSession();
        session.setAttribute("users", user);
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
