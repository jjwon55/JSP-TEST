package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Product;

public class ProductIORepository extends JDBConnection {

	/**
	 * 상품 입출고 등록
	 * @param product
	 * @param type
	 * @return
	 */
	public int insert(Product product) {
		int result = 0;
        String sql = "INSERT INTO product_io (product_id, amount, status) VALUES (?, ?, ?)";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, product.getProductId());
            psmt.setInt(2, product.getAmount());
            psmt.setString(3, product.getStatus());
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
	}
	

}