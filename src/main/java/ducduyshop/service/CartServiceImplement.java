package ducduyshop.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ducduyshop.dao.CartDao;
import ducduyshop.dto.CartDto;
import ducduyshop.entity.Cart;

@Service
public class CartServiceImplement implements ICartService {

	@Autowired
	private CartDao cartDao;

	public List<CartDto> addToCart(long id, int quantity, int size_id, List<CartDto> cart, String username) {
		return cartDao.addToCart(id, quantity, size_id, cart, username);
	}

	public List<CartDto> editCartItem(long id, int quantity, int size_id, List<CartDto> cart, String username) {
		return cartDao.editCartItem(id, quantity, size_id, cart, username);
	} 

	public List<CartDto> deleteCartItem(long id, int size_id, List<CartDto> cart, String username) {
		return cartDao.deleteCartItem(id, size_id, cart, username);
	}

	public int totalQuantity(List<CartDto> cart) {
		return cartDao.totalQuantity(cart);
	}

	public BigDecimal totalPrice(List<CartDto> cart) {
		return cartDao.totalPrice(cart);
	}

	public int deleteCartByUsername(String username) {
		return cartDao.deleteCartByUsername(username);
	}

	public int create(Cart cart) {
		return cartDao.create(cart);
	}

	public int edit(Cart cart) {
		return cartDao.edit(cart);
	}

	public int deleteBySession(long id, int size_id, String username) {
		return cartDao.deleteBySession(id, size_id, username);
	}

	public List<Cart> getCartsDataByUsername(String username) {
		return cartDao.getCartsDataByUsername(username);
	}

	public List<CartDto> createCartSession(List<Cart> cart, String username) {
		return cartDao.createCartSession(cart, username);
	}

	public List<Cart> getCartsData() {
		return cartDao.getCartData();
	}

	public List<Cart> getCartsDataPagination(int start, int limit) {
		return cartDao.getCartDataPagination(start, limit);
	}

	public int delete(long id) {
		return cartDao.delete(id);
	}

	public Cart getCartById(long id) {
		return cartDao.getCartById(id);
	}
}
