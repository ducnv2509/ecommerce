package ServletCustomer;

import DAO.AccountDAO;
import Utils.EncryptUtils;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import entity.Users;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

@WebServlet({"/UpdatePassServlet", "/UpdatePassServlet/update"})
public class UpdatePassServlet extends HttpServlet {
    AccountDAO accountDAO;

    public UpdatePassServlet() {
        accountDAO = new AccountDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("auth");
        if (users == null) {
            response.sendRedirect("/ecommerce_Java4_war/LoginControl");
        } else {
            AccountDAO accountDAO = new AccountDAO();
            request.setAttribute("users", accountDAO.findByID(users.getId()));
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("update")) {
            changePassword(request, response);
            response.sendRedirect("/ecommerce_Java4_war/ProfileServlet");
            HttpSession session = request.getSession();
            session.setAttribute("message", "Update Password successfully !");
        }

    }

    public void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("auth");
        Users userInsert = new Users();
        Users id = accountDAO.findByID(users.getId());
        String passwordNew = id.getPassword();
        userInsert.setUsername(id.getUsername());
        userInsert.setAddress(id.getAddress());
        userInsert.setAvatar(id.getAvatar());
        userInsert.setRole(id.getRole());
        userInsert.setStatus(id.getStatus());
        userInsert.setGender(id.getGender());
        userInsert.setEmail(id.getEmail());
        userInsert.setCreated(id.getCreated());
        userInsert.setPhone(id.getPhone());
        userInsert.setFullName(id.getFullName());
        try {
            BeanUtils.populate(userInsert, request.getParameterMap());
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        String hashed = EncryptUtils.hashPassword(userInsert.getPassword());
        userInsert.setPassword(hashed);
        accountDAO.update(userInsert);

    }

}
