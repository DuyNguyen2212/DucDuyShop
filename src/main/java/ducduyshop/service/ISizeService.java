package ducduyshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import ducduyshop.dto.ProductSize;
import ducduyshop.entity.Size;

@Service
public interface ISizeService {
	public List<ProductSize> getSizeByProductsId(long product_id);
	
	public List<Size> getSizeData();
	
	public List<Size> getSizePagination(int start, int limit);
	
	public int create(Size size);
	
	public int edit(Size size);
	
	public int delete(int id);
	
	public Size getSizeById(int id);
	
	public List<ProductSize> getProductSize();
	
	public List<ProductSize> getProductSizePagination(int start, int limit);
	
	public int create(ProductSize size);
	
	public int edit(ProductSize size);
	
	public int delete(long id);
	
	public ProductSize getProductSizeById(long id);
}
