package com.cglia.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.cglia.connection.DbCon;
import com.cglia.dao.UserDao;
/**
 * 
 * @author venkata.marni
 *@since 22-05-2023
 *@version 1.0
 */
@WebServlet("/forget-password")
public class ForgetPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LogManager.getLogger(ForgetPasswordServlet.class);
    /**
     * doPost method with request and response objects
     * @throws ServletException
     * @throws IOException
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            String newPassword = request.getParameter("new-password");
            String confirmPassword = request.getParameter("confirm-password");
            String otp = request.getParameter("otp");

            UserDao udao = new UserDao(DbCon.getConnection());
            boolean emailExists = udao.checkEmailExists(email);

            if (!emailExists) {
                String errorMessage = "Invalid email address. Please try again.";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("forget-password.jsp").forward(request, response);
            } else if (!newPassword.equals(confirmPassword)) {
                String errorMessage = "Passwords do not match. Please try again.";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("forget-password.jsp").forward(request, response);
            } else if (!otp.equals("9988")) {
                String errorMessage = "Invalid OTP. Please try again.";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("forget-password.jsp").forward(request, response);
            } else {
                boolean success = udao.resetPassword(email, newPassword);
                if (success) {
                    String successMessage = "Password updated successfully. Please log in to enjoy shopping.";
                    request.setAttribute("successMessage", successMessage);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    logger.info("Password reset successful for email: " + email);
                } else {
                    String errorMessage = "Failed to reset password. Please try again.";
                    request.setAttribute("errorMessage", errorMessage);
                    request.getRequestDispatcher("forget-password.jsp").forward(request, response);
                    logger.error("Failed to reset password for email: " + email);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            logger.error("An exception occurred during password reset", e);
        }
    }
}