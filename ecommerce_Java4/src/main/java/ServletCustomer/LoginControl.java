package ServletCustomer;

import DAO.AccountDAO;
import Utils.EncryptUtils;
import Utils.SaveLogin;
import entity.Users;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginControl", value = "/LoginControl")
public class LoginControl extends HttpServlet {
    AccountDAO accountDAO;

    public LoginControl() {
        accountDAO = new AccountDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/LoginAndRegister/Login/login-form-15/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Users u = accountDAO.findByUsername(request.getParameter("username"));
        boolean checked = EncryptUtils.checkPass(password, u.getPassword());
        if (checked == true) {
            HttpSession session = request.getSession();
            session.setAttribute("auth", u);
            session.setAttribute("message", "Login successfully !");
            SaveLogin.user = u;
            response.sendRedirect("/ecommerce_Java4_war/HomePage");
        } else {
            request.setAttribute("message", "Wrong user or password");
            request.getRequestDispatcher("/LoginAndRegister/Login/login-form-15/login.jsp").forward(request, response);
        }
    }
}
