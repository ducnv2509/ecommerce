package ServletCustomer;

import DAO.AccountDAO;
import DAO.FavoriteDAO;
import DAO.StatusOrderDAO;
import Utils.EncryptUtils;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import entity.Favorite;
import entity.FlowStatus;
import entity.Products;
import entity.Users;
import entityOrder.Order;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;
import java.util.Map;

@MultipartConfig
@WebServlet({"/ProfileServlet", "/ProfileServlet/update",
        "/ProfileServlet/updatePassword"
})
public class ProfileServlet extends HttpServlet {
    AccountDAO accountDAO;
    StatusOrderDAO statusOrderDAO;

    public ProfileServlet() {
        accountDAO = new AccountDAO();
        statusOrderDAO = new StatusOrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("auth");
        if (users == null) {
            response.sendRedirect("/ecommerce_Java4_war/LoginControl");
        } else {
            FavoriteDAO favoriteDAO = new FavoriteDAO();
            List<Favorite> list = favoriteDAO.findAll();
            request.setAttribute("fv", list);
            request.setAttribute("users", accountDAO.findByID(users.getId()));
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if (uri.contains("update")) {
            updateAccount(request, response);
            response.sendRedirect("/ecommerce_Java4_war/ProfileServlet");
            HttpSession session = request.getSession();
            session.setAttribute("message", "Update successfully !");
        }

    }

    public void updateAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        File dir = new File("/uploads");
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("auth");
        if (!dir.exists()) {
            dir.mkdirs();
        }
        Part photo = request.getPart("imageProduct");
        File photoFile = new File(dir, photo.getSubmittedFileName());
        photo.write(photoFile.getAbsolutePath());
        Users userInsert = new Users();
        Map uploadRuslt = cloudinary.uploader().upload(photoFile, ObjectUtils.emptyMap());
        userInsert.setAvatar(uploadRuslt.get("url").toString());
        userInsert.setCreated(new Date());
        Users id = accountDAO.findByID(users.getId());
        String passwordOld = id.getPassword();
        userInsert.setPassword(passwordOld);
        userInsert.setUsername(id.getUsername());
        try {
            BeanUtils.populate(userInsert, request.getParameterMap());
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        accountDAO.update(userInsert);
    }


    static Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "ducnv2509",
            "api_key", "959687882171424",
            "api_secret", "yoa_1l--izubACPSc3gyDXfdLCQ",
            "secure", true));
}

