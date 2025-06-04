package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Order;
import shop.dto.Product;

public class OrderRepository extends JDBConnection {
	
	/**
	 * 주문 등록
	 * @param user
	 * @return
	 */
	public int insert(Order order) {
		int result = 0;
        String sql = "INSERT INTO `order` (user_id, order_pw, phone) VALUES (?, ?, ?)";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, order.getUserId());
            psmt.setString(2, order.getOrderPw());
            psmt.setString(3, order.getPhone());
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
	}

	/**
	 * 최근 등록한 orderNo 
	 * @return
	 */
	public int lastOrderNo() {
		int orderNo = 0;
        String sql = "SELECT MAX(order_no) FROM `order`";
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                orderNo = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderNo;
	}

	
	/**
	 * 주문 내역 조회 - 회원
	 * @param userId
	 * @return
	 */
	public List<Product> list(String userId) {
		List<Product> list = new ArrayList<>();
        String sql = "SELECT p.* FROM product p JOIN order_detail od ON p.product_id = od.product_id JOIN `order` o ON od.order_no = o.order_no WHERE o.user_id = ?";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, userId);
            rs = psmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
	}
	
	/**
	 * 주문 내역 조회 - 비회원
	 * @param phone
	 * @param orderPw
	 * @return
	 */
	public List<Product> list(String phone, String orderPw) {
		
		List<Product> list = new ArrayList<>();
        String sql = "SELECT p.* FROM product p JOIN order_detail od ON p.product_id = od.product_id JOIN `order` o ON od.order_no = o.order_no WHERE o.phone = ? AND o.order_pw = ?";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, phone);
            psmt.setString(2, orderPw);
            rs = psmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
	}
	
}






























