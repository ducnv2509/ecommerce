package AdminServlet;

import DAO.AccountDAO;
import DAO.CategoryDAO;
import DAO.ProductsDAO;
import DAO.SupplierDAO;
import Utils.EncryptUtils;
import Utils.Validate;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import entity.Category;
import entity.Products;
import entity.Supplier;
import entity.Users;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.PropertyConfigurator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

@MultipartConfig
@WebServlet({"/DashboardAdmin", "/DashboardAdmin/mnProducts", "/DashboardAdmin/mnCategory", "/DashboardAdmin/mnSupplier",
        "/DashboardAdmin/index", "/DashboardAdmin/mnAccount", "/DashboardAdmin/storeP", "/DashboardAdmin/updateP",
        "/DashboardAdmin/deleteP", "/DashboardAdmin/storeC", "/DashboardAdmin/updateC", "/DashboardAdmin/deleteC",
        "/DashboardAdmin/storeS", "/DashboardAdmin/updateS", "/DashboardAdmin/deleteS", "/DashboardAdmin/storeA", "/DashboardAdmin/updateA",
        "/DashboardAdmin/deleteA"
})
@Log4j2
public class DashboardAdmin extends HttpServlet {
    ProductsDAO productsDAO;
    CategoryDAO categoryDAO;
    SupplierDAO supplierDAO;
    AccountDAO accountDAO;

