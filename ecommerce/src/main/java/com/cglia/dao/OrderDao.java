package com.cglia.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import com.cglia.model.*;
/**
 * 
 * @author venkata.marni
 *@since 22-05-2023
 *@version 1.0
 */
public class OrderDao {
	
	private Connection connection;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    /**
     * 
     * @param Instantiates the connection
     */
	public OrderDao(Connection connection) {
		this.connection = connection;
	}
    /**
     * 
     * @param order
     * @return true if data inserted to the database else false if not inserted to the database
     */
	public boolean insertOrder(Order order) {
        boolean result = false;
        try {
            query = "insert into venkat.orders (product_id, user_id, order_quantity, ordered_date) values(?,?,?,?)";
            pst = connection.prepareStatement(query);
            pst.setInt(1, order.getId());
            pst.setInt(2, order.getUserId());
            pst.setInt(3, order.getOrderQuantity());
            pst.setString(4, order.getOrderDate());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
	}
	
	/**
	 * 
	 * @param id-uses userId 
	 * @return returns a list of orders ordered by user based on his user id
	 */
    public List<Order> userOrders(int id) {
        List<Order> list = new ArrayList<>();
        try {
            query = "select * from venkat.orders where user_id=? order by orders.order_id desc";
            pst = connection.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                ProductDao productDao = new ProductDao(connection);
                int pId = rs.getInt("product_id");
                Product product = productDao.getSingleProduct(pId);
                order.setOrderId(rs.getInt("order_id"));
                order.setId(pId);
                order.setName(product.getName());
                order.setCategory(product.getCategory());
                order.setPrice(product.getPrice()*rs.getInt("order_quantity"));
                order.setOrderQuantity(rs.getInt("order_quantity"));
                order.setOrderDate(rs.getString("ordered_date"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }