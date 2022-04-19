import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

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
        driver.findElement(By.xpath("//header/div[1]/div[5]/div[1]/ul[1]/li[1]/a[1]")).click();
        driver.findElement(By.xpath("//body/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/form[1]/div[1]/div[1]/div[2]/a[1]")).click();
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

    public void logOut(){
        driver.findElement(By.xpath("//header/div[1]/div[2]/div[1]/a[1]/span[2]")).click();
        driver.findElement(By.xpath("//a[contains(text(),'Log Out')]")).click();
    }

    @Test(dataProvider = "dataCreateAccount", dataProviderClass = Data.class)
    public void testCreateAccount(String email, String password, String re_pass) {
        autoText(email, password, re_pass);
        String textHello = ("Hello, " + firstName + " " + middleName + " " + lastName + "!");
        Assert.assertEquals(driver.findElement(By.xpath("/html[1]/body[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[2]/p[1]/strong[1]")).getText(), textHello);
        logOut();
    }

    @Test(dataProvider = "dataSameAccount", dataProviderClass = Data.class)
    public void testCreateSameAccount(String email, String password, String re_pass) {
        autoText(email, password, re_pass);
        String text = driver.findElement(By.xpath("//*[@id=\"top\"]/body/div/div/div[2]/div/div/div/ul/li/ul/li/span")).getText();
        Assert.assertEquals(text, "There is already an account with this email address. If you are sure that it is your email address, click here to get your password and access your account.");
    }

    @Test(dataProvider = "dataPasswordFive", dataProviderClass = Data.class)
    public void testPasswordFiveText(String email, String password, String re_pass) {
        autoText(email, password, re_pass);
        String text = driver.findElement(By.xpath("//div[@id='advice-validate-password-password']")).getText();
        Assert.assertEquals(text, "Please enter 6 or more characters without leading or trailing spaces.");
    }

    @Test(dataProvider = "dataPasswordSix", dataProviderClass = Data.class)
    public void testPasswordSixText(String email, String password, String re_pass) {
        autoText(email, password, re_pass);
        String textHello = ("Hello, " + firstName + " " + middleName + " " + lastName + "!");
        Assert.assertEquals(driver.findElement(By.xpath("/html[1]/body[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[2]/p[1]/strong[1]")).getText(), textHello);
        logOut();
    }

    @Test(dataProvider = "dataPasswordSeven", dataProviderClass = Data.class)
    public void testPasswordSevenText(String email, String password, String re_pass) {
        autoText(email, password, re_pass);
        String textHello = ("Hello, " + firstName + " " + middleName + " " + lastName + "!");
        Assert.assertEquals(driver.findElement(By.xpath("/html[1]/body[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[2]/p[1]/strong[1]")).getText(), textHello);
        logOut();
    }

    @Test(dataProvider = "dataPasswordValidate", dataProviderClass = Data.class)
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
