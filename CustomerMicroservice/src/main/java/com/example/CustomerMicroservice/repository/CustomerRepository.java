package com.example.CustomerMicroservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.CustomerMicroservice.model.Customer;
import java.util.Optional;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
	Optional<Customer> findByUsername(String username);

	Optional<Customer> findByEmail(String email);

}
