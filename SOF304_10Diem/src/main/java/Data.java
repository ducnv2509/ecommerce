import org.testng.annotations.DataProvider;

public class Data {

    @DataProvider
    public static Object[][] dataCreateAccount() {
        return new Object[][]{
                {"demo1@gmail.com", "ducnv2509", "ducnv2509"},
                {"demo2@gmail.com", "ducnv2509", "ducnv2509"},
        };
    }

    @DataProvider
    public static Object[][] dataSameAccount() {
        return new Object[][]{
                {"test1@gmail.com", "ducnv2509", "ducnv2509"},
                {"test2@gmail.com", "ducnv2509", "ducnv2509"},
        };
    }

    @DataProvider
    public static Object[][] dataPasswordFive() {
        return new Object[][]{
                {"test3@gmail.com", "12345", "12345"},
                {"test4@gmail.com", "54321", "54321"},
        };
    }

    @DataProvider
    public static Object[][] dataPasswordSix() {
        return new Object[][]{
                {"test3@gmail.com", "123456", "123456"},
                {"test4@gmail.com", "654321", "654321"},
        };
    }


    @DataProvider
    public static Object[][] dataPasswordSeven() {
        return new Object[][]{
                {"test3@gmail.com", "1234567", "1234567"},
                {"test4@gmail.com", "7654321", "7654321"},
        };
    }

    @DataProvider
    public static Object[][] dataPasswordValidate() {
        return new Object[][]{
                {"test3@gmail.com", "123456", "1234567"},
                {"test4@gmail.com", "654321", "7654321"},
        };
    }

    @DataProvider
    public static Object[][] dataEmailSend() {
        return new Object[][]{
                {"demo1@gmail.com", "Ok"},
                {"demo2@gmail.com", "Ok"},
                {"demo3@gmail.com", "Ok"},
                {"demo4@gmail.com", "Ok"},
                {"demo5@gmail.com", "Ok"},
        };
    }

}
