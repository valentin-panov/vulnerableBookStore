package com.example.demo.models;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name = "books")
public class Book {
    @Id
    @SequenceGenerator(name = "books_id_seq", sequenceName = "books_id_seq", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "books_id_seq")
    @Column(name = "id", updatable = false)
    private Long id;
    @NotEmpty(message = "isbn cannot be empty")
    @Min(value = 0L, message = "The value must be positive")
    @Size(min = 10, max = 13, message = "isbn length must be within 10-13 chars")
    @Column(name = "isbn")
    private Long isbn;
    @NotEmpty(message = "title cannot be empty")
    @Column(name = "title")
    private String title;
    @NotEmpty(message = "author cannot be empty")
    @Column(name = "author")
    private String author;
    @NotEmpty(message = "summary cannot be empty")
    @Column(name = "summary")
    private String summary;
    @NotEmpty(message = "cover cannot be empty")
    @Column(name = "cover")
    private String cover;
    @NotEmpty(message = "currency cannot be empty")
    @Column(name = "currency")
    private String currency;
    @NotEmpty(message = "price cannot be empty")
    @Min(value = 0L, message = "The value must be positive")
    @Column(name = "price")
    private float price;

    public Book() {
    }

    public Book(Long isbn, String title, String author, String summary, String cover, String currency, int price) {
        this.isbn = isbn;
        this.author = author;
        this.title = title;
        this.summary = summary;
        this.cover = cover;
        this.currency = currency;
        this.price = price;
    }


    public Long getId() {
        return id;
    }

    public Long getIsbn() {
        return isbn;
    }

    public void setIsbn(Long isbn) {
        this.isbn = isbn;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Book [id=" + id + ", title=" + title + ", author=" + author + ", summary=" + summary + ", price=" + price + "]";
    }
}
