package entity;

import javax.persistence.*;

@Entity
public class OrderStates {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false)
    private int id;
    @Basic
    @Column(name = "nameStates", nullable = true, length = 255)
    private String nameStates;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameStates() {
        return nameStates;
    }

    public void setNameStates(String nameStates) {
        this.nameStates = nameStates;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrderStates that = (OrderStates) o;

        if (id != that.id) return false;
        if (nameStates != null ? !nameStates.equals(that.nameStates) : that.nameStates != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (nameStates != null ? nameStates.hashCode() : 0);
        return result;
    }
}
