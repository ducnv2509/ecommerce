package ServletCustomer;

import DAO.CategoryDAO;
import DAO.ProductsDAO;
import entity.Category;
import entity.Products;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchServlet", value = "/SearchControl")
public class SearchServlet extends HttpServlet {

    ProductsDAO productsDAO;

    public SearchServlet() {
        productsDAO = new ProductsDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String txtSearch = request.getParameter("q");
        List<Products> list = productsDAO.searchProductByName(txtSearch);
        request.setAttribute("listA", list);
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> listC = categoryDAO.findAll();
        request.setAttribute("category", listC);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
