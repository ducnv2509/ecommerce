package Utils;

import entity.Users;

public class SaveLogin {
    public static Users user = null;

    public static void clear() {
        SaveLogin.user = null;
    }

    public static boolean isLogin() {
        return SaveLogin.user != null;
    }

    public static boolean isManager() {
        return SaveLogin.isLogin() && user.getRole();
    }
}
