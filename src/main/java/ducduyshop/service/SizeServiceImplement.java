package ducduyshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ducduyshop.dao.SizeDao;
import ducduyshop.dto.ProductSize;
import ducduyshop.entity.Size;

@Service
public class SizeServiceImplement implements ISizeService {
	@Autowired
	private SizeDao sizeDao;

	public List<ProductSize> getSizeByProductsId(long product_id) {
		return sizeDao.getSizeByProductsId(product_id);
	}

	public List<Size> getSizeData() {
		return sizeDao.getSizeData();
	}

	public List<Size> getSizePagination(int start, int limit) {
		return sizeDao.getSizePagination(start, limit);
	}

	public int create(Size size) {
		return sizeDao.create(size);
	}

	public int edit(Size size) {
		return sizeDao.edit(size);
	}

	public int delete(int id) {
		return sizeDao.delete(id);
	}

	public Size getSizeById(int id) {
		return sizeDao.getSizeById(id);
	}

	public List<ProductSize> getProductSize() {
		return sizeDao.getProductSize();
	}

	public List<ProductSize> getProductSizePagination(int start, int limit) {
		return sizeDao.getProductSizePagination(start, limit);
	}

	public int create(ProductSize size) {
		return sizeDao.create(size);
	}

	public int edit(ProductSize size) {
		return sizeDao.edit(size);
	}

	public int delete(long id) {
		return sizeDao.delete(id);
	}

	public ProductSize getProductSizeById(long id) {
		return sizeDao.getProductSizeById(id);
	}

}
