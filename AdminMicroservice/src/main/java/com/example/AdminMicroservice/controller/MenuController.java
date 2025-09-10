package com.example.AdminMicroservice.controller;

import com.example.AdminMicroservice.model.MenuItem;
import com.example.AdminMicroservice.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/menu")
public class MenuController {

	@Autowired
	private MenuService menuService;

	@GetMapping
	public String getMenu(Model model) {
		List<MenuItem> menuList = menuService.getAllItems();
		model.addAttribute("menuList", menuList);
		return "menu"; // Renders menu.jsp
	}

	@GetMapping("/add")
	public String addMenuItem() {
		return "addMenu"; // Returns addMenu.jsp for adding an item
	}

	@GetMapping("/delete/{id}")
	public String deleteMenuItem(@PathVariable int id) {
		menuService.deleteMenuItem(id);
		return "redirect:/admin/menu"; // Redirects back to menu page after deletion
	}

	@PostMapping("/one")
	public String addMenuItem(@ModelAttribute MenuItem menu, Model model) {
		menuService.addMenuItem(menu);
		List<MenuItem> menuList = menuService.getAllItems();
		model.addAttribute("menuList", menuList);
		return "menu"; // Redirects back to menu page
	}

	@PostMapping("/edit")
	public String editMenuItem(@RequestParam int id, Model model) {
		MenuItem menuItem = menuService.getMenuItemById(id);
		if (menuItem == null) {
			return "redirect:/admin/menu"; // Redirect if not found
		}
		model.addAttribute("menuItem", menuItem);
		return "editMenu"; // Show edit form
	}

	@PostMapping("/update")
	public String updateMenuItem(@ModelAttribute MenuItem menu, Model model) {
		menuService.updateMenuItem(menu);
		List<MenuItem> menuList = menuService.getAllItems();
		model.addAttribute("menuList", menuList);
		return "menu"; // Redirects back to menu page
	}
}
