package ServletCustomer;

import DAO.ProductsDAO;
import entity.Products;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "LoadServlet", value = "/load")
public class LoadServlet extends HttpServlet {
    ProductsDAO productsDAO;

    public LoadServlet() {
        productsDAO = new ProductsDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String amount = request.getParameter("exits");
        int iamount = Integer.parseInt(amount);
        List<Products> list = productsDAO.getNextTop3(iamount);
        PrintWriter out = response.getWriter();
        for (Products o : list
        ) {
            out.println(
                    "<div class=\"product col-md-4\">\n" +
                            "                        <div class=\"card mb-4 product-wap rounded-0\">\n" +
                            "                            <div class=\"card rounded-0\">\n" +
                            "                                <img class=\"card-img rounded-0 img-fluid\"\n" +
                            "                                     src=\"" + o.getImageProduct() + "\" width=\"256\" height=\"256\" alt=\"\">\n" +
                            "                                <div class=\"card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center\">\n" +
                            "                                    <ul class=\"list-unstyled\">\n" +
                            "                                        <li><a class=\"btn btn-success text-white\"\n" +
                            "                                               href=\"/Assignment_Java4_war/detailProduct?id=" + o.getId() + "\"><i\n" +
                            "                                                class=\"far fa-heart\"></i></a></li>\n" +
                            "                                        <li><a class=\"btn btn-success text-white mt-2\"\n" +
                            "                                               href=\"/Assignment_Java4_war/detailProduct?id=" + o.getId() + "\"><i\n" +
                            "                                                class=\"far fa-eye\"></i></a></li>\n" +
                            "                                        <li><a class=\"btn btn-success text-white mt-2\"\n" +
                            "                                               href=\"/ecommerce_Java4_war/addCart?id=" + o.getId() + "\"><i\n" +
                            "                                                class=\"fas fa-cart-plus\"></i></a></li>\n" +
                            "                                    </ul>\n" +
                            "                                </div>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"card-body\">\n" +
                            "                                <a href=\"/Assignment_Java4_war/detailProduct?id=" + o.getId() + "\"\n" +
                            "                                   class=\"h3 text-decoration-none\">" + o.getNameProduct() + "</a>\n" +
                            "                                <ul class=\"w-100 list-unstyled d-flex justify-content-between mb-0\">\n" +
                            "                                    <li>M/L/X/XL</li>\n" +
                            "                                    <li class=\"pt-2\">\n" +
                            "                                        <span class=\"product-color-dot color-dot-red float-left rounded-circle ml-1\"></span>\n" +
                            "                                        <span class=\"product-color-dot color-dot-blue float-left rounded-circle ml-1\"></span>\n" +
                            "                                        <span class=\"product-color-dot color-dot-black float-left rounded-circle ml-1\"></span>\n" +
                            "                                        <span class=\"product-color-dot color-dot-light float-left rounded-circle ml-1\"></span>\n" +
                            "                                        <span class=\"product-color-dot color-dot-green float-left rounded-circle ml-1\"></span>\n" +
                            "                                    </li>\n" +
                            "                                </ul>\n" +
                            "                                <ul class=\"list-unstyled d-flex justify-content-center mb-1\">\n" +
                            "                                    <li>\n" +
                            "                                        <i class=\"text-warning fa fa-star\"></i>\n" +
                            "                                        <i class=\"text-warning fa fa-star\"></i>\n" +
                            "                                        <i class=\"text-warning fa fa-star\"></i>\n" +
                            "                                        <i class=\"text-muted fa fa-star\"></i>\n" +
                            "                                        <i class=\"text-muted fa fa-star\"></i>\n" +
                            "                                    </li>\n" +
                            "                                </ul>\n" +
                            "                                <p class=\"text-center mb-0\">" + o.getPrice() + "$</p>\n" +
                            "                            </div>\n" +
                            "                        </div>\n" +
                            "                    </div>"
            );
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
