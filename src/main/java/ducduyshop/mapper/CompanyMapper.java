package ducduyshop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import ducduyshop.entity.Company;

public class CompanyMapper implements RowMapper<Company> {

	public Company mapRow(ResultSet rs, int rowNum) throws SQLException {
		Company company = new Company();
		company.setId(rs.getInt("id"));
		company.setName(rs.getString("name"));
		company.setImage(rs.getString("image"));
		return company;
	}

}
