package entity;

import Utils.SaveLogin;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.persistence.*;

@Entity
public class Supplier {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false)
    private int id;
    @Basic
    @Column(name = "nameSupplier", nullable = true, length = 255)
    private String nameSupplier;
    @Basic
    @Column(name = "phone", nullable = true, length = 20)
    private String phone;
    @Basic
    @Column(name = "address", nullable = true, length = 2147483647)
    private String address;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameSupplier() {
        return nameSupplier;
    }

    public void setNameSupplier(String nameSupplier) {
        this.nameSupplier = nameSupplier;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Supplier supplier = (Supplier) o;

        if (id != supplier.id) return false;
        if (nameSupplier != null ? !nameSupplier.equals(supplier.nameSupplier) : supplier.nameSupplier != null)
            return false;
        if (phone != null ? !phone.equals(supplier.phone) : supplier.phone != null) return false;
        if (address != null ? !address.equals(supplier.address) : supplier.address != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (nameSupplier != null ? nameSupplier.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        return result;
    }
    private static final Log log = LogFactory.getLog(Supplier.class);

    @PostPersist
    public void logNewUserAdded() {
        log.info("Added supplier: '" + nameSupplier + "' with name: " + SaveLogin.user.getFullName());
    }

    @PostRemove
    public void logUserRemoval() {
        log.info("Deleted supplier: " + nameSupplier + " with name: " + SaveLogin.user.getFullName());
    }

    @PostUpdate
    public void logUserUpdate() {
        log.info("Updated supplier: " + nameSupplier + " with name: " + SaveLogin.user.getFullName());
    }
}
