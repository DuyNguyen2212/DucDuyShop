package ducduyshop.dto;

public class ProductSize {
	private long id;
	private long product_id;
	private int size_id;
	private String size;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getProduct_id() {
		return product_id;
	}

	public void setProduct_id(long product_id) {
		this.product_id = product_id;
	}

	public int getSize_id() {
		return size_id;
	}

	public void setSize_id(int size_id) {
		this.size_id = size_id;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}
}
