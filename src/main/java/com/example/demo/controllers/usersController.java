package com.example.demo.controllers;

import com.example.demo.models.User;
import com.example.demo.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Optional;

@Controller
@RequestMapping("/admin/users")
public class usersController {

    @Autowired
    UserRepository userRepository;

    @GetMapping()
    public String usersList(Model model) {
        Iterable<User> users = userRepository.findAll();
        model.addAttribute("title", "User list");
        model.addAttribute("users", users);
        return "admin/userList";
    }

    @GetMapping("/{id}")
    public String getUserById(@PathVariable("id") long id, Model model) {
        Optional<User> user = userRepository.findById(id);
        if (user.isPresent()) {
            model.addAttribute("title", "User ID#" + user.get().getId() + " view");
            model.addAttribute("user", user.get());
            return "admin/userView";
        } else {
            return "error404";
        }
    }

    @GetMapping("/new")
    public String createUserForm(Model model) {
        model.addAttribute("title", "New user registration");
        model.addAttribute("method", "post");
        return "userForm";
    }

    @PostMapping(consumes = "application/x-www-form-urlencoded")
    public String createUser(@ModelAttribute("user") @Valid User user, BindingResult bindingresult, Model model) {
        if (bindingresult.hasErrors()) {
            model.addAttribute("user", user);
            return "userForm";
        }
        try {
            User _user = userRepository.save(new User(user.getUserName(), user.getPassword(), user.getRoles(), user.getEmail(), user.getFirstName(), user.getLastName(), user.getAddress()));
            model.addAttribute("added", _user);
        } catch (Exception e) {
            model.addAttribute("errors", e);
            model.addAttribute("user", user);
            return "userForm";
        }
        return "redirect:/admin/users/";
    }

    @GetMapping("/{id}/edit")
    public String editUserById(@PathVariable("id") long id, Model model) {
        Optional<User> user = userRepository.findById(id);
        if (user.isPresent()) {
            model.addAttribute("title", "User CRUD service");
            model.addAttribute("method", "patch");
            model.addAttribute("user", user.get());
            return "admin/userCRUD";
        } else {
            return "error404";
        }
    }

//    @PatchMapping("/{id}")
//    public String updateUser(@ModelAttribute("user") @Valid User user, BindingResult bindingresult) {
//        if (bindingresult.hasErrors()) {
//            return "userForm";
//        }
//        // save user to bd
//        return "redirect:/admin/users";
//    }

    @DeleteMapping("/{id}")
    public String deleteUser(@PathVariable("id") long id) {
        try {
            userRepository.deleteById(id);
            return "redirect:/admin/users/";
        } catch (Exception e) {
            return "/error404";
        }
    }


}
