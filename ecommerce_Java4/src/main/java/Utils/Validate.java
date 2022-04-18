package Utils;

import DAO.AccountDAO;
import DAO.CategoryDAO;
import DAO.SupplierDAO;
import org.apache.log4j.Category;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validate {

    public static boolean checkEmail(String email) {
        boolean flag = true;
        Pattern pattern = Pattern.compile("\\w+@\\w+(\\.\\w+){1,2}");
        Matcher matcher = pattern.matcher(email);
        if (!matcher.find()) {
            flag = false;
        }
        return flag;
    }

    public static boolean checkPhoneNumber(String phone) {
        boolean flag = true;
        Pattern pattern = Pattern.compile("(84|0[3|5|7|8|9])+([0-9]{8})\\b");
        Matcher matcher = pattern.matcher(phone);
        if (!matcher.find()) {
            flag = false;
        } else {
            flag = true;
        }
        return flag;
    }

    public static boolean checkEmailMatch(String acc) {
        AccountDAO accountDAO = new AccountDAO();
        for (int i = 0; i < accountDAO.findAll().size(); i++) {
            if (accountDAO.findAll().get(i).getEmail().trim().equals(acc.trim())) {
                return true;
            }
        }
        return false;
    }


    public static boolean checkPhoneMatch(String acc) {
        AccountDAO accountDAO = new AccountDAO();
        for (int i = 0; i < accountDAO.findAll().size(); i++) {
            if (accountDAO.findAll().get(i).getPhone().trim().equals(acc.trim())) {
                return true;
            }
        }
        return false;
    }

    public static boolean checkUsername(String acc) {
        AccountDAO accountDAO = new AccountDAO();
        for (int i = 0; i < accountDAO.findAll().size(); i++) {
            if (accountDAO.findAll().get(i).getUsername().trim().equals(acc.trim())) {
                return true;
            }
        }
        return false;
    }

    public static boolean checkCategory(String acc) {
        CategoryDAO categoryDAO = new CategoryDAO();
        for (int i = 0; i < categoryDAO.findAll().size(); i++) {
            if (categoryDAO.findAll().get(i).getNameCategory().trim().equals(acc.trim())) {
                return true;
            }
        }
        return false;
    }

    public static boolean checkSupplier(String acc) {
        SupplierDAO supplierDAO = new SupplierDAO();
        for (int i = 0; i < supplierDAO.findAll().size(); i++) {
            if (supplierDAO.findAll().get(i).getNameSupplier().trim().equals(acc.trim())) {
                return true;
            }
        }
        return false;
    }

    public static boolean checkNumberMatchSupplier(String acc) {
        SupplierDAO supplierDAO = new SupplierDAO();
        for (int i = 0; i < supplierDAO.findAll().size(); i++) {
            if (supplierDAO.findAll().get(i).getPhone().trim().equals(acc.trim())) {
                return true;
            }
        }
        return false;
    }

}
