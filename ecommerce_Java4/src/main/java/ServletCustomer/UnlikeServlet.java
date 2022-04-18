package ServletCustomer;

import DAO.FavoriteDAO;
import Utils.SaveLogin;
import entity.Favorite;
import entity.Users;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "UnlikeServlet", value = "/UnlikeServlet")
public class UnlikeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!SaveLogin.isLogin()) {
            response.sendRedirect("/ecommerce_Java4_war/LoginControl");
        } else {
            FavoriteDAO favoriteDAO = new FavoriteDAO();
            favoriteDAO.updateStatus();
            favoriteDAO.updateStatusDelete();
            response.sendRedirect("/ecommerce_Java4_war/HomePage");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
