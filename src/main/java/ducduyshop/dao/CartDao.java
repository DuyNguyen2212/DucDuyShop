package ducduyshop.dao;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ducduyshop.dto.CartDto;
import ducduyshop.dto.ProductDto;
import ducduyshop.entity.Cart;
import ducduyshop.mapper.CartMapper;

@Repository
public class CartDao extends BaseDao {
	@Autowired
	private ProductDao productDao;
	
	public int create(Cart cart) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO `cart` (`id`, `product_id`, `username`, `quantity`, `total`, `size_id`) ");
		sql.append("VALUES ");
		sql.append("(NULL, '" + cart.getProduct_id() + "', ");
		sql.append(" '" + cart.getUsername() + "', ");
		sql.append(" '" + cart.getQuantity() + "', ");
		sql.append(" '" + cart.getTotal() + ", ");
		sql.append(" '" + cart.getSize_id() + "')");
		int create = jdbcTemplate.update(sql.toString());
		return create;
	}
	
	public int create(CartDto cart, String username, int size_id) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO `cart` (`id`, `product_id`, `username`, `quantity`, `total`, `size_id`) ");
		sql.append("VALUES ");
		sql.append("(NULL, '" + cart.getProduct().getId() + "', ");
		sql.append(" '" + username + "', ");
		sql.append(" '" + cart.getQuantity() + "', ");
		sql.append(" '" + cart.getTotalPrice() + "', ");
		sql.append(" '" + size_id + "')");
		int create = jdbcTemplate.update(sql.toString());
		return create;
	}
	
	public int edit(Cart cart) {
		StringBuffer sql = new StringBuffer();
		sql.append("UPDATE `cart` SET `product_id`='" + cart.getProduct_id() + "', ");
		sql.append("`username`='" + cart.getUsername() + "', ");
		sql.append("`quantity`='" + cart.getQuantity() + "', ");
		sql.append("`total`='" + cart.getTotal() + "' ");
		sql.append("`size_id`='" + cart.getSize_id() + "' ");
		sql.append("WHERE id=" + cart.getId());
		int edit = jdbcTemplate.update(sql.toString());
		return edit;
	}
	
	public int updateBySession(CartDto cart, String username, int size_id) {
		StringBuffer sql = new StringBuffer();
		sql.append("UPDATE `cart` SET ");
		sql.append("`quantity`='" + cart.getQuantity() + "', ");
		sql.append("`total`='" + cart.getTotalPrice() + "' ");
		sql.append("WHERE product_id=" + cart.getProduct().getId() + " ");
		sql.append("AND username='" + username + "'");
		sql.append("AND size_id='" + size_id + "'");
		int update = jdbcTemplate.update(sql.toString());
		return update;
	}
	
	public int deleteBySession(long id, int size_id, String username) {
		String sql = "DELETE FROM `cart` WHERE product_id='" + id + "' AND username='" + username + "'"
				+ " AND size_id='" + size_id + "'";
		int delete = jdbcTemplate.update(sql);
		return delete;
	}
	
	public int delete(long id) {
		String sql = "DELETE FROM `cart` WHERE id=" + id;
		int delete = jdbcTemplate.update(sql);
		return delete;
	}
	
	public Cart getCartByProductIdAndSizeId(long product_id, int size_id) {
		String sql = "SELECT * FROM `cart` WHERE product_id='" + product_id + "'" +
					 " AND size_id='" + size_id + "'";		
		Cart cart = jdbcTemplate.queryForObject(sql, new CartMapper());
		
		return cart;
	}
	
	public int getQuantityByProduct(long id, List<CartDto> cart) {
		int quantity = 0;
		
		for(CartDto cartItem : cart) {
			if(cartItem.getProduct().getId() == id)
				quantity += cartItem.getQuantity();
		}
		
		return quantity;
	}
	
	public int getNumberByProduct(long id, List<CartDto> cart) {
		int num = 0;
		
		for(CartDto cartItem : cart) {
			if(cartItem.getProduct().getId() == id)
				num += 1;
		}
		
		return num;
	}
	
	public List<CartDto> addToCart(long id, int quantity, int size_id, List<CartDto> cart, String username) {
		try {
			if(quantity <= 0) return cart;
			
			ProductDto product = productDao.getTheProductById(id);
			CartDto itemCart = getCartItemById(cart, id, size_id);
			
			if(product != null && itemCart != null) {
				for(CartDto item : cart) {
					if(item.getProduct().getId() == id && item.getSize_id() == size_id) {
						if(product.getQuantity() < (item.getQuantity() + quantity)) {
							return cart;
						}
						item.setQuantity(item.getQuantity() + quantity);
						item.setSize_id(size_id);
						BigDecimal totalNoSaleoff = BigDecimal.valueOf(item.getQuantity()).multiply(product.getPrice());
						if(item.getProduct().getSale_off() > 0) {
							double saleOff = item.getProduct().getSale_off() / 100.0;
							item.setTotalPrice(totalNoSaleoff.subtract(totalNoSaleoff.multiply(BigDecimal.valueOf(saleOff).setScale(2, RoundingMode.HALF_UP))));
						}
						else {
							item.setTotalPrice(totalNoSaleoff);
						}
						updateBySession(item, username, size_id);
						return cart;
					}
				}
				
			}
			else if(product != null && itemCart == null) {
				CartDto item = new CartDto();
				if(product.getQuantity() < quantity) {
					return cart;
				}
				item.setQuantity(quantity);
				item.setSize_id(size_id);
				BigDecimal totalNoSaleoff = BigDecimal.valueOf(item.getQuantity()).multiply(product.getPrice());
				if(product.getSale_off() > 0) {
					double saleOff = product.getSale_off() / 100.0;
					item.setTotalPrice(totalNoSaleoff.subtract(totalNoSaleoff.multiply(BigDecimal.valueOf(saleOff).setScale(2, RoundingMode.HALF_UP))));
				}
				else {
					item.setTotalPrice(totalNoSaleoff);
				}
				item.setProduct(product);
				cart.add(item);
				create(item, username, size_id);
			}
			return cart;
			
		}
		catch (Exception e) {
			e.printStackTrace();
			return cart;
		}
	}
	
	public List<CartDto> editCartItem(long id, int quantity, int size_id, List<CartDto> cart, String username) {
		try {
			ProductDto product = productDao.getTheProductById(id);
			CartDto item = getCartItemById(cart, id, size_id);
			
			if(product != null && item != null) {
				for(CartDto cartItem : cart) {
					
					if(cartItem.getProduct().getId() == id && cartItem.getSize_id() == size_id) {
						
						if(getNumberByProduct(id, cart) == 1 && product.getQuantity() < quantity)
							cartItem.setQuantity(product.getQuantity());
						else if(getNumberByProduct(id, cart) > 1 && getQuantityByProduct(id, cart) + (quantity - cartItem.getQuantity()) > product.getQuantity()) {
							cartItem.setQuantity(cartItem.getQuantity());
						}
						else if(quantity <= 0)
							cartItem.setQuantity(1);
						else
							cartItem.setQuantity(quantity);
						
						BigDecimal totalNoSaleoff = BigDecimal.valueOf(cartItem.getQuantity()).multiply(product.getPrice());
						if(cartItem.getProduct().getSale_off() > 0) {
							double saleOff = cartItem.getProduct().getSale_off() / 100.0;
							cartItem.setTotalPrice(totalNoSaleoff.subtract(totalNoSaleoff.multiply(BigDecimal.valueOf(saleOff).setScale(2, RoundingMode.HALF_UP))));
						}
						else {
							cartItem.setTotalPrice(totalNoSaleoff);
						}
						
						updateBySession(cartItem, username, size_id);
						return cart;
					}
				}
			}
			
			return cart;
		} 
		catch (Exception e) {
			System.out.println("Có lỗi: " + e);
			return cart;
		}
	}
	
	public List<CartDto> deleteCartItem(long id, int size_id, List<CartDto> cart,String username) {
		try {
			for(CartDto cartItem : cart) {
				if(cartItem.getProduct().getId() == id && cartItem.getSize_id() == size_id) {
					cart.remove(cartItem);
					break;
				}
			}
			deleteBySession(id, size_id, username);
			return cart;
		} 
		catch (Exception e) {
			System.out.println("Có lỗi: " + e);
			return cart;
		}
	}
	
	public int totalQuantity(List<CartDto> cart) {
		int totalQuantity = 0;

		for(CartDto item : cart) {
			totalQuantity += item.getQuantity();
		}	
		return totalQuantity;
	}
	
	public BigDecimal totalPrice(List<CartDto> cart) {
		BigDecimal totalPrice = new BigDecimal("0");
		
		for(CartDto item : cart) {
			totalPrice = totalPrice.add(item.getTotalPrice());
		}
		return totalPrice;
	}
	
	public int deleteCartByUsername(String username) {
		String sql = "DELETE FROM `cart` WHERE username='" + username + "'";
		int delete = jdbcTemplate.update(sql);
		return delete;
	}
	
	public List<Cart> getCartsDataByUsername(String username) {
		String sql = "SELECT * FROM `cart` WHERE username='" + username + "'";
		List<Cart> list = jdbcTemplate.query(sql, new CartMapper());
		return list;
	}
	
	public List<CartDto> createCartSession(List<Cart> cart, String username) {
		List<CartDto> cartSession = new ArrayList<CartDto>();
		for(Cart item : cart) {
			ProductDto product = productDao.getTheProductById(item.getProduct_id());
			if(product != null) {
				CartDto itemCart = new CartDto();
				itemCart.setProduct(product);
				itemCart.setQuantity(item.getQuantity());
				itemCart.setSize_id(item.getSize_id());
				BigDecimal totalNoSaleOff = BigDecimal.valueOf(itemCart.getQuantity()).multiply(product.getPrice());
				if(product.getSale_off() > 0) {
					double saleoff = product.getSale_off() / 100.0;
					itemCart.setTotalPrice(totalNoSaleOff.subtract(totalNoSaleOff.multiply(BigDecimal.valueOf(saleoff).setScale(2, RoundingMode.HALF_UP))));
					updateBySession(itemCart, username, item.getSize_id());
				}
				else {
					itemCart.setTotalPrice(item.getTotal());
				}
				cartSession.add(itemCart);
			}
		}
		return cartSession;
	}
	
	public List<Cart> getCartData() {
		String sql = "SELECT * FROM `cart`";
		List<Cart> list = jdbcTemplate.query(sql, new CartMapper());
		return list;
	}
	
	public List<Cart> getCartDataPagination(int start, int limit) {
		String sql = "SELECT * FROM `cart` LIMIT " + start + ", " + limit;
		List<Cart> pagination = jdbcTemplate.query(sql, new CartMapper());
		return pagination;
	}
	
	public Cart getCartById(long id) {
		String sql = "SELECT * FROM `cart` WHERE id=" + id;
		Cart cart = jdbcTemplate.queryForObject(sql, new CartMapper());
		return cart;
	}
	
	public CartDto getCartItemById(List<CartDto> cart, long id, int size_id) {
		for(CartDto item : cart) {
			if(item.getProduct().getId() == id && item.getSize_id() == size_id)
				return item;
		}
		return null;
	}
}
