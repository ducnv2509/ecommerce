package ServletCustomer;

import DAO.AccountDAO;
import Utils.Email;
import Utils.EmailUtils;
import Utils.EncryptUtils;
import entity.Users;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Random;

@WebServlet({"/ForgotPassword", "/ForgotPassword/sendMail", "/ForgotPassword/reset"})
public class ForgotPassword extends HttpServlet {

    AccountDAO accountDAO;
    int randomCode;

    public ForgotPassword() {
        accountDAO = new AccountDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/forgotPassword/Forgot/forgotPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Random random = new Random();
        randomCode = random.nextInt(999999);
        String uri = request.getRequestURI();
        if (uri.contains("sendMail")) {
            try {
                String emailAddress = request.getParameter("email");
                String username = request.getParameter("username");

                Users users = accountDAO.findByUsernameAndEmail(username, emailAddress);
                if (users == null) {
                    request.setAttribute("error", "Username or email are incorrect");
                } else {
                    Email email = new Email();
                    email.setFrom("ducit2509@gmail.com");
                    email.setFromPassword("nguyenvanduc");
                    email.setTo(emailAddress);
                    email.setSubject("Forgot Password Function");
                    StringBuilder sb = new StringBuilder();
                    sb.append("Dear ").append(username).append("<br>");
                    sb.append("You are used the forgot password function. <br>");
                    sb.append("You code is ").append(randomCode).append(" <b>");
                    sb.append("Regards <br>");
                    sb.append("Administrator");
                    email.setContent(sb.toString());
                    EmailUtils.send(email);
                    request.setAttribute("message", "email sent to the email address. Please check and get your password");
                }

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", e.getMessage());
                throw e;
            }
            request.getRequestDispatcher("/forgotPassword/Forgot/forgotPassword2.jsp").forward(request, response);
        } else if (uri.contains("reset")) {
            accountDAO.updatePasswordByUsername(EncryptUtils.hashPassword(request.getParameter("password")), request.getParameter("username"));
            System.out.println("Ok");
            response.sendRedirect("/ecommerce_Java4_war/LoginControl");
        }


    }
}
