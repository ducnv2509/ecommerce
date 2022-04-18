package importExcel;

import entity.Category;
import entity.Supplier;
import lombok.extern.log4j.Log4j2;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

@Log4j2
public class HibernateExamle {
    public static void main(String[] args) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            Supplier supplier = new Supplier();
            supplier.setNameSupplier("Vũ Bắc");
            supplier.setAddress("Bắc Ninh");
            supplier.setPhone("0987654321");
            entityManager.persist(supplier);
            log.debug("Insert new category: " + supplier);

            transaction.commit();
            System.out.println("OK");
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            entityManager.close();
            entityManagerFactory.close();
        }
    }
}
