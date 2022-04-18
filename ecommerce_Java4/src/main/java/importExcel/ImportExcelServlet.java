package importExcel;

import DAO.ProductsDAO;
import Utils.ReadExcel;
import entity.Products;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.List;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
@WebServlet(name = "ImportExcelServlet", value = "/ImportExcelServlet")
public class ImportExcelServlet extends HttpServlet {
    ProductsDAO productsDAO;

    public ImportExcelServlet() {
        productsDAO = new ProductsDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Products> list = ReadExcel.readExcel("D:/Book1.xlsx");
        productsDAO.insertExcel(list);
        response.sendRedirect("http://localhost:8080/ecommerce_Java4_war/DashboardAdmin/mnProducts");
        System.out.println("OK");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        File dir = new File("/uploadImport");
        if (!dir.exists()) {
            dir.mkdirs();
        }
        Part photo = request.getPart("file_import");
        File photoFile = new File(dir, photo.getSubmittedFileName());
        photo.write(photoFile.getAbsolutePath());
        String absolute = photoFile.getAbsolutePath();
        List<Products> list = ReadExcel.readExcel(absolute);
        System.out.println(absolute);
        productsDAO.insertExcel(list);
        response.sendRedirect("http://localhost:8080/ecommerce_Java4_war/DashboardAdmin/mnProducts");
        System.out.println("OK");
    }
}
