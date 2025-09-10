package com.example.CustomerMicroservice.service;

import com.example.CustomerMicroservice.model.Cart;
import com.example.CustomerMicroservice.model.MenuItem;
import com.example.CustomerMicroservice.repository.CartRepository;
import com.example.CustomerMicroservice.repository.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {

	@Autowired
	private CartRepository cartRepository;

	@Autowired
	private MenuRepository menuRepository;

	// Add item to cart or update quantity if it already exists
	public void addToCart(int customerId, int itemId, int quantity) {
		MenuItem menuItem = menuRepository.findById(itemId).orElse(null);

		if (menuItem != null) {
			Cart existingCartItem = cartRepository.findByCustomerIdAndMenuItem(customerId, menuItem);

			if (existingCartItem != null) {
				// Update quantity
				existingCartItem.setQuantity(existingCartItem.getQuantity() + quantity);
				cartRepository.save(existingCartItem);
			} else {
				// Add new item with given quantity
				Cart cartItem = new Cart(customerId, menuItem, quantity);
				cartRepository.save(cartItem);
			}
		}
	}

	// Retrieve cart items for a customer
	public List<Cart> getCartItems(int customerId) {
		return cartRepository.findByCustomerId(customerId);
	}

	// Remove item from cart
	public void removeFromCart(int customerId, int itemId) {
		MenuItem menuItem = menuRepository.findById(itemId).orElse(null);

		if (menuItem != null) {
			Cart existingCartItem = cartRepository.findByCustomerIdAndMenuItem(customerId, menuItem);

			if (existingCartItem != null) {
				cartRepository.delete(existingCartItem);
			}
		}
	}

	public void clearCart(int customerId) {
		List<Cart> cartItems = cartRepository.findByCustomerId(customerId);
		cartRepository.deleteAll(cartItems);

	}

}
