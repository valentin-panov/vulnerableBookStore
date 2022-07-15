package com.example.demo.repo;

import com.example.demo.models.OrderDetails;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;


public interface OrderDetailsRepository extends JpaRepository<OrderDetails, Long>, OrderDetailsRepositoryCustom {
    Optional<OrderDetails> findById(Long id);

}
