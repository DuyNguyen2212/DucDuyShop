package ducduyshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import ducduyshop.entity.Price;

@Service
public interface IPriceService {
	public List<Price> getPrices();
	
	public Price getPriceById(int id);
	
	public List<Price> getPricesPagination(int start, int limit);
	
	public int create(Price price);
	
	public int edit(Price price);
	
	public int delete(int id);
}
