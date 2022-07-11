package com.example.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String homePage(Model model) {
        model.addAttribute("title", "Main page");
        return "index";
    }

    @GetMapping("/news")
    public String newsPage(Model model) {
        model.addAttribute("title", "Latest developments");
        return "news";
    }

    @GetMapping("/about")
    public String aboutPage(Model model) {
        model.addAttribute("title", "About us");
        return "about";
    }

    @GetMapping("/signin")
    public String signInPage(Model model) {
        model.addAttribute("title", "Sign in");
        return "signin";
    }

    @GetMapping("/admin")
    public String adminPage(Model model) {
        model.addAttribute("title", "Administration page");
        return "admin/index";
    }

    @GetMapping("/account")
    public String userPage(Model model) {
        model.addAttribute("title", "Account page");
        return "account/user";
    }

//    @PostMapping("/login")
//    public String login() {
//        System.out.println("ATTEMPT");
//        if (false) {
////            model.addAttribute("user", user);
//            return "signin";
//        }
//        System.out.println("SUCCESS");
//        // save user to bd
//
//        return "index";
//    }
//
//    @GetMapping("/error")
//    public String error() {
//        return "error404";
//    }

}