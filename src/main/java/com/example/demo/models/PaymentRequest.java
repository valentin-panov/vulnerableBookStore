package com.example.demo.models;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@Table(name = "payment_request")
public class PaymentRequest implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "payment_request_id_seq")
    @SequenceGenerator(name = "payment_request_id_seq", sequenceName = "payment_request_id_seq", allocationSize = 1)
    @Column(name = "id", updatable = false)
    private Long id;
    @Column(name = "total")
    private BigDecimal total;
    @Column(name = "card_holder")
    private String cardHolder;
    @Column(name = "card_number")
    private String cardNumber;
    @Column(name = "card_cvv")
    private String cardCVV;
    @Column(name = "card_expiry")
    private String cardExpiry;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", nullable = false)
    private Order order;

    public PaymentRequest(BigDecimal total, String cardHolder, String cardNumber, String cardCVV, String cardExpiry, Order order) {
        this.total = total;
        this.cardHolder = cardHolder;
        this.cardNumber = cardNumber;
        this.cardCVV = cardCVV;
        this.cardExpiry = cardExpiry;
        this.order = order;
    }

    public PaymentRequest() {

    }


    public Long getId() {
        return id;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public String getCardHolder() {
        return cardHolder;
    }

    public void setCardHolder(String cardHolder) {
        this.cardHolder = cardHolder;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCardCVV() {
        return cardCVV;
    }

    public void setCardCVV(String cardCVV) {
        this.cardCVV = cardCVV;
    }

    public String getCardExpiry() {
        return cardExpiry;
    }

    public void setCardExpiry(String cardExpiry) {
        this.cardExpiry = cardExpiry;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    @Override
    public String toString() {
        return "PaymentRequest [id=" + id + ", OrderID=" + getOrder().getId() + ", total=" + total + ", card number=" + cardNumber + "]";
    }
}
