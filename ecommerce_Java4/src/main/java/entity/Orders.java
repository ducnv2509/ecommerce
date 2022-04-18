package entity;

import Utils.SaveLogin;
import entityOrder.Order;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.persistence.*;

@Entity
public class Orders {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false)
    private int id;
    @Basic
    @Column(name = "p_id", nullable = true, insertable = false, updatable = false)
    private Integer pId;
    @Basic
    @Column(name = "u_id", nullable = true, insertable = false, updatable = false)
    private Integer uId;
    @Basic
    @Column(name = "o_quantity", nullable = true)
    private Integer oQuantity;
    @Basic
    @Column(name = "o_date", nullable = true, length = 450)
    private String oDate;
    @Basic
    @Column(name = "statusState", nullable = true, insertable = false, updatable = false)
    private Integer statusState;
    @ManyToOne
    @JoinColumn(name = "p_id", referencedColumnName = "id")
    private Products productsByPId;
    @ManyToOne
    @JoinColumn(name = "u_id", referencedColumnName = "id")
    private Users usersByUId;
    @ManyToOne
    @JoinColumn(name = "statusState", referencedColumnName = "id")
    private OrderStates orderStatesByStatusState;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer getoQuantity() {
        return oQuantity;
    }

    public void setoQuantity(Integer oQuantity) {
        this.oQuantity = oQuantity;
    }

    public String getoDate() {
        return oDate;
    }

    public void setoDate(String oDate) {
        this.oDate = oDate;
    }

    public Integer getStatusState() {
        return statusState;
    }

    public void setStatusState(Integer statusState) {
        this.statusState = statusState;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Orders orders = (Orders) o;

        if (id != orders.id) return false;
        if (pId != null ? !pId.equals(orders.pId) : orders.pId != null) return false;
        if (uId != null ? !uId.equals(orders.uId) : orders.uId != null) return false;
        if (oQuantity != null ? !oQuantity.equals(orders.oQuantity) : orders.oQuantity != null) return false;
        if (oDate != null ? !oDate.equals(orders.oDate) : orders.oDate != null) return false;
        if (statusState != null ? !statusState.equals(orders.statusState) : orders.statusState != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (pId != null ? pId.hashCode() : 0);
        result = 31 * result + (uId != null ? uId.hashCode() : 0);
        result = 31 * result + (oQuantity != null ? oQuantity.hashCode() : 0);
        result = 31 * result + (oDate != null ? oDate.hashCode() : 0);
        result = 31 * result + (statusState != null ? statusState.hashCode() : 0);
        return result;
    }

    public Products getProductsByPId() {
        return productsByPId;
    }

    public void setProductsByPId(Products productsByPId) {
        this.productsByPId = productsByPId;
    }

    public Users getUsersByUId() {
        return usersByUId;
    }

    public void setUsersByUId(Users usersByUId) {
        this.usersByUId = usersByUId;
    }

    public OrderStates getOrderStatesByStatusState() {
        return orderStatesByStatusState;
    }

    public void setOrderStatesByStatusState(OrderStates orderStatesByStatusState) {
        this.orderStatesByStatusState = orderStatesByStatusState;
    }

}
