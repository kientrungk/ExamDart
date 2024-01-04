package com.example.examapi.Controller;

import com.example.examapi.CustomerRespository.CustomerRepository;
import com.example.examapi.Entities.CustomerEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/Customers")
public class CustomerController {
    private final CustomerRepository _costomer;
    public CustomerController(CustomerRepository customer){
        _costomer = customer;
    }

    @GetMapping
    public List<CustomerEntity> getAllCustomers() {
        return _costomer.findAll();
    }
    @PostMapping
    public CustomerEntity addCustomer(@RequestBody CustomerEntity customer) {
        return _costomer.save(customer);
    }
}
