package com.example.demo.service;

import com.example.demo.models.User;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Service
public class SQLiService {
    @PersistenceContext
    private EntityManager entityManager;

    public List<User> findByString(String value) {
        // A1:2017-Injection
        // Use prepared statement to make query
        String queryStr = String.format("SELECT * FROM users WHERE username = '%s' OR email LIKE '%%%s%%'",
                value, value);
        List<User> result = entityManager.createNativeQuery(queryStr, User.class).getResultList();
        for (User row : result) {
            System.out.println(row);
        }

        return result;
    }
}