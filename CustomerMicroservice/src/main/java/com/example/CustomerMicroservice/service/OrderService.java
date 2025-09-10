package com.example.CustomerMicroservice.service;

import com.example.CustomerMicroservice.model.Order;
import com.example.CustomerMicroservice.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.CustomerMicroservice.service.CartService;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;

	@Autowired
	private CartService cartService;

	// Place an order
	public Order placeOrder(int customerId, double totalPrice, String modeOfDelivery) {
		double taxPercentage = 1.0; // 1% tax
		double taxAmount = totalPrice * taxPercentage / 100;
		double finalTotal = totalPrice + taxAmount; // 💰 updated total

		Order order = new Order();
		order.setCustomerId(customerId);
		order.setTotalPrice(finalTotal); // 🟢 store final price with tax
		order.setOrderDate(Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant()));
		order.setOrderStatus("Pending");
		order.setPaymentStatus("Unpaid");
		order.setModeOfDelivery(modeOfDelivery);

		orderRepository.save(order);
		cartService.clearCart(customerId);

		return order;
	}

	// Get order history for a customer
	public List<Order> getOrdersByCustomerId(int customerId) {
		return orderRepository.findByCustomerId(customerId);
	}

	// ✅ Update payment status
	public void updatePaymentStatus(Long orderId, String status) {
		Optional<Order> optionalOrder = orderRepository.findById(orderId);
		if (optionalOrder.isPresent()) {
			Order order = optionalOrder.get();
			order.setPaymentStatus(status);
			order.setOrderStatus("Pending");
			orderRepository.save(order);
		}
	}

	// Cancel an order
	public boolean cancelOrder(Long orderId) {
		Optional<Order> optionalOrder = orderRepository.findById(orderId);
		if (optionalOrder.isPresent()) {
			Order order = optionalOrder.get();
			if (!"Delivered".equalsIgnoreCase(order.getOrderStatus())) {
				// Only allow cancellation before delivery
				order.setOrderStatus("Cancelled");
				// Update payment status
				if ("Paid".equalsIgnoreCase(order.getPaymentStatus())
						|| "Delivery Initiated".equalsIgnoreCase(order.getPaymentStatus())) {
					order.setPaymentStatus("Refund Initiated");
				} else {
					order.setPaymentStatus("No-Refund Needed");
				}

				orderRepository.save(order);
				return true;
			}
		}
		return false;
	}

	// Fetch all orders (for Admin Microservice)
	public List<Order> getAllOrders() {
		return orderRepository.findAll();
	}

	// Fetch pending orders (for Admin Microservice)
	public List<Order> getOrdersByStatus(String status) {
		return orderRepository.findByOrderStatus(status);
	}

	// Update order status (for Admin Microservice)
	public Optional<Order> getOrderById(Long orderId) {
		return orderRepository.findById(orderId);
	}

	// sending all accepedd orders to admin
	public List<Order> getAllAcceptedOrders() {
		return orderRepository.findByOrderStatus("Accepted");
	}

	public void updateOrder(Order order) {
		orderRepository.save(order);
	}

}
