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

@WebServlet(name = "LikeProduct", value = "/LikeProduct")
public class LikeProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!SaveLogin.isLogin()) {
            response.sendRedirect("/ecommerce_Java4_war/LoginControl");
        } else {
            HttpSession session = request.getSession();
            Users users = (Users) session.getAttribute("auth");
            int idP = Integer.parseInt(request.getParameter("id"));
            FavoriteDAO favoriteDAO = new FavoriteDAO();
            Favorite favorite = new Favorite();
            favorite.setUserId(SaveLogin.user.getId());
            favorite.setProductId(idP);
            favorite.setLikeDate(new Date());
            favoriteDAO.insert(favorite);
            List<Favorite> list = favoriteDAO.findByIDUser(users.getId());

            int idPF = 0;
            for (Favorite f : list) {
                if (f.getProductId() == idP) {
                    idPF = f.getProductId();
                }
            }

            request.setAttribute("like", list);
            request.setAttribute("like2", idPF);
            System.out.println("--------------------------" + idPF);
            response.sendRedirect("/ecommerce_Java4_war/HomePage");
            System.out.println("ok");
        }
    }

    public void doGetLike(HttpSession session, String herf, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        Users users = (Users) session.getAttribute("auth");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
