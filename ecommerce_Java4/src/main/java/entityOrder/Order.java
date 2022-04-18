package entityOrder;

import Utils.SaveLogin;
import entity.Products;
import entity.Supplier;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.persistence.PostPersist;
import javax.persistence.PostRemove;
import javax.persistence.PostUpdate;

public class Order extends Products {
    private int orderId;
    private int uid;
    private int quantity;
    private String date;
    private int statusState;


    public int getStatusState() {
        return statusState;
    }

    public void setStatusState(int statusState) {
        this.statusState = statusState;
    }

    public Order(int anInt, String string, String rsString, String s, String string1, int rsInt, int i, int anInt1) {

    }

    public Order() {
    }

    public Order(int orderId, int uid, int quantity, String date, int statusState) {
        super();
        this.orderId = orderId;
        this.uid = uid;
        this.quantity = quantity;
        this.date = date;
        this.statusState = statusState;
    }

    public Order(int uid, int quantity, String date, int statusState) {
        super();
        this.uid = uid;
        this.quantity = quantity;
        this.date = date;
        this.statusState = statusState;
    }


    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", uid=" + uid +
                ", quantity=" + quantity +
                ", date='" + date + '\'' +
                '}';
    }

    private static final Log log = LogFactory.getLog(Order.class);

    @PostPersist
    public void logNewUserAdded() {
        log.info("Added order: '" + getNameProduct() + "' with name: " + SaveLogin.user.getFullName());
    }

    @PostRemove
    public void logUserRemoval() {
        log.info("Deleted order: " + getNameProduct() + " with name: " + SaveLogin.user.getFullName());
    }

    @PostUpdate
    public void logUserUpdate() {
        log.info("Updated order: " + getNameProduct() + " with name: " + SaveLogin.user.getFullName());
    }
}
