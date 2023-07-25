/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.mentor;

import dal.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.io.IOException;
import java.util.List;

import static controller.mentee.MenteeProfileController.updateGeneralProfile;

/**
 *
 * @author Duy Thai
 */
@WebServlet(name="MentorProfileController", urlPatterns={"/mentor-profile"})
public class MentorProfileController extends HttpServlet {

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
            if(request.getSession().getAttribute("error") != null)
            {
                request.setAttribute("error", request.getSession().getAttribute("error"));
                request.getSession().removeAttribute("error");
            }
            request.getRequestDispatcher("profile-settings/mentor-profile.jsp").forward(request, response);
        }else if("delete".equals(go)){
            int expertiseID = Integer.parseInt(request.getParameter("expertise-id"));
            new ExpertiseDAO().removeExpertise(expertiseID);
            System.out.println("Deleted expertise: " + expertiseID);
            request.getSession().setAttribute("error", "Deleted expertise: " + expertiseID);
            request.getRequestDispatcher("mentor-profile?go=edit-profile").forward(request, response);
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
        String experience = request.getParameter("experience");
        int userID = ((Users) request.getSession().getAttribute("users")).getUserId();
        int mentorID = new MentorDAO().getMentorIdByUser(userID);
        new ExperienceDAO().insertExperience(mentorID, experience);
        Mentors mentor = new MentorDAO().getMentorByUserId(userID);
        String bio = request.getParameter("bio");
        String hourlyRate = request.getParameter("hourly-rate");
        mentor.setBio(bio);
        mentor.setHourlyRate(hourlyRate);

        new MentorDAO().updateMentor(mentor);
        System.out.println(mentor + " Updated");

        System.out.println("Edited experience: " + experience);


        List<Skills> skills = new SkillDAO().getAllSkill();

        for(Skills skill : skills){
            String skillIDString = request.getParameter(String.valueOf(skill.getSkillId()));
            if(skillIDString != null){
                Expertise expertise = new Expertise();
                expertise.setMentorId(mentorID);
                expertise.setSkillId(skill.getSkillId());
                new ExpertiseDAO().addExpertise(expertise);
                System.out.println("Added expertise: " + expertise);
            }
        }

        request.getSession().setAttribute("error", "Edited profile successfully");

        response.sendRedirect("mentor-profile?go=edit-profile");
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
