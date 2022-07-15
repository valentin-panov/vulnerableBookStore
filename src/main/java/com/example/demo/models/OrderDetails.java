package com.example.demo.models;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "order_details")
public class OrderDetails {
    @Id
    @SequenceGenerator(name = "order_details_id_seq", sequenceName = "order_details_id_seq", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "order_details_id_seq")
    @Column(name = "id", updatable = false)
    private Long id;
    @Column(name = "price")
    private BigDecimal price;
    @Column(name = "quantity")
    private int quantity;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", nullable = false)
    private Order order;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", nullable = false)
    private Book product;

    public OrderDetails(BigDecimal price, int quantity, Order order, Book product) {
        this.price = price;
        this.quantity = quantity;
        this.order = order;
        this.product = product;
    }

    public OrderDetails() {

    }

    public Long getId() {
        return id;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Book getProduct() {
        return product;
    }

    public void setProduct(Book product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "OrderDetail [id=" + id + ", OrderID=" + product + ", quantity=" + quantity + ", price=" + price + "]";
    }
}
