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
        String sql = "INSERT INTO `order` "
        		+ "(order_no, ship_name, zip_code, country, address, date, order_pw, user_id, total_price, phone) "
        		+ "VALUES (?, ?, ?, ?, ?)";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, order.getOrderNo());
            psmt.setString(2, order.getShipName());
            psmt.setString(3, order.getZipCode());
            psmt.setString(4, order.getCountry());
            psmt.setString(5, order.getAddress());
            psmt.setString(6, order.getDate());
            psmt.setString(7, order.getOrderPw());
            psmt.setString(8, order.getUserId());
            psmt.setInt(9, order.getTotalPrice());
            psmt.setString(10, order.getPhone());
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("[주문 등록] 오류 발생");
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
            System.err.println("[최근 주문번호 조회] 오류 발생");
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
        String sql = "SELECT p.product_id, p.product_name, p.price, o.order_cnt FROM product p, order_detail o, `order` od WHERE p.product_id = o.product_id AND o.order_no = od.order_no AND od.user_id = ?";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, userId);
            rs = psmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getString("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setPrice(rs.getInt("price"));
                product.setOrderCnt(rs.getInt("order_cnt"));
                list.add(product);
            }
        } catch (SQLException e) {
            System.err.println("[회원 주문 내역 조회] 오류 발생");
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
        String sql = "SELECT p.product_id, p.product_name, p.price, o.order_cnt FROM product p, order_detail o, `order` od WHERE p.product_id = o.product_id AND o.order_no = od.order_no AND od.order_phone = ? AND od.order_pw = ?";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, phone);
            psmt.setString(2, orderPw);
            rs = psmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getString("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setPrice(rs.getInt("price"));
                product.setOrderCnt(rs.getInt("order_cnt"));
                list.add(product);
            }
        } catch (SQLException e) {
            System.err.println("[비회원 주문 내역 조회] 오류 발생");
            e.printStackTrace();
        }
        return list;
	}
	
}






























