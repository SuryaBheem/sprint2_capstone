package com.example.AdminMicroservice.repository;

import com.example.AdminMicroservice.model.Order;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Integer> {
	List<Order> findByOrderStatus(String orderStatus);

	List<Order> findByOrderStatusOrderByCustomerId(String orderStatus);

}