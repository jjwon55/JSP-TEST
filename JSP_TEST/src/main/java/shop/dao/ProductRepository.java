package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Product;

public class ProductRepository extends JDBConnection {
	
	/**
	 * 상품 목록
	 * @return
	 */
	public List<Product> list() {
		List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product ORDER BY reg_date DESC";
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                list.add(new Product());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
	}
	
	
	/**
	 * 상품 목록 검색
	 * @param keyword
	 * @return
	 */
	public List<Product> list(String keyword) {
		List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE name LIKE ? ORDER BY reg_date DESC";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, "%" + keyword + "%");
            rs = psmt.executeQuery();
            while (rs.next()) {
                list.add(new Product());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
	}
	
	/**
	 * 상품 조회
	 * @param productId
	 * @return
	 */
	public Product getProductById(String productId) {
		Product product = null;
        String sql = "SELECT * FROM product WHERE product_id = ?";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, productId);
            rs = psmt.executeQuery();
            if (rs.next()) {
                product = new Product();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
	}
	
	
	/**
	 * 상품 등록
	 * @param product
	 * @return
	 */
	public int insert(Product product) {
		int result = 0;
        String sql = "INSERT INTO product (product_id, name, price, stock) VALUES (?, ?, ?, ?)";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, product.getProductId());
            psmt.setString(2, product.getName());
            psmt.setInt(3, product.getUnitPrice());
            psmt.setLong(4, product.getUnitsInStock());
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
	}
	
	
	/**
	 * 상품 수정
	 * @param product
	 * @return
	 */
	public int update(Product product) {
		int result = 0;
        String sql = "UPDATE product SET name = ?, price = ?, stock = ? WHERE product_id = ?";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, product.getName());
            psmt.setInt(2, product.getUnitPrice());
            psmt.setLong(3, product.getUnitsInStock());
            psmt.setString(4, product.getProductId());
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
	}
	
	
	
	/**
	 * 상품 삭제
	 * @param product
	 * @return
	 */
	public int delete(String productId) {
		int result = 0;
        String sql = "DELETE FROM product WHERE product_id = ?";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, productId);
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
	}

}





























