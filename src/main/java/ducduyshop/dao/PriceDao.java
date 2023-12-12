package ducduyshop.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ducduyshop.entity.Price;
import ducduyshop.mapper.PriceMapper;

@Repository
public class PriceDao extends BaseDao {
	public List<Price> getPrices() {
		String sql = "SELECT * FROM price";
		List<Price> list = jdbcTemplate.query(sql, new PriceMapper());
		return list;
	}
	
	public Price getPriceById(int id) {
		String sql = "SELECT * FROM price WHERE id='" + id + "'";
		Price price = jdbcTemplate.queryForObject(sql, new PriceMapper());
		return price;
	}
	
	public List<Price> getPricesPagination(int start, int limit) {
		String sql = "SELECT * FROM price LIMIT " + start + ", " + limit;
		List<Price> list = jdbcTemplate.query(sql, new PriceMapper());
		return list;
	}
	
	public int create(Price price) {
		String sql = "INSERT INTO `price` (`id`, `fromprice`, `toprice`) VALUES(NULL, '" + price.getFrom() + "', '" + price.getTo() + "')";
		int create = jdbcTemplate.update(sql);
		
		return create;
	}
	
	public int edit(Price price) {
		String sql = "UPDATE `price` SET fromprice='" + price.getFrom() + "', toprice='" + price.getTo() + "' WHERE id='" + price.getId() + "'";
		int edit = jdbcTemplate.update(sql);
		
		return edit;
	}
	
	public int delete(int id) {
		String sql = "DELETE FROM price WHERE id='" + id + "'";
		int delete = jdbcTemplate.update(sql);
		
		return delete;
	}
}
