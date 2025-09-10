package com.example.AdminMicroservice.controller;

import com.example.AdminMicroservice.model.Order;
import com.example.AdminMicroservice.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin/orders")
public class OrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private RestTemplate restTemplate;

	// Show all pending orders
	@GetMapping("/manage")
	public String showOrders(Model model) {
		List<Order> orders = orderService.getPendingOrders();
		model.addAttribute("orders", orders);
		return "admin-orders"; // JSP
	}

	// Accept order
	@PostMapping("/accept")
	public String acceptOrder(@RequestParam("orderId") Long orderId, Model model) {
		orderService.updateOrderStatus(orderId, "Accepted");
		List<Order> orders = orderService.getPendingOrders();
		model.addAttribute("orders", orders);
		return "admin-orders";
	}

	// Reject order
	@PostMapping("/reject")
	public String rejectOrder(@RequestParam("orderId") Long orderId, Model model) {
		orderService.updateOrderStatus(orderId, "Rejected");
		List<Order> orders = orderService.getPendingOrders();
		model.addAttribute("orders", orders);
		return "admin-orders";
	}

	// Generate bill for a customer
	@GetMapping("/generate-bill")
	public String generateBill(@RequestParam("customerId") int customerId, Model model) {
		String url = "http://localhost:8082/api/order/accepted-orders/all";
		ResponseEntity<Order[]> response = restTemplate.getForEntity(url, Order[].class);
		List<Order> allAcceptedOrders = Arrays.asList(response.getBody());

		List<Order> customerOrders = allAcceptedOrders.stream().filter(order -> order.getCustomerId() == customerId)
				.collect(Collectors.toList());

		double totalPrice = customerOrders.stream().mapToDouble(Order::getTotalPrice).sum();

		model.addAttribute("orders", customerOrders);
		model.addAttribute("customerId", customerId);
		model.addAttribute("totalPrice", totalPrice);
		return "customer-bill"; // JSP
	}

	// Show revenue form
	@GetMapping("/revenue")
	public String openMonthlyRevenueForm() {
		return "admin-revenue"; // JSP to input month & year
	}

	// Calculate total revenue for selected month
	@GetMapping("/calculate-revenue")
	public String viewMonthlyRevenue(@RequestParam("month") int month, @RequestParam("year") int year, Model model) {
		String url = "http://localhost:8082/api/order/accepted-orders/all";
		ResponseEntity<Order[]> response = restTemplate.getForEntity(url, Order[].class);
		List<Order> allAcceptedOrders = Arrays.asList(response.getBody());

		double totalRevenue = allAcceptedOrders.stream().filter(order -> {
			Date orderDate = order.getOrderDate();
			LocalDate localDate = orderDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
			return localDate.getMonthValue() == month && localDate.getYear() == year;
		}).mapToDouble(Order::getTotalPrice).sum();

		model.addAttribute("totalRevenue", totalRevenue);
		model.addAttribute("month", month);
		model.addAttribute("year", year);
		return "admin-revenue"; // JSP to show result
	}
}
