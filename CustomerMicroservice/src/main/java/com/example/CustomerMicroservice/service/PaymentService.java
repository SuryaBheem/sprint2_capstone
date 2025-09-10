package com.example.CustomerMicroservice.service;

import com.example.CustomerMicroservice.model.Payment;
import com.example.CustomerMicroservice.repository.PaymentRepository;
import com.example.CustomerMicroservice.model.Order;
import com.example.CustomerMicroservice.service.OrderService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Optional;

@Service
public class PaymentService {

	@Autowired
	private PaymentRepository paymentRepository;

	// Process the payment and save it to the database
	public Payment processPayment(Long orderId, double totalPrice, String paymentMethod) {
		Payment payment = new Payment();
		payment.setOrderId(orderId);
		payment.setAmount(totalPrice);
		payment.setPaymentMethod(paymentMethod);
		payment.setPaymentDate(new Date());
		payment.setPaymentStatus("SUCCESS"); // Assuming payment is successful

		paymentRepository.save(payment);
		return payment;
	}

}
