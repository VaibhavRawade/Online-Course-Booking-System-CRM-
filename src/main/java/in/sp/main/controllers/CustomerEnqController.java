package in.sp.main.controllers;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import in.sp.main.dao.CustomerRepository;
import in.sp.main.entity.CustomerEnq;
import in.sp.main.entity.Product;
import in.sp.main.service.CustomerInterface;
import in.sp.main.service.ProductInterface;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;


@Controller
public class CustomerEnqController 
{
	@Autowired
	private CustomerInterface service;
	
	@Autowired
	private CustomerRepository repo;
	
	@Autowired
	private ProductInterface pservice;
	
	@GetMapping("/enquiryForm")
	public String customerEnquiryForm(Model model,HttpSession session)
	{
		List<String> coursesList=pservice.getCourseList();
		model.addAttribute("courses_list",coursesList);
		
		model.addAttribute("model-attribute",new CustomerEnq());
		return "customerEnq-form";
	}
	
	@PostMapping("/registerCustomer")
	public String registerCustomer(@Valid @ModelAttribute("model-attribute") CustomerEnq customerEnq,
								   BindingResult br,Model model,HttpSession session)
	{
		String page="";
		System.out.println(br.getFieldErrorCount());
		 if (br.hasErrors()) 
		 {
		        // Iterate over each error in BindingResult
		        br.getAllErrors().forEach(error -> {
		            System.out.println("Error: " + error.getDefaultMessage());
		            // You can also print the field name if needed
		            System.out.println("Field: " + ((FieldError) error).getField());
		        });
		        model.addAttribute("error", "Sorry, something went wrong. Please try again.");
		        return page="customerEnq-form";

		 }
		if(!br.hasErrors())
		{
			Optional<Product> product=service.findByNameproduct(customerEnq.getIntrestedcourse());
			boolean b=false;
			int primaryid=0;
			if(product.isPresent())
			{
				 int id=product.get().getId();
				 String phoneNo = (String) session.getAttribute("customerphoneno");
				 customerEnq.setProduct(new Integer(id));
				 
				 Random randomnum = new Random();
				 int randomDigit = randomnum.nextInt(10); // 0 to 9
				 String modifiedPhoneNo = phoneNo.substring(0, 9) + randomDigit;
				 customerEnq.setPhone(modifiedPhoneNo);
				 
		
				 int cid = (int) session.getAttribute("customer_id");
				 System.out.println("customer id-->"+cid);
				 Integer integerValue=new Integer(cid);
				 customerEnq.setCid(integerValue);
				 
				 if(customerEnq.getStatus().equals("8"))
				 {
					 	 System.out.println("Intrested Person->"+customerEnq.getStatus());
						 
						 CustomerEnq enqObject=service.registerCustomer(customerEnq);
						 
						
						 if(enqObject!=null)
						 {
							 primaryid=enqObject.getId();
							 b=true;
						 }
				 }	 
			}
			if(b)
			{
				session.setAttribute("primaryid", primaryid);
				page="customerEnq-form";
				model.addAttribute("error","Course Purchesed Sucsessfully");
			}
			else
			{
				page="customerEnq-form";
				model.addAttribute("error","Thank you for your interest! Our team will reach out shortly with course details and enrollment steps.");
			}
		}
		return page;
	}
	
	@GetMapping("/customerfollowUp")
	public String customerFollowupPage(Model model)
	{
		List<CustomerEnq> list=service.getAllCustomer();
		model.addAttribute("listCustomer", list);
		return "customerfollowup";
	}
	

	@GetMapping("/employeefollowUp")
	public String employeeFollowupPage(Model model,HttpSession session)
	{
		//List<CustomerEnq> list=service.getAllCustomer();
		
		Integer sessionId = (Integer) session.getAttribute("session_id"); // Retrieve the ID
	    String sessionName = (String) session.getAttribute("session_name");
	    
	    System.out.println(sessionId+" --------");
	    List<CustomerEnq> list = service.getCustomersByEmployeeId(sessionId);
	    
	    
		model.addAttribute("listCustomer", list);
		return "employee-followup";
	}
	
			
//	@GetMapping("/saleCourse")
//	public String openEmpHome(Model model)
//	{
//		List<Object[]> list = service.getPurchasedCourseCountService();
//		model.addAttribute("intrested_course", list);
//		
//		return "salecourse";
//	}
	

	@GetMapping("/purchasedCustomer")
	public String coursePurchasedPage(Model model)
	{
		String pageString="";
		
		boolean b=service.notPurchesedCustomer();
		if(b)
		{
			List<CustomerEnq> list=service.getAllCustomer();
			model.addAttribute("listCustomer", list);
			
			return pageString="customer_page";
		}
		return pageString;
		
	}		
	
}
