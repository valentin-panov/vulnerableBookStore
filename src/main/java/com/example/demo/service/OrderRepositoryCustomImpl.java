package com.example.demo.service;

import com.example.demo.models.Order;
import com.example.demo.repo.OrderRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Objects;
import java.util.Optional;

@Repository
public class OrderRepositoryCustomImpl implements OrderRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Optional<Order> findCustomNewByCustomerId(Long id) {
        String queryStr = String.format("SELECT * FROM orders WHERE customer_id = '%s' AND state = 'NEW'",
                id, id);
        Optional<Order> result;
        try {
            result = (Optional<Order>) entityManager.createNativeQuery(queryStr, Order.class).setMaxResults(1)
                    .getResultList()
                    .stream()
                    .findFirst();
        } catch (Exception e) {
            System.out.println("FAILURE!!! " + e.getMessage());
            result = Optional.empty();
        }
        return result;

    }

    @PostConstruct
    public void postConstruct() {
        Objects.requireNonNull(entityManager);
    }

}


