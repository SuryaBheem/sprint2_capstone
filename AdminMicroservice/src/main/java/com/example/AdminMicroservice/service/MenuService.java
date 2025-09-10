package com.example.AdminMicroservice.service;

import com.example.AdminMicroservice.model.MenuItem;
import com.example.AdminMicroservice.repository.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Optional;

import java.util.List;

@Service
public class MenuService {

	@Autowired
	private MenuRepository menuRepository;

	public List<MenuItem> getAllItems() {
		return menuRepository.findAll();
	}

	public MenuItem addMenuItem(MenuItem menu) {
		return menuRepository.save(menu);
	}

	public void deleteMenuItem(int id) {
		menuRepository.deleteById(id);
	}

	// Get a menu item by ID
	public MenuItem getMenuItemById(int id) {
		Optional<MenuItem> menuItem = menuRepository.findById(id);
		return menuItem.orElse(null); // Returns null if not found
	}

	// Update an existing menu item
	public void updateMenuItem(MenuItem updatedItem) {
		if (menuRepository.existsById(updatedItem.getId())) {
			menuRepository.save(updatedItem); // Save updated menu item
		}
	}
}
