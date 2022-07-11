package com.example.demo.controllers;

import com.example.demo.models.Book;
import com.example.demo.repo.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/admin/books")
public class booksController {

    @Autowired
    BookRepository bookRepository;

    @GetMapping()
    public String bookList(Model model) {
        Iterable<Book> books = bookRepository.findAll();
        model.addAttribute("title", "Books list");
        model.addAttribute("books", books);
        return "admin/bookList";
    }

    @GetMapping("/{id}")
    public String getUserById(@PathVariable("id") long id, Model model) {
        Optional<Book> book = bookRepository.findById(id);
        if (book.isPresent()) {
            model.addAttribute("title", "Book ID#" + book.get().getId() + " view");
            model.addAttribute("book", book.get());
            return "admin/bookView";
        } else {
            return "error404";
        }
    }

    @GetMapping("/new")
    public String createBooks(Model model) {
        model.addAttribute("title", "New book registration");
        model.addAttribute("method", "post");
        return "admin/bookCRUD";
    }

    @GetMapping("/{id}/edit")
    public String editBookById(@PathVariable("id") long id, Model model) {
        Optional<Book> book = bookRepository.findById(id);
        if (book.isPresent()) {
            model.addAttribute("title", "Book CRUD service");
            model.addAttribute("method", "patch");
            model.addAttribute("book", book.get());
            return "admin/bookCRUD";
        } else {
            return "error404";
        }
    }

    @PostMapping(consumes = "application/x-www-form-urlencoded")
    public String createBook(Book book, Model model) {
//    public String createBook(@ModelAttribute("book") @Valid Book book, BindingResult bindingresult, Model model) {
//        if (bindingresult.hasErrors()) {
//            model.addAttribute("book", book);
//            return "admin/bookCRUD";
//        }
        try {
            Book _book = bookRepository.save(new Book(book.getIsbn(), book.getAuthor(), book.getTitle(), book.getSummary(), book.getCover(), book.getCurrency(), (int) book.getPrice()));
            model.addAttribute("added", _book);
        } catch (Exception e) {
            model.addAttribute("errors", e);
            model.addAttribute("book", book);
            return "admin/bookCRUD";
        }
        return "redirect:/admin/books/";
    }

    @DeleteMapping("/{id}")
    public String deleteBook(@PathVariable("id") long id) {
        try {
            System.out.println(id);
            bookRepository.deleteById(id);
            return "redirect:/admin/books/";
        } catch (Exception e) {
            return "/error404";
        }
    }

//
//    @PatchMapping("/{id}")
//    public String updateUser(@ModelAttribute("user") @Valid User user, BindingResult bindingresult) {
//        if (bindingresult.hasErrors()) {
//            return "userForm";
//        }
//        // save user to bd
//        return "redirect:/admin/users";
//    }
}
