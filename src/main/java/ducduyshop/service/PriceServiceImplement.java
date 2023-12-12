package ducduyshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ducduyshop.dao.PriceDao;
import ducduyshop.entity.Price;

@Service
public class PriceServiceImplement implements IPriceService {
	
	@Autowired
	private PriceDao priceDao;

	public List<Price> getPrices() {
		return priceDao.getPrices();
	}

	public Price getPriceById(int id) {
		return priceDao.getPriceById(id);
	}

	public List<Price> getPricesPagination(int start, int limit) {
		return priceDao.getPricesPagination(start, limit);
	}

	public int create(Price price) {
		return priceDao.create(price);
	}

	public int edit(Price price) {
		return priceDao.edit(price);
	}

	public int delete(int id) {
		return priceDao.delete(id);
	}
	
}
