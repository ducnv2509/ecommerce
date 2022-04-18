package DAO;

import Utils.BaseService;
import Utils.JpaUtils;
import entity.Favorite;
import entity.Products;
import entityOrder.Cart;
import lombok.extern.log4j.Log4j2;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Log4j2
public class ProductsDAO extends DAO<Products, Integer> {

    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public ProductsDAO(Connection con) {
        this.con = con;
    }

    public ProductsDAO() {

    }

    @Override
    public void insert(Products entity) {
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

    public void insertExcel(List<Products> entity) {
        EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            final int numberOfRecords = 30;
            final int batchSize = 10;
            for (int i = 0; i <= entity.size() - 1; i++) {
                em.persist(entity.get(i));
                if (i % batchSize == 20) {
                    log.info("Flush a batch of INSERT & release memory: {} time(s)", (i / batchSize));
                    em.flush();
                    em.clear();
                }
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
    public void update(Products entity) {
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
            Products user = em.find(Products.class, key);
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
    public List<Products> findAll() {
        String sql = "select u from Products u order by u.id desc ";
        EntityManager em = JpaUtils.getEntityManager();
        TypedQuery<Products> query = em.createQuery(sql, Products.class);
        return query.getResultList();
    }

    @Override
    public Products findByID(Integer key) {
        return null;
    }

    public int getTotalProducts() {
        String sql = "select count(*) from products";
        try {
            Connection con = BaseService.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Products> pagingAccount(int index) {
        List<Products> list = new ArrayList<>();
        String sql = "select  * from products order by id offset  ? rows  fetch next 6 rows  only";
        try {
            Connection con = BaseService.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 6);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getDate(11)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public List<Products> getProductByCategory(int id) {
        String sql = "select u from Products u where u.id =:id";
        EntityManager em = JpaUtils.getEntityManager();
        TypedQuery<Products> query = em.createQuery(sql, Products.class);
        return query.getResultList();
    }

    public List<Products> getProductByIdCategory(int index) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from products where category_id = ?";
        try {
            Connection con = BaseService.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, index);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getDate(11)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Products getProductByID(int index) {
        String sql = "select * from products where id = ?";
        try {
            Connection con = BaseService.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, index);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return (new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getDate(11)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public Favorite findByIDFv(Integer key) {
        EntityManager em = JpaUtils.getEntityManager();
        return em.find(Favorite.class, key);
    }

    public List<Products> searchProductByName(String search) {
        List<Products> list = new ArrayList<>();
        String sql = "select  * from products where nameProduct like ?";
        try {
            Connection con = BaseService.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getDate(11)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Products> getTop3() {
        List<Products> list = new ArrayList<>();
        String sql = "select  top 3 * from products";
        try {
            Connection con = BaseService.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getDate(11)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Products> getNextTop3(int amount) {
        List<Products> list = new ArrayList<>();
        String sql = "select  * from products order by  id offset ? rows fetch  next  3 rows  only ";
        try {
            Connection con = BaseService.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, amount);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getDate(11)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Sử lý order
    public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select price from products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        sum += rs.getInt("price") * item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }


    public Products getSingleProduct(int id) {
        Products row = null;
        try {
            query = "select * from products where id=? ";

            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                row = new Products();
                row.setId(rs.getInt("id"));
                row.setNameProduct(rs.getString("nameProduct"));
                row.setCategoryId(rs.getInt("category_id"));
                row.setPrice((rs.getInt("price")));
                row.setImageProduct(rs.getString("imageProduct"));
                row.setSize(rs.getString("size"));
                row.setSupplierId(rs.getInt("supplier_id"));
                row.setColor(rs.getString("color"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return row;
    }

    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> book = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select * from products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setId(rs.getInt("id"));
                        row.setNameProduct(rs.getString("nameProduct"));
                        row.setCategoryId(rs.getInt("category_id"));
                        row.setPrice(rs.getInt("price") * item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        book.add(row);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }

}
