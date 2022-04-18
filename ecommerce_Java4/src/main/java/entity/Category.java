package entity;

import Utils.SaveLogin;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.persistence.*;

@Entity
public class Category {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false)
    private int id;
    @Basic
    @Column(name = "nameCategory", nullable = true, length = 255)
    private String nameCategory;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameCategory() {
        return nameCategory;
    }

    public void setNameCategory(String nameCategory) {
        this.nameCategory = nameCategory;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Category category = (Category) o;

        if (id != category.id) return false;
        if (nameCategory != null ? !nameCategory.equals(category.nameCategory) : category.nameCategory != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (nameCategory != null ? nameCategory.hashCode() : 0);
        return result;
    }

    private static final Log log = LogFactory.getLog(Category.class);

    @PostPersist
    public void logNewUserAdded() {
        log.info("Added nameCategory: '" + nameCategory + "' with name: " + SaveLogin.user.getFullName());
    }

    @PostRemove
    public void logUserRemoval() {
        log.info("Deleted nameCategory: " + nameCategory + " with name: " + SaveLogin.user.getFullName());
    }

    @PostUpdate
    public void logUserUpdate() {
        log.info("Updated nameCategory: " + nameCategory + " with name: " + SaveLogin.user.getFullName());
    }
}
