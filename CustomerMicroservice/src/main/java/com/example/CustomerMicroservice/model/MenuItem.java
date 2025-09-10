package com.example.CustomerMicroservice.model;

import jakarta.persistence.*;

@Entity
@Table(name = "menu_items")
public class MenuItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;
	private String category; // Pizza, Sides, Beverages, etc.
	private int price;

	public MenuItem() {
	}

	public MenuItem(String name, String category, int price) {
		this.name = name;
		this.category = category;
		this.price = price;
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
}
