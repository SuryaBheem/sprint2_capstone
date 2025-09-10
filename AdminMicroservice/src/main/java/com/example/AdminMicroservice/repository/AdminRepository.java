package com.example.AdminMicroservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.AdminMicroservice.model.Admin;
import java.util.Optional;

public interface AdminRepository extends JpaRepository<Admin, Integer> {
	Optional<Admin> findByUsername(String username);

	Optional<Admin> findByEmail(String email);
}
