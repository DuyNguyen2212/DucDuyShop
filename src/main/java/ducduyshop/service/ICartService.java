package ducduyshop.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import ducduyshop.dto.CartDto;
import ducduyshop.entity.Cart;

@Service
public interface ICartService {
	public List<CartDto> addToCart(long id, int quantity, int size_id, List<CartDto> cart, String username);
	
	public List<CartDto> editCartItem(long id, int quantity, int size_id, List<CartDto> cart, String username);
	
	public List<CartDto> deleteCartItem(long id, int size_id, List<CartDto> cart, String username);
	
	public int totalQuantity(List<CartDto> cart);
	
	public BigDecimal totalPrice(List<CartDto> cart);
	
	public int deleteCartByUsername(String username);
	
	public int create(Cart cart);
	
	public int edit(Cart cart);
	
	public int deleteBySession(long id, int size_id, String username);
	
	public List<Cart> getCartsDataByUsername(String username);
	
	public List<CartDto> createCartSession(List<Cart> cart, String username);
	
	public List<Cart> getCartsData();
	
	public List<Cart> getCartsDataPagination(int start, int limit);
	
	public int delete(long id);
	
	public Cart getCartById(long id);
}
