package com.example.CustomerMicroservice.controller;

import com.example.CustomerMicroservice.model.Payment;
import com.example.CustomerMicroservice.model.Order;
import com.example.CustomerMicroservice.service.PaymentService;
import com.example.CustomerMicroservice.service.OrderService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping
public class PaymentController {

	@Autowired
	private PaymentService paymentService;

	@Autowired
	private OrderService orderService;

	// Show payment page with order details
	@PostMapping("/proceedToPayment")
	public String proceedToPayment(@RequestParam("orderId") Long orderId, @RequestParam("totalPrice") double totalPrice,
			Model model) {
		model.addAttribute("orderId", orderId);
		model.addAttribute("totalPrice", totalPrice);
		return "payment"; // Redirects to payment.jsp
	}

	// Process payment
	@PostMapping("/processPayment")
	public String processPayment(@RequestParam("orderId") Long orderId, @RequestParam("totalPrice") double amount,
			@RequestParam("paymentMethod") String paymentMethod, Model model) {

		// Update payment status in database
		Payment payment = paymentService.processPayment(orderId, amount, paymentMethod);

		// Update order's payment status
		orderService.updatePaymentStatus(orderId, "Paid");

		// Pass payment details to success page
		model.addAttribute("payment", payment);
		return "payment-sucess"; // Redirects to payment-success.jsp
	}
}
