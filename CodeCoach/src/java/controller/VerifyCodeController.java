package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;

@WebServlet(name = "VerifyCodeController", urlPatterns = {"/verifycode"})
public class VerifyCodeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VerifyCodeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyCodeController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("register");
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userVerificationCode = request.getParameter("verification_code");
        String verifyjsp = (String) request.getSession().getAttribute("verify");
        String storedVerificationCode = (String) request.getSession().getAttribute("verificationCode");
        Users user = (Users) request.getSession().getAttribute("userRegister");
        String email = user.getEmail();
        if (verifyjsp != null) {
            request.setAttribute("email", email);
            request.getRequestDispatcher("verifycode.jsp").forward(request, response);
            request.getSession().removeAttribute("verify");
        }
        if (userVerificationCode != null && storedVerificationCode != null && userVerificationCode.equals(storedVerificationCode)) {
            // Verification succeeded, remove attributes from the session
            UserDAO cdb = new UserDAO();
            request.getSession().removeAttribute("verificationCode");
            request.getSession().removeAttribute("userRegister");
            try {
                cdb.insert(user);
            } catch (Exception e) {
                response.sendRedirect("404error.jsp");
            }
            // Redirect to the success page
            response.sendRedirect("success.jsp");
        } else if (verifyjsp == null) {
            // Verification failed, forward to the JSP with error message
            request.setAttribute("error", "Code is not correct. Please check the code again!");
            request.setAttribute("email", email);
            request.getRequestDispatcher("verifycode.jsp").forward(request, response);
        } else {
            response.sendRedirect("home");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}



