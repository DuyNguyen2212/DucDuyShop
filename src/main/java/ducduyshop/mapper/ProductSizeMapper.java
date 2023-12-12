package ducduyshop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import ducduyshop.dto.ProductSize;

public class ProductSizeMapper implements RowMapper<ProductSize> {

	public ProductSize mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProductSize size = new ProductSize();
		size.setId(rs.getLong("id"));
		size.setProduct_id(rs.getLong("product_id"));
		size.setSize_id(rs.getInt("size_id"));
		return size;
	}

}
