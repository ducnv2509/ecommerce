package ServletCustomer;

import DAO.AccountDAO;
import Utils.EncryptUtils;
import entity.Users;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SignUpControl", value = "/SignUpControl")
public class SignUpControl extends HttpServlet {
    AccountDAO accountDAO;

    public SignUpControl() {
        accountDAO = new AccountDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        request.getRequestDispatcher("/LoginAndRegister/Register/colorlib-regform-26/Register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String re_pass = request.getParameter("re_pass");
        if (!password.equals(re_pass)) {
            response.sendRedirect("/ecommerce_Java4_war/LoginControl");
        } else {
            Users u = accountDAO.checkAccount(username);
            if (u == null) {
                try {
                    Users users = new Users();
                    BeanUtils.populate(users, request.getParameterMap());
                    String hashed = EncryptUtils.hashPassword(users.getPassword());
                    users.setPassword(hashed);
                    users.setAvatar(null);
                    users.setCreated(null);
                    users.setRole(false);
                    users.setStatus(true);
                    accountDAO.insert(users);
                    response.sendRedirect("/ecommerce_Java4_war/LoginControl");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                response.sendRedirect("/ecommerce_Java4_war/LoginControl");
            }
        }
    }
}

