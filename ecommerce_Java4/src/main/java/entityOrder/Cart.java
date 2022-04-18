package entityOrder;

import entity.Products;

public class Cart extends Products {
    private int quantity;

    public Cart() {

    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
