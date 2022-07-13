package com.example.demo.repo;

import com.example.demo.models.Book;

import java.util.List;

public interface BookRepositoryCustom {
    List<Book> findCustomByString(String value);

}