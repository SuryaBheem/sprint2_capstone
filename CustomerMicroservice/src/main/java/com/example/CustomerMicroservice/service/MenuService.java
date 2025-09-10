package com.example.CustomerMicroservice.service;

import com.example.CustomerMicroservice.model.MenuItem;
import com.example.CustomerMicroservice.repository.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class MenuService {

	@Autowired
	private MenuRepository menuRepository;

	public List<MenuItem> getAllMenuItems() {
		return menuRepository.findAll();
	}
}
