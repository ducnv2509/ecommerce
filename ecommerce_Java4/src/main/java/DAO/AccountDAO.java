package DAO;

import Utils.BaseService;
import Utils.JpaUtils;
import entity.Supplier;
import entity.Users;
import importExcel.HelloExample;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.PostPersist;
import javax.persistence.TypedQuery;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class AccountDAO extends DAO<Users, Integer> {

    @Override
    public void insert(Users entity) {
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
    public void update(Users entity) {
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
            Users user = em.find(Users.class, key);
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
    public List<Users> findAll() {
        String sql = "select u from Users u order by u.id desc";
        EntityManager em = JpaUtils.getEntityManager();
        TypedQuery<Users> query = em.createQuery(sql, Users.class);
        return query.getResultList();
    }

    @Override
    public Users findByID(Integer key) {
        EntityManager em = JpaUtils.getEntityManager();
        return em.find(Users.class, key);
    }

    public Users findByUsername(String username) {
        EntityManager em = JpaUtils.getEntityManager();
        String jpql = "SELECT obj FROM Users obj WHERE obj.username = :username";
        TypedQuery<Users> query = em.createQuery(jpql, Users.class);
        query.setParameter("username", username);
        return query.getSingleResult();
    }

    public Users checkAccount(String users) {
        String sql = "select  * from users where username = ?";
        try {
            Connection con = BaseService.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, users);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return (new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8), rs.getString(9), rs.getDate(10), rs.getBoolean(11), rs.getBoolean(12)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Users updatePassword(String pass, int id) {
        String sql = "update users set password = ? where id = ? ";
        try {
            Connection con = BaseService.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Users findByUsernameAndEmail(String username, String email) {
        EntityManager em = JpaUtils.getEntityManager();
        String jpql = "select u from Users u where u.username =: username and u.email =: email";
        try {
            TypedQuery<Users> query = em.createQuery(jpql, Users.class);
            query.setParameter("username", username);
            query.setParameter("email", email);
            return query.getSingleResult();
        } finally {
            em.close();
        }
    }

    public Users updatePasswordByUsername(String pass, String username) {
        String sql = "update users set password = ? where username = ?";
        try {
            Connection con = BaseService.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        new AccountDAO().updatePasswordByUsername("333", "demo");
        System.out.println("ok");
    }
}
