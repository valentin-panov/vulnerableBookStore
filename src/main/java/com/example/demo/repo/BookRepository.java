package com.example.demo.repo;

import com.example.demo.models.Book;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface BookRepository extends JpaRepository<Book, Long>, BookRepositoryCustom {
    List<Book> findByAuthor(String author);

    List<Book> findByTitleContaining(String title);
}
