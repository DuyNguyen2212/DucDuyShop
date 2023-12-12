package ducduyshop.entity;

import java.math.BigDecimal;

public class Cart {
	private long id;
	private long product_id;
	private String username;
	private int quantity;
	private BigDecimal total;
	private int size_id;

	public Cart() {
		super();
	}

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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public int getSize_id() {
		return size_id;
	}

	public void setSize_id(int size_id) {
		this.size_id = size_id;
	}
}
