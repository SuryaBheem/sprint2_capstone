package com.example.CustomerMicroservice.controller;

import com.example.CustomerMicroservice.model.Order;
import com.example.CustomerMicroservice.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/api/order")
public class OrderController {

	@Autowired
	private OrderService orderService;

	// Checkout: Place an order
	@PostMapping("/checkout")
	public String placeOrder(@RequestParam int customerId, @RequestParam double totalPrice,
			@RequestParam String modeOfDelivery, Model model) {

		Order order = orderService.placeOrder(customerId, totalPrice, modeOfDelivery);
		model.addAttribute("order", order);
		return "order-confirmation";
	}

	// Get order history for a customer
	@GetMapping("/history")
	public String getOrderHistory(HttpSession session, Model model) {
		Integer customerIdObj = (Integer) session.getAttribute("customerId");

		if (customerIdObj == null) {
			return "login"; // Redirect to login if session expired
		}

		int customerId = customerIdObj;
		List<Order> orders = orderService.getOrdersByCustomerId(customerId);
		model.addAttribute("orders", orders);

		return "order-history";
	}

	// Cancel an order
	@PostMapping("/cancelOrder")
	public String cancelOrder(@RequestParam("orderId") Long orderId, HttpSession session, Model model) {
		Integer customerIdObj = (Integer) session.getAttribute("customerId");

		boolean isCancelled = orderService.cancelOrder(orderId);
		if (isCancelled) {
			model.addAttribute("message", "Order has been canceled successfully.");
		} else {
			model.addAttribute("error", "Order cancellation failed.");
		}

		int customerId = customerIdObj;
		List<Order> orders = orderService.getOrdersByCustomerId(customerId);
		model.addAttribute("orders", orders);

		return "order-history";
	}

	// Fetch all pending orders**
	@GetMapping("/pending")
	@ResponseBody
	public ResponseEntity<List<Order>> getPendingOrders() {
		List<Order> pendingOrders = orderService.getOrdersByStatus("Pending");
		return ResponseEntity.ok(pendingOrders);
	}

	// Update order status (Accept/Reject)**
	@PostMapping("/updateStatus")
	public ResponseEntity<String> updateOrderStatus(@RequestParam Long orderId, @RequestParam String status) {

		Optional<Order> optionalOrder = orderService.getOrderById(orderId);
		if (optionalOrder.isPresent()) {
			Order order = optionalOrder.get();
			order.setOrderStatus(status);
			if ("Rejected".equalsIgnoreCase(status) && "Paid".equalsIgnoreCase(order.getPaymentStatus())) {
				order.setPaymentStatus("RefundInitiated");
			}
			if ("Accepted".equalsIgnoreCase(status) && "Paid".equalsIgnoreCase(order.getPaymentStatus())) {
				order.setPaymentStatus("Delivery initiated");
			}
			orderService.updateOrder(order);
			return ResponseEntity.ok("Order status updated to: " + status);
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Order not found");
	}

	// for admin bill generating
	// Get Accepted Orders for customers (used by Admin to generate bill)
	@GetMapping("/accepted-orders/all")
	@ResponseBody
	public ResponseEntity<List<Order>> getAllAcceptedOrders() {
		List<Order> acceptedOrders = orderService.getAllAcceptedOrders(); // Fetch all accepted
		return ResponseEntity.ok(acceptedOrders);
	}

}
