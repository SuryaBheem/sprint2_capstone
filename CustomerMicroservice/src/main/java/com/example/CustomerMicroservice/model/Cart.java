package com.example.CustomerMicroservice.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Cart {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id; // ID field as integer

	private int customerId; // The ID of the customer who owns the cart item

	@ManyToOne
	@JoinColumn(name = "menu_item_id")
	private MenuItem menuItem; // The menu item in the cart

	private int quantity; // Quantity of the menu item added to the cart

	// Default constructor
	public Cart() {
	}

	// Constructor with fields
	public Cart(int customerId, MenuItem menuItem, int quantity) {
		this.customerId = customerId;
		this.menuItem = menuItem;
		this.quantity = quantity;
	}

	// Getters and setters for the fields
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public MenuItem getMenuItem() {
		return menuItem;
	}

	public void setMenuItem(MenuItem menuItem) {
		this.menuItem = menuItem;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
