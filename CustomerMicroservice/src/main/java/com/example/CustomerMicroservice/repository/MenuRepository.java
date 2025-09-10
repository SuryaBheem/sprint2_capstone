package com.example.CustomerMicroservice.repository;

import com.example.CustomerMicroservice.model.MenuItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuRepository extends JpaRepository<MenuItem, Integer> {
	List<MenuItem> findByCategory(String category);
}
