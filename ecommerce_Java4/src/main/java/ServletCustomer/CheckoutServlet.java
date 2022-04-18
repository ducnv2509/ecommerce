package ServletCustomer;

import DAO.OrderDAO;
import Utils.DbCon;
import entity.Users;
import entityOrder.Cart;
import entityOrder.Order;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "CheckoutServlet", value = "/cart-check-out")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss aa");
            Date date = new Date();
            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
            Users auth = (Users) request.getSession().getAttribute("auth");
            if (cart_list != null && auth != null) {
                for (Cart c : cart_list) {
                    Order order = new Order();
                    order.setId(c.getId());
                    order.setUid(auth.getId());
                    order.setQuantity(c.getQuantity());
                    order.setDate(formatter.format(date));
                    order.setStatusState(1);
                    OrderDAO oDao = new OrderDAO(DbCon.getConnection());
                    boolean result = oDao.insertOrder(order);
                    System.out.println("OK ?");
                    if (!result) break;
                }
                cart_list.clear();
                response.sendRedirect("/ecommerce_Java4_war/ProfileServlet");
                HttpSession session = request.getSession();
                session.setAttribute("message", "Checkout successfully !");
            } else {
                if (auth == null) {
                    response.sendRedirect("/ecommerce_Java4_war/LoginControl");
                } else {
                    response.sendRedirect("/ecommerce_Java4_war/ShowCart");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
