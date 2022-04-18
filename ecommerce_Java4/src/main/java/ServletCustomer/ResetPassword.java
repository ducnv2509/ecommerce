package ServletCustomer;

import DAO.AccountDAO;
import Utils.EncryptUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "ResetPassword", value = "/ResetPassword")
public class ResetPassword extends HttpServlet {
    int randomCode;
    AccountDAO accountDAO;

    public ResetPassword() {
        accountDAO = new AccountDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Random random = new Random();
        randomCode = random.nextInt(999999);
        int code = Integer.parseInt(request.getParameter("code"));
        if (code == randomCode) {
            accountDAO.updatePasswordByUsername(EncryptUtils.hashPassword(request.getParameter("password")), request.getParameter("username"));
            System.out.println("ok");
        }
    }
}
