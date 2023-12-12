package ducduyshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ducduyshop.dao.CompanyDao;
import ducduyshop.entity.Company;

@Service
public class CompanyServiceImplement implements ICompanyService {

	@Autowired
	private CompanyDao companyDao;

	public List<Company> getCompaniesData() {
		return companyDao.getCompaniesData();
	}

	public Company getCompanyByCompanyId(int company_id) {
		return companyDao.getCompanyByCompanyId(company_id);
	}

	public int create(Company company) {
		return companyDao.create(company);
	}

	public int edit(Company company) {
		return companyDao.edit(company);
	}

	public int delete(int id) {
		return companyDao.delete(id);
	}

	public List<Company> getCompaniesDataPagination(int start, int limit) {
		return companyDao.getCompaniesDataPagination(start, limit);
	}

	public List<Company> get6CompaniesRandom() {
		return companyDao.get6CompaniesRandom();
	}
}
