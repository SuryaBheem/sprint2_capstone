package com.example.AdminMicroservice.service;

import com.example.AdminMicroservice.model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;
import java.util.List;

@Service
public class OrderService {

	@Autowired
	private RestTemplate restTemplate;

	private static final String CUSTOMER_SERVICE_BASE_URL = "http://localhost:8082/api/order";

	// Fetch only pending orders directly from customer microservice
	public List<Order> getPendingOrders() {
		String url = CUSTOMER_SERVICE_BASE_URL + "/pending";
		Order[] orders = restTemplate.getForObject(url, Order[].class);
		return orders != null ? Arrays.asList(orders) : List.of();
	}

	// Update order status (e.g., Accept or Reject)
	public void updateOrderStatus(Long orderId, String status) {
		String url = CUSTOMER_SERVICE_BASE_URL + "/updateStatus?orderId=" + orderId + "&status=" + status;
		restTemplate.postForObject(url, null, String.class);

	}
}
