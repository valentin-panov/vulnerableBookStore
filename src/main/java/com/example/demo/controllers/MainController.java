package com.example.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.NativeWebRequest;

@Controller
public class MainController {

    @GetMapping("/")
    public String homePage(NativeWebRequest wR, Model model) {
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
        model.addAttribute("error", null);
        return "about";
    }

    @GetMapping("/perform_login")
    public String signInPage(@RequestParam(value = "error", required = false) String error, Model model) {
        if (error != null) {
            model.addAttribute("error", "Invalid credentials");
        }
        model.addAttribute("title", "LOGGING IN");
        return "login";
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


}