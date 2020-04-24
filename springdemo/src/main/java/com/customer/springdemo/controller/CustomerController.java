package com.customer.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.customer.springdemo.entity.Customer;
import com.customer.springdemo.service.CustomerService;
import com.github.javafaker.Faker;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	/*Queda comentado ya que agregamos el CustomerService que se encarga del DAO
	*inyectar customer dao
	*con @Autowired spring escanea buscando las implementaciones de la interfaz CustomerDAO 
	*@Autowired
	*private CustomerDAO customerDAO;
	*/
	
	// inyectar CustomerService
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("/list")
	public String listCustomers(Model theModel) {
		
		// obtener clientes del servicio 
		List<Customer> theCustomers = customerService.getCustomers();
		
		// agregar clientes al Model 
		theModel.addAttribute("customers", theCustomers);
		
		return "list-customers";
	}
	
	
	
	@GetMapping("/showFormAdd")
	public String showFormAdd(Model theModel) {
		
		// crear atributo Model para enlazar datos 
		Customer theCustomer = new Customer();
		
		theModel.addAttribute("customer", theCustomer);
		
		return "customer-form";
	}
	
	@PostMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("customer") Customer theCustomer){
		
		// guardar el cliente usando el servicio
		customerService.saveCustomer(theCustomer);
		
		return "RegistrationSuccess";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@ModelAttribute("customerId") int theId, 
									Model theModel) {
		
		// obtener el cliente del service
		Customer theCustomer = customerService.getCustomer(theId);
		
		// setear el cliente como un atributo Model para pre preparar el form
		theModel.addAttribute("customer", theCustomer);
		
		// enviar al form
		return "edit-customer-form";
	}
	
	@GetMapping("/delete")
	public String deleteCustomer(@RequestParam("customerId") int theId) {
		
		// borrar el cliente
		customerService.deleteCustomer(theId);
		
		return "redirect:/customer/list";
	}
	
	
	 @GetMapping("/search")
    public String searchCustomers(@RequestParam("theSearchName") String theSearchName,
                                    Model theModel) {

        // search customers from the service
        List<Customer> theCustomers = customerService.searchCustomers(theSearchName);
                
        // add the customers to the model
        theModel.addAttribute("customers", theCustomers);

        return "list-customers";        
   	}
	
	//Faker
	@GetMapping("/showFormFaker")
	public String fakerCustomer(){
		Faker faker = new Faker();
		Customer theCustomer = new Customer();
		
		theCustomer.setFirstName(faker.name().firstName());
		theCustomer.setLastName(faker.name().lastName());
		theCustomer.setEmail(theCustomer.getFirstName() +"."+ theCustomer.getLastName()+"@gmail.com");
		
		// guardar el cliente usando el servicio
		customerService.saveCustomer(theCustomer);
		
		return "redirect:/customer/list";
	}
	
}
