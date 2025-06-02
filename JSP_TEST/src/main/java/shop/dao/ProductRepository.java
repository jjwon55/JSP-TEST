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
        String sql = "SELECT * FROM product";
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getString("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setPrice(rs.getInt("price"));
                product.setStock(rs.getInt("stock"));
                list.add(product);
            }
        } catch (SQLException e) {
            System.err.println("[상품 목록 조회] 오류 발생");
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
        String sql = "SELECT * FROM product WHERE product_name LIKE ?";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, "%" + keyword + "%");
            rs = psmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getString("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setPrice(rs.getInt("price"));
                product.setStock(rs.getInt("stock"));
                list.add(product);
            }
        } catch (SQLException e) {
            System.err.println("[상품 검색 목록 조회] 오류 발생");
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
                product.setProductId(rs.getString("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setPrice(rs.getInt("price"));
                product.setStock(rs.getInt("stock"));
            }
        } catch (SQLException e) {
            System.err.println("[상품 조회] 오류 발생");
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
        String sql = "INSERT INTO product (product_id, product_name, price, stock) VALUES (?, ?, ?, ?)";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, product.getProductId());
            psmt.setString(2, product.getProductName());
            psmt.setInt(3, product.getPrice());
            psmt.setInt(4, product.getStock());
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("[상품 등록] 오류 발생");
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
        String sql = "UPDATE product SET product_name = ?, price = ?, stock = ? WHERE product_id = ?";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, product.getProductName());
            psmt.setInt(2, product.getPrice());
            psmt.setInt(3, product.getStock());
            psmt.setString(4, product.getProductId());
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("[상품 수정] 오류 발생");
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
            System.err.println("[상품 삭제] 오류 발생");
            e.printStackTrace();
        }
        return result;
	}

}





























