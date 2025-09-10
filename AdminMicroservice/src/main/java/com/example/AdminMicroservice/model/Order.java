package com.example.AdminMicroservice.model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "orders")
public class Order {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long orderId;

	private int customerId;

	private double totalPrice;

	@Column(name = "mode_of_delivery")
	private String modeOfDelivery;

	@Temporal(TemporalType.TIMESTAMP)
	private Date orderDate;

	private String orderStatus; // Example: "Pending", "Processing", "Delivered"

	private String paymentStatus; // Example: "Paid", "Unpaid"

	// Constructors
	public Order() {
		this.orderDate = new Date();
		this.orderStatus = "Pending";
		this.paymentStatus = "Unpaid";
	}

	public Order(int customerId, double totalPrice) {
		this.customerId = customerId;
		this.totalPrice = totalPrice;
		this.orderDate = new Date();
		this.orderStatus = "Pending";
		this.paymentStatus = "Unpaid";
	}

	// Getters and Setters
	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getModeOfDelivery() {
		return modeOfDelivery;
	}

	public void setModeOfDelivery(String modeOfDelivery) {
		this.modeOfDelivery = modeOfDelivery;
	}
}
