package com.example.demo.controllers;

import com.example.demo.models.Post;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

@Controller
public class ExternalData {
    @GetMapping("/external")
    public String getExternalPosts(
            @RequestParam(value = "url", required = true) String url,
            @RequestParam(value = "component", required = true) String component, Model model) {
        try {
            RestTemplate restTemplate = new RestTemplate();
            // A10:2021-SSRF
            // Validate all incoming user data

//            Example of usage:
//            https://commons.apache.org/proper/commons-validator/apidocs/org/apache/commons/validator/routines/UrlValidator.html
            
            Post[] result = restTemplate.getForObject(url, Post[].class);
            if (result == null) {
                model.addAttribute("data", null);
                return component;
            }
            model.addAttribute("data", result);
            return component;
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return component;
        }

    }
}
