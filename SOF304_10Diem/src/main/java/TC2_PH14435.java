import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

public class TC2_PH14435 {
    WebDriver driver;

    @BeforeTest
    public void setUp() throws Exception {
        WebDriverManager.chromedriver().setup();
        driver = new ChromeDriver();
        driver.manage().window().maximize();
        driver.get("https://live.techpanda.org/");
        login();
        driver.findElement(By.xpath("//a[contains(text(),'TV')]")).click();
        driver.findElement(By.xpath("//body/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[2]/ul[1]/li[1]/div[1]/div[3]/ul[1]/li[1]/a[1]")).click();
    }

    public void login() {
        driver.findElement(By.xpath("//header/div[1]/div[2]/div[1]/a[1]/span[2]")).click();
        driver.findElement(By.xpath("//a[contains(text(),'Log In')]")).click();
        driver.findElement(By.xpath("//input[@id='email']")).clear();
        driver.findElement(By.xpath("//input[@id='email']")).sendKeys("share@gmail.com");
        driver.findElement(By.xpath("//input[@id='pass']")).clear();
        driver.findElement(By.xpath("//input[@id='pass']")).sendKeys("123123");
        driver.findElement(By.xpath("/html[1]/body[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/form[1]/div[1]/div[2]/div[2]/button[1]")).click();
    }

    public void action(String email, String mess) {
        driver.findElement(By.xpath("//span[contains(text(),'Share Wishlist')]")).click();
        driver.findElement(By.xpath("//textarea[@id='email_address']")).sendKeys(email);
        driver.findElement(By.xpath("//textarea[@id='message']")).sendKeys(mess);
        driver.findElement(By.xpath("//span[contains(text(),'Share Wishlist')]")).click();
        Assert.assertEquals(driver.findElement(By.xpath("//span[contains(text(),'Your Wishlist has been shared.')]")).getText(), "Your Wishlist has been shared.");
    }


    @Test(dataProvider = "dataEmailSend", dataProviderClass = Data.class)
    public void testSendEmail(String email, String mess) {
        action(email, mess);
    }

    @AfterTest
    public void afterTest() {
        driver.close();
    }
}
