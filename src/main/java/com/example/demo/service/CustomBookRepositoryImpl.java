package com.example.demo.service;

import com.example.demo.models.Book;
import com.example.demo.repo.CustomBookRepository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

public class CustomBookRepositoryImpl implements CustomBookRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Book> customFindMethod(String value) {
        // A1:2017-Injection
        // Use prepared statement to make query
        String queryStr = String.format("SELECT * FROM books WHERE username = '%s' OR email LIKE '%%%s%%'",
                value, value);
        return (List<Book>) entityManager.createNativeQuery(queryStr, Book.class).getResultList();
    }

}
