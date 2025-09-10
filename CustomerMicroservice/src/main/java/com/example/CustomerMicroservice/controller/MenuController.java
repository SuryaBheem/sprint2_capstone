package com.example.CustomerMicroservice.controller;

import com.example.CustomerMicroservice.model.MenuItem;
import com.example.CustomerMicroservice.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuController {

	@Autowired
	private MenuService menuService;

	@GetMapping
	public String showDashboard(Model model) {
		List<MenuItem> menuItems = menuService.getAllMenuItems();
		model.addAttribute("menuItems", menuItems);
		return "menu"; // Redirect to dashboard.jsp
	}
}
