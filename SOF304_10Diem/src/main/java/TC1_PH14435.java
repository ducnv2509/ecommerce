import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;
import org.testng.annotations.*;

public class TC1_PH14435 {
    WebDriver driver;
    String firstName = "Duc";
    String lastName = "Nguyen";
    String middleName = "Van";

    @BeforeTest
    public void setUp() throws Exception {
        WebDriverManager.chromedriver().setup();
        driver = new ChromeDriver();
        driver.manage().window().maximize();
        driver.get("https://live.techpanda.org/");

    }


    public void autoText(String email, String password, String re_pass) {
        driver.findElement(By.xpath("//header/div[1]/div[2]/div[1]/a[1]/span[2]")).click();
        driver.findElement(By.xpath("//a[contains(text(),'Register')]")).click();
        driver.findElement(By.xpath("//input[@id='firstname']")).clear();
        driver.findElement(By.xpath("//input[@id='firstname']")).sendKeys(firstName);
        driver.findElement(By.xpath("//input[@id='middlename']")).clear();
        driver.findElement(By.xpath("//input[@id='middlename']")).sendKeys(middleName);
        driver.findElement(By.xpath("//input[@id='lastname']")).clear();
        driver.findElement(By.xpath("//input[@id='lastname']")).sendKeys(lastName);
        driver.findElement(By.xpath("//input[@id='email_address']")).clear();
        driver.findElement(By.xpath("//input[@id='email_address']")).sendKeys(email);
        driver.findElement(By.xpath("//input[@id='password']")).clear();
        driver.findElement(By.xpath("//input[@id='password']")).sendKeys(password);
        driver.findElement(By.xpath("//input[@id='confirmation']")).clear();
        driver.findElement(By.xpath("//input[@id='confirmation']")).sendKeys(re_pass);
        driver.findElement(By.xpath("//span[contains(text(),'Register')]")).click();
    }

    @BeforeMethod
    public void af() {
        driver.manage().deleteAllCookies();
    }


    public void logOut() {
        driver.findElement(By.xpath("//header/div[1]/div[2]/div[1]/a[1]/span[2]")).click();
        driver.findElement(By.xpath("//a[contains(text(),'Log Out')]")).click();
    }

    @Test(dataProvider = "dataCreateAccount", dataProviderClass = Data.class, priority = 1)
    public void testCreateAccount(String email, String password, String re_pass) {
        autoText(email, password, re_pass);
        String textHello = ("Hello, " + firstName + " " + middleName + " " + lastName + "!");
        Assert.assertEquals(driver.findElement(By.xpath("/html[1]/body[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[2]/p[1]/strong[1]")).getText(), textHello);
        logOut();
    }

    @Test(dataProvider = "dataSameAccount", dataProviderClass = Data.class, priority = 4)
    public void testCreateSameAccount(String email, String password, String re_pass) {
        autoText(email, password, re_pass);
        String text = driver.findElement(By.xpath("//*[@id=\"top\"]/body/div/div/div[2]/div/div/div/ul/li/ul/li/span")).getText();
        Assert.assertEquals(text, "There is already an account with this email address. If you are sure that it is your email address, click here to get your password and access your account.");
    }

    @Test(dataProvider = "dataPasswordFive", dataProviderClass = Data.class, priority = 5)
    public void testPasswordFiveText(String email, String password, String re_pass) {
        autoText(email, password, re_pass);
        String text = driver.findElement(By.xpath("//div[@id='advice-validate-password-password']")).getText();
        Assert.assertEquals(text, "Please enter 6 or more characters without leading or trailing spaces.");
    }

    @Test(dataProvider = "dataPasswordSix", dataProviderClass = Data.class, priority = 2)
    public void testPasswordSixText(String email, String password, String re_pass) {
        autoText(email, password, re_pass);
        String textHello = ("Hello, " + firstName + " " + middleName + " " + lastName + "!");
        Assert.assertEquals(driver.findElement(By.xpath("/html[1]/body[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[2]/p[1]/strong[1]")).getText(), textHello);
        logOut();
    }

    @Test(dataProvider = "dataPasswordSeven", dataProviderClass = Data.class, priority = 3)
    public void testPasswordSevenText(String email, String password, String re_pass) {
        autoText(email, password, re_pass);
        String textHello = ("Hello, " + firstName + " " + middleName + " " + lastName + "!");
        Assert.assertEquals(driver.findElement(By.xpath("/html[1]/body[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[2]/p[1]/strong[1]")).getText(), textHello);
        logOut();
    }

    @Test(dataProvider = "dataPasswordValidate", dataProviderClass = Data.class, priority = 6)
    public void testPasswordValidate(String email, String password, String re_pass) {
        autoText(email, password, re_pass);
        String text = driver.findElement(By.xpath("//div[@id='advice-validate-cpassword-confirmation']")).getText();
        Assert.assertEquals(text, "Please make sure your passwords match.");
    }

    @AfterTest
    public void afterTest() {
        driver.close();
    }
}
