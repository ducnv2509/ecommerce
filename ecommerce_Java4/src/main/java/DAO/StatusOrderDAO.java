package DAO;

import Utils.BaseService;
import Utils.JpaUtils;
import entity.*;
import entityOrder.Order;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StatusOrderDAO {

    public List<FlowStatus> ListStatus(int id) {
        List<FlowStatus> list = new ArrayList<>();
        String sql = "SELECT orders.id, p.id, imageProduct, nameProduct, size, color, o_quantity, price, price*orders.o_quantity as total, statusState, orders.o_date  FROM orders JOIN users u on u.id = orders.u_id\n" + "JOIN products p on orders.p_id = p.id JOIN orderStates oS on orders.statusState = oS.id where u_id = ? and statusState = 1 or statusState = 2";
        try {
            Connection con = BaseService.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new FlowStatus(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getString(11)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<FlowStatus> ListStatus1() {
        List<FlowStatus> list = new ArrayList<>();
        String sql = "SELECT orders.id, fullName, imageProduct, nameProduct, size, color, o_quantity, price, price*orders.o_quantity as total, statusState, orders.o_date  FROM orders JOIN users u on u.id = orders.u_id JOIN products p on orders.p_id = p.id JOIN orderStates oS on orders.statusState = oS.id where statusState = 1 or statusState = 2 order by orders.id desc";
        try {
            Connection con = BaseService.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new FlowStatus(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getString(11)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<FlowStatus> historyOrder(int id, int[] stt) {
        List<FlowStatus> list = new ArrayList<>();
        String sql = "SELECT orders.id,p.id,imageProduct,nameProduct,size,color,o_quantity,price,price * orders.o_quantity as total,\n" +
                "       statusState, orders.o_date\n" +
                "                FROM orders JOIN users u on u.id = orders.u_id JOIN products p\n" +
                "                on orders.p_id = p.id JOIN orderStates oS on orders.statusState = oS.id\n" +
                "                where ( statusState = 3 or statusState = 4) and u_id = ?";
        try {
            Connection con = BaseService.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new FlowStatus(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs
                        .getString(11)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<FlowStatus> historyOrderByAdmin(int id) {
        List<FlowStatus> list = new ArrayList<>();
        String sql = "SELECT orders.id, fullName, imageProduct, nameProduct, size, color, o_quantity, price, price*orders.o_quantity as total, statusState\n" +
                "FROM orders JOIN users u on u.id = orders.u_id JOIN products p on orders.p_id = p.id JOIN orderStates oS on orders.statusState = oS.id where (statusState = 2 or statusState = 3 or statusState = 4) and u.id = ?";
        try {
            Connection con = BaseService.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
//                list.add(new FlowStatus(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
//                        rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Orders updateStatus(int status, int id) {
        String sql = "update orders set statusState = ? where id = ?";
        try {
            Connection con = BaseService.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public Orders findByID(Integer key) {
        EntityManager em = JpaUtils.getEntityManager();
        return em.find(Orders.class, key);
    }


    public List<OrderStates> findAll() {
        String sql = "select u from OrderStates u ";
        EntityManager em = JpaUtils.getEntityManager();
        TypedQuery<OrderStates> query = em.createQuery(sql, OrderStates.class);
        return query.getResultList();
    }

    public static void main(String[] args) {
        System.out.println(new StatusOrderDAO().updateStatus(3, 6));
    }
}
