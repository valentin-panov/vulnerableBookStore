package com.example.demo.models;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name = "users")
public class User {
    @Id
    @SequenceGenerator(name = "users_id_seq", sequenceName = "users_id_seq", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "users_id_seq")
    @Column(name = "id", updatable = false)
    private Long id;
    @NotEmpty(message = "user name cannot be empty")
    @Size(min = 2, max = 30, message = "user name length must be within 2-30 chars")
    @Column(name = "user_name")
    private String userName;
    @NotEmpty(message = "password cannot be empty")
    @Size(min = 2, max = 16, message = "password length must be within 2-16 chars")
    @Column(name = "password")
    private String password;
    @Column(name = "is_active")
    private boolean isActive;
    @Column(name = "roles")
    private String roles;
    @Email(message = "email should be valid")
    @Column(name = "email")
    private String email;
    @Column(name = "first_name")
    private String firstName;
    @Column(name = "last_name")
    private String lastName;
    @Column(name = "address")
    private String address;

    public User() {

    }

    public User(String userName, String password, String roles, String email, String firstName, String lastName, String address) {
        this.userName = userName;
        this.password = password;
        this.roles = roles;
        this.isActive = false;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;

    }

    public Long getId() {
        return id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    @Override
    public String toString() {
        return "User [id=" + id + ", name=" + userName + ", isActive=" + isActive + "]";
    }
}