    public DashboardAdmin() {
        productsDAO = new ProductsDAO();
        categoryDAO = new CategoryDAO();
        supplierDAO = new SupplierDAO();
        accountDAO = new AccountDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String uri = request.getRequestURI();
        if (uri.contains("index")) {
            fillProducts(request, response);
            fillCategoryAndSupplier(request, response);
            request.setAttribute("views", "/views/dashboardAdmin/component/baseLayout.jsp");
        } else if (uri.contains("mnCategory")) {
            fillCategory(request, response);
            request.setAttribute("views", "/views/dashboardAdmin/ManagerCategory/CRUD_Category.jsp");
        } else if (uri.contains("mnSupplier")) {
            fillSupplier(request, response);
            request.setAttribute("views", "/views/dashboardAdmin/ManagerSupplier/CRUD_Supplier.jsp");
        } else if (uri.contains("mnAccount")) {
            fillAccount(request, response);
            request.setAttribute("views", "/views/dashboardAdmin/ManagerAccount/CRUD_Account.jsp");
        } else if (uri.contains("mnProducts")) {
            fillProducts(request, response);
            fillCategoryAndSupplier(request, response);
            request.setAttribute("views", "/views/dashboardAdmin/ManagerProducts/table.jsp");
        }

        request.getRequestDispatcher("/views/dashboardAdmin/layoutDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String uri = request.getRequestURI();
        HttpSession session = request.getSession();
        if (uri.contains("updateP")) {
            try {
                update(request, response);
                session.setAttribute("message", "Update Success!!!");
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/ecommerce_Java4_war/DashboardAdmin/mnProducts");
        } else if (uri.contains("storeP")) {
            insert(request, response);
            session.setAttribute("message", "Insert Success!!!");
            response.sendRedirect("/ecommerce_Java4_war/DashboardAdmin/mnProducts");
        } else if (uri.contains("deleteP")) {
            delete(request, response);
            session.setAttribute("message", "Delete Success!!!");
            response.sendRedirect("/ecommerce_Java4_war/DashboardAdmin/mnProducts");
        } else if (uri.contains("updateA")) {
            updateAccount(request, response);
            session.setAttribute("message", "Update Success!!!");
            response.sendRedirect("/ecommerce_Java4_war/DashboardAdmin/mnAccount");
        } else if (uri.contains("storeA")) {
            insertAccount(request, response);
            session.setAttribute("message", "Insert Success!!!");
            response.sendRedirect("/ecommerce_Java4_war/DashboardAdmin/mnAccount");
        } else if (uri.contains("deleteA")) {
            deleteAccount(request, response);
            session.setAttribute("message", "Delete Success!!!");
            response.sendRedirect("/ecommerce_Java4_war/DashboardAdmin/mnAccount");
        } else if (uri.contains("updateC")) {
            try {
                updateCategory(request, response);
                session.setAttribute("message", "Update Success!!!");

            } catch (InvocationTargetException | IllegalAccessException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/ecommerce_Java4_war/DashboardAdmin/mnCategory");
        } else if (uri.contains("storeC")) {
            try {
                log.info("OK");
                insertCategory(request, response);
                session.setAttribute("message", "Insert Success!!!");
            } catch (InvocationTargetException | IllegalAccessException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/ecommerce_Java4_war/DashboardAdmin/mnCategory");

        } else if (uri.contains("deleteC")) {
            deleteCategory(request, response);
            session.setAttribute("message", "Delete Success!!!");
            response.sendRedirect("/ecommerce_Java4_war/DashboardAdmin/mnCategory");
        } else if (uri.contains("updateS")) {
            try {
                updateSupplier(request, response);
                session.setAttribute("message", "Update Success!!!");
            } catch (InvocationTargetException | IllegalAccessException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/ecommerce_Java4_war/DashboardAdmin/mnSupplier");
        } else if (uri.contains("storeS")) {
            try {
                insertSupplier(request, response);
                session.setAttribute("message", "Insert Success!!!");
            } catch (InvocationTargetException | IllegalAccessException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/ecommerce_Java4_war/DashboardAdmin/mnSupplier");
        } else if (uri.contains("deleteS")) {
            deleteSupplier(request, response);
            session.setAttribute("message", "Delete Success!!!");
            response.sendRedirect("/ecommerce_Java4_war/DashboardAdmin/mnSupplier");
        }
    }

    private void insert(HttpServletRequest request, HttpServletResponse response) {
        if (!validateForm(request, response)) {
            return;
        }
        try {
            File dir = new File("/uploads");
            if (!dir.exists()) {
                dir.mkdirs();
            }
            Part photo = request.getPart("imageProduct");
            File photoFile = new File(dir, photo.getSubmittedFileName());
            photo.write(photoFile.getAbsolutePath());
            Products products = new Products();
            String category_id = request.getParameter("category_id");
            int c_id = Integer.parseInt(category_id);
            String supplier_id = request.getParameter("supplier_id");
            int s_id = Integer.parseInt(supplier_id);
            products.setCategoryId(c_id);
            products.setSupplierId(s_id);
            //
            Map uploadRuslt = cloudinary.uploader().upload(photoFile, ObjectUtils.emptyMap());
            //
            products.setImageProduct(uploadRuslt.get("url").toString());
            BeanUtils.populate(products, request.getParameterMap());
            productsDAO.insert(products);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void fillProducts(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Products> listP = productsDAO.findAll();
            request.setAttribute("product", listP);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }


    static Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "ducnv2509",
            "api_key", "959687882171424",
            "api_secret", "yoa_1l--izubACPSc3gyDXfdLCQ",
            "secure", true));

    private void update(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException {
//        if (!validateForm(request, response)) {
//            return;
//        }
        try {
            File dir = new File("/uploads");
            if (!dir.exists()) {
                dir.mkdirs();
            }
            Part photo = request.getPart("imageProduct");
            File photoFile = new File(dir, photo.getSubmittedFileName());
            photo.write(photoFile.getAbsolutePath());
            Products products = new Products();
            String category_id = request.getParameter("category_id");
            int c_id = Integer.parseInt(category_id);
            String supplier_id = request.getParameter("supplier_id");
            int s_id = Integer.parseInt(supplier_id);
            products.setCategoryId(c_id);
            products.setSupplierId(s_id);
            Map uploadRuslt = cloudinary.uploader().upload(photoFile, ObjectUtils.emptyMap());
            products.setImageProduct(uploadRuslt.get("url").toString());
            BeanUtils.populate(products, request.getParameterMap());
            productsDAO.update(products);
            request.setAttribute("product", products);
        } catch (IOException | ServletException | IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        try {
            int userId = Integer.parseInt(request.getParameter("id"));
            productsDAO.delete(userId);
            System.out.println("OKKKKKK");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void fillCategoryAndSupplier(HttpServletRequest request, HttpServletResponse response) {
        try {
            SupplierDAO supplierDAO = new SupplierDAO();
            List<Supplier> listP = supplierDAO.findAll();
            CategoryDAO categoryDAO = new CategoryDAO();
            List<Category> listC = categoryDAO.findAll();
            request.setAttribute("supplier", listP);
            request.setAttribute("category", listC);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void fillCategory(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Category> listP = categoryDAO.findAll();
            request.setAttribute("category", listP);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void fillSupplier(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Supplier> listP = supplierDAO.findAll();
            request.setAttribute("supplier", listP);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void fillAccount(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Users> listP = accountDAO.findAll();
            request.setAttribute("account", listP);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    // Account

    private void insertAccount(HttpServletRequest request, HttpServletResponse response) {
        if (!validateAccount(request, response)) {
            return;
        } else if (!checkEmailRegex(request, response)) {
            return;
        } else if (checkEmailMatch(request, response)) {
            return;
        } else if (!checkPhoneRegex(request, response)) {
            return;
        } else if (checkPhoneMatch(request, response)) {
            return;
        } else if (checkUserName(request, response)) {
            return;
        }
        try {
            Users users = new Users();
            users.setCreated(new Date());
            BeanUtils.populate(users, request.getParameterMap());
            String hashed = EncryptUtils.hashPassword(users.getPassword());
            users.setPassword(hashed);
            accountDAO.insert(users);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void updateAccount(HttpServletRequest request, HttpServletResponse response) {
//        if (!validateAccount(request, response)) {
//            return;
//        }
        try {
            HttpSession session = request.getSession();
            Users usersSes = (Users) session.getAttribute("auth");
            Users id = accountDAO.findByID(usersSes.getId());
            Users userOld = accountDAO.findByID(Integer.parseInt(request.getParameter("id")));
            Users users = new Users();
            users.setCreated(new Date());
            users.setPassword(userOld.getPassword());
            users.setAddress(id.getAddress());
            users.setAvatar(id.getAvatar());
            users.setCreated(id.getCreated());
            BeanUtils.populate(users, request.getParameterMap());
            accountDAO.update(users);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void deleteAccount(HttpServletRequest request, HttpServletResponse response) {
        try {
            int userId = Integer.parseInt(request.getParameter("id"));
            accountDAO.delete(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // category

    private void insertCategory(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, IllegalAccessException {
        if (!validateCategory(request, response)) {
            return;
        } else if (checkCategoryMatch(request, response)) {
            return;
        }
        Category category = new Category();
        BeanUtils.populate(category, request.getParameterMap());
        categoryDAO.insert(category);
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, IllegalAccessException {
//        if (!validateCategory(request, response)) {
//            return;
//        }
        Category category = new Category();
        BeanUtils.populate(category, request.getParameterMap());
        categoryDAO.update(category);
        request.setAttribute("category", category);
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response) {
        try {
            int userId = Integer.parseInt(request.getParameter("id"));
            categoryDAO.delete(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //Supplier

    private void insertSupplier(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, IllegalAccessException {
        if (!validateSupplier(request, response)) {
            return;
        } else if (!checkPhoneRegex(request, response)) {
            return;
        } else if (checkSupplierMatch(request, response)) {
            return;
        } else if (checkPhoneMatchSupplier(request, response)) {
            return;
        }

        Supplier supplier = new Supplier();
        BeanUtils.populate(supplier, request.getParameterMap());
        supplierDAO.insert(supplier);
//        request.setAttribute("category", category);
    }

    private void updateSupplier(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, IllegalAccessException {
//        if (!validateSupplier(request, response)) {
//            return;
//        } else if (!checkPhoneRegex(request, response)) {
//            return;
//        }
        Supplier supplier = new Supplier();
        BeanUtils.populate(supplier, request.getParameterMap());
        supplierDAO.update(supplier);
    }

    private void deleteSupplier(HttpServletRequest request, HttpServletResponse response) {
        try {
            int userId = Integer.parseInt(request.getParameter("id"));
            supplierDAO.delete(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private boolean validateForm(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String name = request.getParameter("nameProduct");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");
        String color = request.getParameter("color");
        String size = request.getParameter("size");

        if (name.length() == 0 || quantity.length() == 0 || price.length() == 0 || color.length() == 0 ||
                size.length() == 0) {
            session.setAttribute("error", "Can not be empty!!!");
            return false;
        }
        return true;
    }

    private boolean validateAccount(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String fullName = request.getParameter("fullName");
        String password = request.getParameter("password");
        String re_password = request.getParameter("re_password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        if (username.length() == 0 || fullName.length() == 0 || password.length() == 0 || email.length() == 0 ||
                phone.length() == 0 || re_password.length() == 0) {
            session.setAttribute("error", "Can not be empty!!!");
            return false;
        }
        if (!re_password.equals(password)) {
            session.setAttribute("error", "Password not match !!!");
            return false;
        }
        return true;
    }


    private boolean validateSupplier(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String nameSupplier = request.getParameter("nameSupplier");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        if (nameSupplier.length() == 0 || phone.length() == 0 || address.length() == 0) {
            session.setAttribute("error", "Can not be empty!!!");
            return false;
        }
        return true;
    }

    private boolean validateCategory(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String nameCategory = request.getParameter("nameCategory");


        if (nameCategory.length() == 0) {
            session.setAttribute("error", "Can not be empty!!!");
            return false;
        }
        return true;
    }

    private boolean checkEmailRegex(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        if (!Validate.checkEmail(email)) {
            session.setAttribute("error", "Email Failed!!!");
            return false;
        }
        return true;
    }

    private boolean checkEmailMatch(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        if (Validate.checkEmailMatch(email)) {
            session.setAttribute("error", "Trùng Email: " + email);
            return true;
        }
        return false;
    }

    private boolean checkPhoneRegex(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String phone = request.getParameter("phone");
        if (!Validate.checkPhoneNumber(phone)) {
            session.setAttribute("error", "Phone Failed!!!");
            return false;
        }
        return true;
    }

    private boolean checkPhoneMatch(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String phone = request.getParameter("phone");
        if (Validate.checkPhoneMatch(phone)) {
            session.setAttribute("error", "Trùng Phone: " + phone);
            return true;
        }
        return false;
    }

    private boolean checkPhoneMatchSupplier(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String phone = request.getParameter("phone");
        if (Validate.checkNumberMatchSupplier(phone)) {
            session.setAttribute("error", "Trùng Phone: " + phone);
            return true;
        }
        return false;
    }

    private boolean checkCategoryMatch(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String username = request.getParameter("nameCategory");
        if (Validate.checkCategory(username)) {
            session.setAttribute("error", "Match category: " + username);
            return true;
        }
        return false;
    }

    private boolean checkSupplierMatch(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String username = request.getParameter("nameSupplier");
        if (Validate.checkSupplier(username)) {
            session.setAttribute("error", "Match name supplier: " + username);
            return true;
        }
        return false;
    }

    private boolean checkUserName(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        if (Validate.checkUsername(username)) {
            session.setAttribute("error", "Trùng username: " + username);
            return true;
        }
        return false;
    }


}
