package com.example.demo.models;

import javax.persistence.*;

@Entity
@Table(name = "books")
public class Book {
    @Id
    @SequenceGenerator(name = "book_sequence", sequenceName = "book_sequence", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "book_sequence")
    private Long id;
    @Column(name = "isbn")
    private Long isbn;
    @Column(name = "title")
    private String title;
    @Column(name = "author")
    private String author;
    @Column(name = "summary")
    private String summary;
    @Column(name = "cover")
    private String cover;
    @Column(name = "currency")
    private String currency;
    @Column(name = "price")
    private float price;

    public Book() {
    }

    public Book(Long isbn, String title, String author, String summary, String cover, String currency, int price) {
        this.isbn = isbn;
        this.title = title;
        this.author = author;
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
