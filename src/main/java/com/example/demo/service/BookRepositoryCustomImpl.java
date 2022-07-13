package com.example.demo.service;

import com.example.demo.models.Book;
import com.example.demo.repo.BookRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
import java.util.Objects;

@Repository
public class BookRepositoryCustomImpl implements BookRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Book> findCustomByString(String value) {
        // A1:2017-Injection
        // Use prepared statement to make query
        String queryStr = String.format("SELECT * FROM books WHERE title = '%s' OR summary LIKE '%%%s%%'",
                value, value);
        return entityManager.createNativeQuery(queryStr, Book.class).getResultList();
    }

    @PostConstruct
    public void postConstruct() {
        Objects.requireNonNull(entityManager);
    }

}
