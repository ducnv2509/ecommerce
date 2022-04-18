package entity;

public class FlowStatus {
    private int o_id, idP, o_quantity, price, total, status;
    private String imageProduct, nameProduct, size, color, nameCustomer, order_Date;

    public int getO_id() {
        return o_id;
    }

    public void setO_id(int o_id) {
        this.o_id = o_id;
    }

    public FlowStatus(int o_id, int idP, String imageProduct, String nameProduct, String size, String color, int o_quantity, int price, int total, int status) {
        this.o_id = o_id;
        this.idP = idP;
        this.o_quantity = o_quantity;
        this.price = price;
        this.total = total;
        this.imageProduct = imageProduct;
        this.nameProduct = nameProduct;
        this.size = size;
        this.color = color;
        this.status = status;
    }

    public FlowStatus(int o_id, String nameCustomer, String imageProduct, String nameProduct, String size, String color, int o_quantity, int price, int total, int status, String order_Date) {
        this.o_id = o_id;
        this.nameCustomer = nameCustomer;
        this.o_quantity = o_quantity;
        this.price = price;
        this.total = total;
        this.imageProduct = imageProduct;
        this.nameProduct = nameProduct;
        this.size = size;
        this.color = color;
        this.status = status;
        this.order_Date = order_Date;
    }

    public FlowStatus(int o_id, int idP, String imageProduct, String nameProduct, String size, String color, int o_quantity, int price, int total, int status, String order_Date) {
        this.o_id = o_id;
        this.idP = idP;
        this.o_quantity = o_quantity;
        this.price = price;
        this.total = total;
        this.imageProduct = imageProduct;
        this.nameProduct = nameProduct;
        this.size = size;
        this.color = color;
        this.status = status;
        this.order_Date = order_Date;
    }

    public String getOrder_Date() {
        return order_Date;
    }

    public void setOrder_Date(String order_Date) {
        this.order_Date = order_Date;
    }

    public String getNameCustomer() {
        return nameCustomer;
    }

    public void setNameCustomer(String nameCustomer) {
        this.nameCustomer = nameCustomer;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getIdP() {
        return idP;
    }

    public void setIdP(int idP) {
        this.idP = idP;
    }

    public int getO_quantity() {
        return o_quantity;
    }

    public void setO_quantity(int o_quantity) {
        this.o_quantity = o_quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getImageProduct() {
        return imageProduct;
    }

    public void setImageProduct(String imageProduct) {
        this.imageProduct = imageProduct;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public String toString() {
        return "FlowStatus{" +
                "idP=" + idP +
                ", o_quantity=" + o_quantity +
                ", price=" + price +
                ", total=" + total +
                ", imageProduct='" + imageProduct + '\'' +
                ", nameProduct='" + nameProduct + '\'' +
                ", size='" + size + '\'' +
                ", color='" + color + '\'' +
                '}';
    }
}
