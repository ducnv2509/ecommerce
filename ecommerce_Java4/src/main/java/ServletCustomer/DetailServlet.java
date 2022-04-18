package ServletCustomer;

import DAO.ProductsDAO;
import DAO.SupplierDAO;
import entity.Favorite;
import entity.Products;
import entity.Supplier;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DetailServlet", value = "/detailProduct")
public class DetailServlet extends HttpServlet {
    ProductsDAO productsDAO;
    SupplierDAO supplierDAO;

    public DetailServlet() {
        productsDAO = new ProductsDAO();
        supplierDAO = new SupplierDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Products p = productsDAO.getProductByID(id);
        request.setAttribute("detailProduct", p);
        fillSupplier(request, response);
        request.getRequestDispatcher("detailProduct.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void fillSupplier(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Supplier> listS = supplierDAO.findAll();
            List<Products> listP = productsDAO.findAll();
            request.setAttribute("supplier", listS);
            request.setAttribute("product", listP);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }
}
