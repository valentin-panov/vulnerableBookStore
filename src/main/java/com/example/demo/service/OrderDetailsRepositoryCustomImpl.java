package com.example.demo.service;

import com.example.demo.models.OrderDetails;
import com.example.demo.repo.OrderDetailsRepositoryCustom;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

public class OrderDetailsRepositoryCustomImpl implements OrderDetailsRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<OrderDetails> findCustomByOrderId(Long id) {
        String queryStr = String.format("SELECT * FROM order_details WHERE order_id = '%s'",
                id, id);
        return entityManager.createNativeQuery(queryStr, OrderDetails.class).getResultList();


    }
}


