package com.example.CustomerMicroservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.CustomerMicroservice.model.Customer;
import com.example.CustomerMicroservice.repository.CustomerRepository;

import java.util.List;
import java.util.Optional;

@Service

public class CustomerService {

	@Autowired
	private CustomerRepository customerRepository;

	public boolean isUsernameTaken(String username) {
		return customerRepository.findByUsername(username).isPresent();
	}

	public void saveUser(Customer customer) {
		customerRepository.save(customer);
	}

	public Customer loginUser(String email, String password) throws Exception {
		Optional<Customer> userOpt = customerRepository.findByEmail(email);

		if (userOpt.isPresent()) {
			Customer user = userOpt.get();
			if (user.getPassword().equals(password)) { // Simple password check (not secure)
				return user; // Successful authentication
			} else {
				throw new Exception("Invalid password");
			}
		} else {
			throw new Exception("User not found");
		}
	}
}
