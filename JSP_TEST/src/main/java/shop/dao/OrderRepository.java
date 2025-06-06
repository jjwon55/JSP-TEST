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
	    String sql = "INSERT INTO `order` (ship_name, zip_code, country, address, date, order_pw, user_id, total_price, phone) "
	               + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	    try {
	        psmt = con.prepareStatement(sql);
	        psmt.setString(1, order.getShipName());
	        psmt.setString(2, order.getZipCode());
	        psmt.setString(3, order.getCountry());
	        psmt.setString(4, order.getAddress());
	        psmt.setDate(5, new java.sql.Date(System.currentTimeMillis())); // 또는 LocalDate.now()
	        psmt.setString(6, order.getOrderPw());
	        psmt.setString(7, order.getUserId());
	        psmt.setInt(8, order.getTotalPrice());
	        psmt.setString(9, order.getPhone());

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
	// 회원용: userId 기준 최근 주문번호 조회
	public int lastOrderNo(String userId) {
	    int orderNo = -1;
	    String sql = "SELECT MAX(order_no) AS order_no FROM `order` WHERE user_id = ?";
	    try {
	        psmt = con.prepareStatement(sql);
	        psmt.setString(1, userId);
	        rs = psmt.executeQuery();
	        if (rs.next()) {
	            orderNo = rs.getInt("order_no");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return orderNo;
	}

	// 비회원용: phone + orderPw 기준 최근 주문번호 조회
	public int lastOrderNo(String phone, String orderPw) {
	    int orderNo = -1;
	    String sql = "SELECT MAX(order_no) AS order_no FROM `order` WHERE phone = ? AND order_pw = ?";
	    try {
	        psmt = con.prepareStatement(sql);
	        psmt.setString(1, phone);
	        psmt.setString(2, orderPw);
	        rs = psmt.executeQuery();
	        if (rs.next()) {
	            orderNo = rs.getInt("order_no");
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






























