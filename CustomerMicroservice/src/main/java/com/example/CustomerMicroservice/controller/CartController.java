package com.example.CustomerMicroservice.controller;

import com.example.CustomerMicroservice.model.Cart;
import com.example.CustomerMicroservice.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;

	// Add an item to the cart
	@PostMapping("/api/cart/add")
	public String addToCart(@RequestParam int itemId, @RequestParam int quantity, // <-- Accept quantity
			HttpSession session) {
		Integer customerIdObj = (Integer) session.getAttribute("customerId");

		if (customerIdObj == null) {
			return "login"; // Redirect to login if session expired
		}

		int customerId = customerIdObj;

		// Pass quantity to service
		cartService.addToCart(customerId, itemId, quantity);

		return "redirect:http://localhost:8082/menu"; // Stay on the menu page after adding items
	}

	// Display the cart page when the user clicks "View Cart"
	@GetMapping("/api/cart/show")
	public String showCart(Model model, HttpSession session) {
		if (session == null || session.getAttribute("customerId") == null) {
			return "redirect:http://localhost:8082/api/users/login"; // Redirect to login if session expired
		}

		int customerId = (Integer) session.getAttribute("customerId");
		List<Cart> cartItems = cartService.getCartItems(customerId);
		model.addAttribute("cartItems", cartItems);
		model.addAttribute("customerId", customerId);
		return "cart"; // Display cart.jsp
	}

	// Remove an item from the cart
	@PostMapping("/api/cart/delete")
	public String removeFromCart(@RequestParam int itemId, HttpSession session, Model model) {
		Integer customerIdObj = (Integer) session.getAttribute("customerId");

		if (customerIdObj == null) {
			return "redirect:/login"; // Redirect to login if session expired
		}

		int customerId = customerIdObj;

		// Remove the item from the cart
		cartService.removeFromCart(customerId, itemId);
		List<Cart> cartItems = cartService.getCartItems(customerId);

		model.addAttribute("cartItems", cartItems);
		model.addAttribute("customerId", customerId); // ✅ Add this line

		// Stay on cart.jsp after removing the item
		return "redirect:/api/cart/show";
	}
}
