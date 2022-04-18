package importExcel;

import DAO.CategoryDAO;
import DAO.ProductsDAO;
import entity.Category;
import entity.Products;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "demoXoa", value = "/Home")
public class demoXoa extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductsDAO listProductsDAO = new ProductsDAO();
        List<Products> listP = listProductsDAO.findAll();
            request.setAttribute("products", listP);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
