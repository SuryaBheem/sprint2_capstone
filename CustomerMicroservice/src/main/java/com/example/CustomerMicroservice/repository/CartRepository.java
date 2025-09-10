package com.example.CustomerMicroservice.repository;

import com.example.CustomerMicroservice.model.Cart;
import com.example.CustomerMicroservice.model.MenuItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartRepository extends JpaRepository<Cart, Integer> {

	// Find a cart item by customerId and menuItem
	Cart findByCustomerIdAndMenuItem(int customerId, MenuItem menuItem);

	// Retrieve all cart items for a specific customer
	List<Cart> findByCustomerId(int customerId);

	// Add method to delete all cart items for a customer
	// void deleteByCustomerId(int customerId);
}
