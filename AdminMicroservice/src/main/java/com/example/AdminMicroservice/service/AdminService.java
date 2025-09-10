package com.example.AdminMicroservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.AdminMicroservice.model.Admin;
import com.example.AdminMicroservice.repository.AdminRepository;

import java.util.List;
import java.util.Optional;

@Service

public class AdminService {

	@Autowired
	private AdminRepository adminRepository;

	public boolean isUsernameTaken(String username) {
		return adminRepository.findByUsername(username).isPresent();
	}

	public void saveAdmin(Admin admin) {
		adminRepository.save(admin);
	}

	public Admin loginAdmin(String email, String password) throws Exception {
		Optional<Admin> userOpt = adminRepository.findByEmail(email);
		if (userOpt.isPresent()) {
			Admin user = userOpt.get();

			if (user.getPassword().equals(password)) {

				return user;
			} else {

				throw new Exception("Invalid password");
			}
		} else {

			throw new Exception("Admin not found");
		}
	}

}
