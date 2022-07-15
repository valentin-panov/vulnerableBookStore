package com.example.demo.repo;

import com.example.demo.models.OrderDetails;

import java.util.List;


public interface OrderDetailsRepositoryCustom {

    List<OrderDetails> findCustomByOrderId(Long id);
}
