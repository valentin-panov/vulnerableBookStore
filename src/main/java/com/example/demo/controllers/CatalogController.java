package com.example.demo.controllers;

import com.example.demo.models.Book;
import com.example.demo.repo.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Optional;

@Controller
@RequestMapping("/catalog")
public class CatalogController {
    @Autowired
    BookRepository bookRepository;

    @GetMapping()
    public String catalog(String name, Model model) {
        Iterable<Book> books = bookRepository.findAll();
        model.addAttribute("name", name);
        model.addAttribute("books", books);
        return "catalog/catalog";
    }

    @GetMapping("/{id}")
    public String getBookById(@PathVariable("id") long id, Model model) {
        Optional<Book> book = bookRepository.findById(id);
        if (book.isPresent()) {
            model.addAttribute("book", book.get());
            return "catalog/book";
        } else {
            return "error404";
        }
    }
}