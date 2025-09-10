package com.example.CustomerMicroservice.repository;

import com.example.CustomerMicroservice.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

	// Find all orders by customer ID
	List<Order> findByCustomerId(int customerId);

	// Find orders by order status (e.g., Pending, Delivered, Cancelled)
	List<Order> findByOrderStatus(String orderStatus);

	// Find orders by payment status (e.g., Paid, Unpaid, Refund Initiated)
	List<Order> findByPaymentStatus(String paymentStatus);

	// find all accepted orders from loggeddin customer
	List<Order> findByCustomerIdAndOrderStatus(int customerId, String orderStatus);

}
