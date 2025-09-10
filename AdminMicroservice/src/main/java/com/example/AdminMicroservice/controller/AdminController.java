package com.example.AdminMicroservice.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.AdminMicroservice.model.Admin;
import com.example.AdminMicroservice.service.AdminService;
import com.example.AdminMicroservice.repository.AdminRepository;

@Controller
@RequestMapping("/api/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private AdminRepository adminRepository;

	@GetMapping("/logout")
	public String logout(HttpSession session, Model model) {
		session.invalidate(); // Invalidate session to log out the admin
		model.addAttribute("logoutMessage", "You're logged out successfully.");
		return "login"; // Redirect to login.jsp
	}

	@GetMapping("/login")
	public String showLoginPage() {
		return "login"; // Return login.jsp
	}

	@PostMapping("/login")
	public String loginAdmin(@RequestParam("email") String email, @RequestParam("password") String password,
			Model model, HttpSession session) {
		try {
			Admin admin = adminService.loginAdmin(email, password); // Authenticate admin
			session.setAttribute("adminId", admin.getId()); // Store adminId in session
			model.addAttribute("admin", admin);
			return "dashboard"; // Redirect to dashboard.jsp after login
		} catch (Exception e) {
			model.addAttribute("logoutMessage", "Invalid email or password");
			return "login"; // Show login page with error message
		}
	}

	@GetMapping("/register")
	public String showRegistrationForm(Model model) {
		return "register"; // Return register.jsp for admin registration
	}

	@PostMapping("/register")
	public String registerAdmin(@ModelAttribute Admin admin, Model model) {
		boolean exists = adminService.isUsernameTaken(admin.getUsername());

		if (exists) {
			model.addAttribute("message", "Username already taken. Please choose another.");
			return "register"; // Redirect to register.jsp with an error message
		} else {
			adminService.saveAdmin(admin);
			model.addAttribute("message", "Admin registered successfully.");
			return "sucess"; // Redirect to success.jsp after successful registration
		}
	}

	@GetMapping("/dashboard")
	public String showDashboard(HttpSession session, Model model) {
		Integer adminId = (Integer) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/api/admin/login"; // Redirect to login if not authenticated
		}

		Admin admin = adminRepository.findById(adminId).orElse(null);
		if (admin == null) {
			return "login"; // Redirect to login if admin not found
		}

		model.addAttribute("admin", admin);
		return "dashboard"; // Return dashboard.jsp
	}
}
