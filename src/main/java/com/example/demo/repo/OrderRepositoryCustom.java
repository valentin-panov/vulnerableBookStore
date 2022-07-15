package com.example.demo.repo;

import com.example.demo.models.Order;

import java.util.Optional;

public interface OrderRepositoryCustom {
    Optional<Order> findCustomNewByCustomerId(Long id);
}
