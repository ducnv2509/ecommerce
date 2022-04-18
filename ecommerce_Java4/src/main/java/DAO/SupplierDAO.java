package DAO;

import Utils.JpaUtils;
import entity.Supplier;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import java.util.List;

public class SupplierDAO extends DAO<Supplier, Integer> {
    @Override
    public void insert(Supplier entity) {
        EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(entity);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public void update(Supplier entity) {
        EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(entity);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public void delete(Integer key) throws Exception {
        EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            Supplier user = em.find(Supplier.class, key);
            if (user != null) {
                em.remove(user);
            } else {
                throw new Exception("Not find");
            }
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public List<Supplier> findAll() {
        String sql = "select u from Supplier u";
        EntityManager em = JpaUtils.getEntityManager();
        TypedQuery<Supplier> query = em.createQuery(sql, Supplier.class);
        return query.getResultList();
    }

    @Override
    public Supplier findByID(Integer key) {
        EntityManager em = JpaUtils.getEntityManager();
        return em.find(Supplier.class, key);
    }
}
