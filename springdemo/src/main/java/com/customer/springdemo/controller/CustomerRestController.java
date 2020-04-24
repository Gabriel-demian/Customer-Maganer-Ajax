package com.customer.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.customer.springdemo.entity.Customer;
import com.customer.springdemo.service.CustomerService;
import com.github.javafaker.Faker;




@RestController
public class CustomerRestController {
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("/list")
	public ContenedorLista getAllCustomers(){
		
		List<Customer> theCustomers = customerService.getCustomers();
		
		ContenedorLista clist = new ContenedorLista();
		
		clist.setLista(theCustomers);
		
		
		return clist;
	}
	
	@RequestMapping("/fake")
	public Customer fakerCustomer(){
		Faker faker = new Faker();
		Customer theCustomer = new Customer();
		
		theCustomer.setFirstName(faker.name().firstName());
		theCustomer.setLastName(faker.name().lastName());
		theCustomer.setEmail(theCustomer.getFirstName() +"."+ theCustomer.getLastName()+"@gmail.com");
		
		return theCustomer;
	}
	
}

class ContenedorLista{
	private List<Customer> lista;

	public ContenedorLista(List<Customer> lista) {
		this.lista = lista;
	}
	public ContenedorLista() {
	}
	
	public List<Customer> getLista() {
		return lista;
	}

	public void setLista(List<Customer> lista) {
		this.lista = lista;
	}
	
	
	
}










