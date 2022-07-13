package com.example.demo.controllers;

import com.example.demo.models.Book;
import com.example.demo.repo.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
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

    @GetMapping("/custom")
    public String findBookByString(Model model, @RequestParam(required = true, defaultValue = "any") String q) {

        List<Book> books = bookRepository.customFindMethod(q);
        if (!books.isEmpty()) {
            model.addAttribute("title", "Books contains [" + q + "]");
            model.addAttribute("books", books);
            return "catalog/catalog";
        } else {
            return "error404";
        }
    }

}