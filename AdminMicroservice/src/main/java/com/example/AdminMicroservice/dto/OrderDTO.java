package com.example.AdminMicroservice.dto;

import java.util.Date;

public class OrderDTO {
	private Long orderId;
	private int customerId;
	private double totalPrice;
	private String modeOfDelivery;
	private Date orderDate;
	private String orderStatus;
	private String paymentStatus;

	// Constructors
	public OrderDTO() {
	}

	public OrderDTO(Long orderId, int customerId, double totalPrice, String modeOfDelivery, Date orderDate,
			String orderStatus, String paymentStatus) {
		this.orderId = orderId;
		this.customerId = customerId;
		this.totalPrice = totalPrice;
		this.modeOfDelivery = modeOfDelivery;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.paymentStatus = paymentStatus;
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

	public String getModeOfDelivery() {
		return modeOfDelivery;
	}

	public void setModeOfDelivery(String modeOfDelivery) {
		this.modeOfDelivery = modeOfDelivery;
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
}
