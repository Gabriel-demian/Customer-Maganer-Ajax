package com.customer.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	public ContenedorLista getAllCustomers() {

		List<Customer> theCustomers = customerService.getCustomers();

		ContenedorLista clist = new ContenedorLista();

		clist.setLista(theCustomers);

		return clist;
	}

	@RequestMapping("/fake")
	public Customer fakerCustomer() throws InterruptedException {
		Faker faker = new Faker();
		Customer theCustomer = new Customer();

		theCustomer.setFirstName(faker.name().firstName());
		theCustomer.setLastName(faker.name().lastName());
		theCustomer.setEmail(theCustomer.getFirstName() + "." + theCustomer.getLastName() + "@gmail.com");
		//Thread.sleep(1500);
		return theCustomer;
	}

	@GetMapping("/showFormForUpdate")
	public Customer showFormForUpdate(@ModelAttribute("customerId") int theId, Model theModel) {

		Customer theCustomer = customerService.getCustomer(theId);

		theModel.addAttribute("customer", theCustomer);

		return theCustomer;
	}

	@DeleteMapping("/customer/delete/{id}")
	public ResponseEntity<Void> deleteCustomer(@PathVariable int id) {

		customerService.deleteCustomer(id);

		return ResponseEntity.noContent().build();
	}

	@PostMapping("/customer")
	public ResponseEntity<Customer> saveCustomer(@RequestBody Customer customer) {

		customer.setId(null);

		customerService.saveCustomer(customer);

		return ResponseEntity.ok(customer);
	}

	@PutMapping("/customer")
	public ResponseEntity<Customer> updateCustomer(@RequestBody Customer customer) {

		customerService.saveCustomer(customer);

		return ResponseEntity.ok(customer);
	}

}

class ContenedorLista {
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
