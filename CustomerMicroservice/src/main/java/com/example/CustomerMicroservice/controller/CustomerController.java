package com.example.CustomerMicroservice.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.CustomerMicroservice.model.Customer;
import com.example.CustomerMicroservice.service.CustomerService;
import com.example.CustomerMicroservice.repository.CustomerRepository;

@Controller
@RequestMapping("/api/users")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	@Autowired
	private CustomerRepository customerRepository;

	@GetMapping("/logout")
	public String logout(HttpSession session, Model model) {
		session.invalidate(); // Invalidate the session to log out the user
		model.addAttribute("logoutMessage", "You're logged out successfully.");
		return "login"; // Redirect to login.jsp
	}

	@GetMapping("/register")
	public String showRegistrationForm(Model model) {
		return "register"; // Return register.jsp
	}

	@PostMapping("/register")
	public String registerUser(@ModelAttribute Customer customer, Model model) {
		boolean exists = customerService.isUsernameTaken(customer.getUsername());

		if (exists) {
			model.addAttribute("message", "Username already taken. Please choose another.");
			return "register"; // Redirect to register.jsp with the error message
		} else {
			customerService.saveUser(customer);
			model.addAttribute("message", "Customer registered sucessfully.");
			return "sucess"; // Redirect to success.jsp after successful registration
		}
	}

	@GetMapping("/login")
	public String showLoginPage() {
		return "login"; // Return login.jsp
	}

	@PostMapping("/login")
	public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model,
			HttpSession session) { // Add HttpSession parameter
		try {
			Customer customer = customerService.loginUser(email, password); // Authenticate user
			int customerId = customer.getId(); // Assuming customer.getId() returns int
			// Store customerId in session
			session.setAttribute("customerId", Integer.valueOf(customerId)); // Convert to Integer
			model.addAttribute("Customer", customer);
			return "dashboard"; // Redirect to dashboard after successful login
		} catch (Exception e) {
			model.addAttribute("logoutMessage", "Invalid email or password");
			return "login"; // Show login page with error message
		}
	}

	@GetMapping("/dashboard")
	public String showDashboard(HttpSession session, Model model) {
		Integer customerId = (Integer) session.getAttribute("customerId");
		if (customerId == null) {
			return "redirect:/api/users/login"; // Redirect to login if no customer is logged in
		}

		// Use the predefined findById method to fetch the customer
		Customer customer = customerRepository.findById(customerId).orElse(null); // orElse to handle null if not found
		if (customer == null) {
			return "login"; // Redirect to login if customer not found
		}

		model.addAttribute("Customer", customer); // Add the customer details to the model
		return "dashboard"; // Return dashboard.jsp
	}
}
