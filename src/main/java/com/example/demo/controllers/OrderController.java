package com.example.demo.controllers;

import com.example.demo.models.*;
import com.example.demo.repo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/account/cart/")
public class OrderController {

    @Autowired
    OrderRepository orderRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    OrderDetailsRepository orderDetailsRepository;
    @Autowired
    BookRepository bookRepository;
    @Autowired
    PaymentRequestRepository paymentRequestRepository;

    @GetMapping()
    public String untiedCart() {
        return "error404";
    }

    @GetMapping("{name}")
    public String getCartById(@PathVariable("name") String name, String err, String success, Model model) {
        Optional<User> user = userRepository.findByUserName(name);
        if (!user.isPresent()) {
            return "error404";
        }
        Optional<Order> order = orderRepository.findCustomNewByCustomerId(user.get().getId());
        model.addAttribute("errors", err);
        model.addAttribute("success", success);
        if (order.isPresent()) {
            List<OrderDetails> details = orderDetailsRepository.findCustomByOrderId(order.get().getId());
            model.addAttribute("title", "Cart of " + name + " view");
            model.addAttribute("order", order.get());
            model.addAttribute("details", details);
        } else {
            model.addAttribute("title", "Cart of " + name + " view");
        }
        return "account/cart";
    }


    @PostMapping(value = "add/", consumes = "application/x-www-form-urlencoded")
    public String createUser(Long bookId, String userName, Model model) {
        try {
            Optional<Book> book = bookRepository.findById(bookId);
            Optional<User> user = userRepository.findByUserName(userName);
            Optional<Order> order = orderRepository.findCustomNewByCustomerId(user.get().getId());
            if (!order.isPresent()) {
                Order newOrder = new Order("NEW", new Date(), user.get());
                orderRepository.save(newOrder);
                orderDetailsRepository.save(new OrderDetails(book.get().getPrice(), 1, newOrder, book.get()));
            } else {
                orderDetailsRepository.save(new OrderDetails(book.get().getPrice(), 1, order.get(), book.get()));

            }
        } catch (Exception e) {
            Iterable<Book> books = bookRepository.findAll();
            model.addAttribute("errors", e);
            model.addAttribute("books", books);
            return "catalog/catalog";
        }
        return "redirect:/account/cart/" + userName;
    }

    @PatchMapping(value = "patch/", consumes = "application/x-www-form-urlencoded")
    public String updateCart(Long id, String userName, Integer quantity) {
        Optional<OrderDetails> db_order_details_optional = orderDetailsRepository.findById(id);
        if (db_order_details_optional.isPresent()) {
            OrderDetails db_order_details = db_order_details_optional.get();
            if (quantity < 1) {
                orderDetailsRepository.deleteById(id);
            } else {
                db_order_details.setQuantity(quantity);
                orderDetailsRepository.save(db_order_details);
            }
            return "redirect:/account/cart/" + userName;
        } else {
            return "error404";
        }
    }

    @PostMapping(value = "pay/", consumes = "application/x-www-form-urlencoded")
    public String payOrder(BigDecimal total, String cardHolder, String cardNumber, String cardCVV, String cardExpiry, Long id, String userName) {
        try {
            Optional<Order> order = orderRepository.findById(id);
            if (order.isPresent()) {
                paymentRequestRepository.save(new PaymentRequest(total, cardHolder, cardNumber, cardCVV, cardExpiry, order.get()));
                Order _order = order.get();
                User _user = _order.getCustomer();
                _order.setState("PLACED");
                orderRepository.save(_order);
                orderRepository.save(new Order("NEW", new Date(), _user));
            } else {
                return "error404";

            }
        } catch (Exception e) {
            return "redirect:/account/cart/" + userName + "?err=" + e.getMessage().substring(0, e.getMessage().indexOf(";"));
        }
        return "redirect:/account/cart/" + userName + "?success=true";
    }

}
