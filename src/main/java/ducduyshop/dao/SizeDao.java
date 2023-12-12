package ducduyshop.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ducduyshop.dto.ProductSize;
import ducduyshop.entity.Size;
import ducduyshop.mapper.ProductSizeMapper;
import ducduyshop.mapper.SizeMapper;

@Repository
public class SizeDao extends BaseDao {
	
	public List<ProductSize> getSizeByProductsId(long product_id) {
		String sql = "SELECT productsize.id, productsize.product_id, productsize.size_id, size.size "
				+ "FROM productsize INNER JOIN size "
				+ "ON productsize.size_id = size.id "
				+ "WHERE productsize.product_id = '" + product_id + "'";
		List<ProductSize> list = jdbcTemplate.query(sql, new ProductSizeMapper());
		
		return list;
	}
	
	public List<Size> getSizeData() {
		String sql = "SELECT * FROM `size`";
		List<Size> list = jdbcTemplate.query(sql, new SizeMapper());
		return list;
	}
	
	public Size getSizeById(int id) {
		String sql = "SELECT * FROM `size` WHERE id='" + id + "'";
		Size size = jdbcTemplate.queryForObject(sql, new SizeMapper());
		
		return size;
	}
	
	public ProductSize getProductSizeById(long id) {
		String sql = "SELECT * FROM `productsize` WHERE id='" + id + "'";
		ProductSize size = jdbcTemplate.queryForObject(sql, new ProductSizeMapper());
		
		return size;
	}
	
	public List<Size> getSizePagination(int start, int limit) {
		String sql = "SELECT * FROM `size` LIMIT " + start + ", " + limit;
		List<Size> list = jdbcTemplate.query(sql, new SizeMapper());
		return list;
	}
	
	public List<ProductSize> getProductSizePagination(int start, int limit) {
		String sql = "SELECT * FROM `productsize` LIMIT " + start + ", " + limit;
		List<ProductSize> list = jdbcTemplate.query(sql, new ProductSizeMapper());
		return list;
	}
	
	public int create(ProductSize size) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO `productsize` ");
		sql.append("(`id`, `product_id`, `size_id`) ");
		sql.append("VALUES (NULL, '" + size.getProduct_id() + "', '" + size.getSize_id() + "');");
		int insert = jdbcTemplate.update(sql.toString());
		return insert;
	}
	
	public int create(Size size) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO `size` ");
		sql.append("(`id`, `size`) ");
		sql.append("VALUES (NULL, '" + size.getSize() + "');");
		int insert = jdbcTemplate.update(sql.toString());
		return insert;
	}
	
	public int edit(ProductSize size) {
		StringBuffer sql = new StringBuffer();
		sql.append("UPDATE `productsize` ");
		sql.append("SET `size_id` = '" + size.getSize_id() + "' ");
		sql.append("WHERE id=" + size.getId());
		int edit = jdbcTemplate.update(sql.toString());
		return edit;
	}
	
	public int edit(Size size) {
		StringBuffer sql = new StringBuffer();
		sql.append("UPDATE `size` ");
		sql.append("SET `size` = '" + size.getSize() + "' ");
		sql.append("WHERE `category`.`id` = " + size.getId());
		int edit = jdbcTemplate.update(sql.toString());
		return edit;
	}
	
	public int delete(long id) {
		String sql = "DELETE FROM `productsize` WHERE id='" + id + "'";
		int delete = jdbcTemplate.update(sql);
		
		return delete;
	}
	
	public int delete(int id) {
		String sql = "DELETE FROM `size` WHERE id='" + id + "'";
		int delete = jdbcTemplate.update(sql);
		
		return delete;
	}
	
	public List<ProductSize> getProductSize() {
		String sql = "SELECT * FROM `productsize`";
		List<ProductSize> list = jdbcTemplate.query(sql, new ProductSizeMapper());
		
		return list;
	}
}
