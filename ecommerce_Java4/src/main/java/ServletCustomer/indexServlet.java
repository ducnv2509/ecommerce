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

@WebServlet({"/HomePage", "/HomePage/index"})
public class indexServlet extends HttpServlet {
    ProductsDAO productsDAO;

    public indexServlet() {
        productsDAO = new ProductsDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        ProductsDAO listProductsDAO = new ProductsDAO();
        int count = listProductsDAO.getTotalProducts();
        int endPage = count / 6;
        if (count % 6 != 0) {
            endPage++;
        }
        HttpSession session = request.getSession();
        List<Products> list = listProductsDAO.pagingAccount(index);
        session.setAttribute("listA", list);
        request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
        findAllProducts(request, response);
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


    protected void findAllProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ProductsDAO listProductsDAO = new ProductsDAO();
            List<Products> listP = listProductsDAO.findAll();
            CategoryDAO categoryDAO = new CategoryDAO();
            List<Category> listC = categoryDAO.findAll();
//            request.setAttribute("products", listP);
            request.setAttribute("category", listC);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    public void findIdProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Products products = productsDAO.findByID(id);
        request.setAttribute("product", products);
    }
}
