package ducduyshop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import ducduyshop.entity.Price;

public class PriceMapper implements RowMapper<Price> {

	public Price mapRow(ResultSet rs, int rowNum) throws SQLException {
		Price price = new Price();
		
		price.setId(rs.getInt("id"));
		price.setFrom(rs.getInt("fromprice"));
		price.setTo(rs.getInt("toprice"));
		
		return price;
	}

}
