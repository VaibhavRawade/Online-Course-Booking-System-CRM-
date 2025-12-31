
package in.sp.main.controllers;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import in.sp.main.entity.CustomerEnq;
import in.sp.main.entity.Employee;
import in.sp.main.entity.Product;
import in.sp.main.service.CustomerInterface;
import in.sp.main.service.Emplnterface;
import in.sp.main.service.ProductInterface;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;


@Controller
public class EmployeeMainController
{
	@Autowired
	private Emplnterface service;
	
	

	@Autowired
	private ProductInterface productService;
	
	
	@Autowired
	private CustomerInterface customerEnqInt;
	
	@GetMapping("/")
	public String indexPage()
	{
		return "home";
	}
	
	@GetMapping("/homepage")
	public String homePage()
	{
		return "home";
	}
	
	@GetMapping("/profileAdmin")
	public String openAdminProfilePage()
	{
		return "admin";
	}
	
	@GetMapping("/loginpage")
	public String loginPage()
	{
		return "login";
	}
	
	@GetMapping("/lockCourses")
	public String LockedCourses(Model model)
	{
		List<Product> list=productService.getAllProductsService();
		model.addAttribute("prdlist", list);
		return "LockedCourses";
	}
	
	
	@GetMapping("/aboutUs")
	public String aboutUsPage()
	{
		return "aboutus";
	}
	
	
	@GetMapping("/contactUs")
	public String contactUsPage()
	{
		return "contactus";
	}
	
	@GetMapping("/userRegistration")
	 public String userRegistration(@ModelAttribute("model-register") CustomerEnq customerEnq) 
	{
		return "user-register";
		
	}
	

    // Handle form submission
    @PostMapping("/registerUser")
    public String registerUser(@Valid @ModelAttribute("model-register") CustomerEnq customerEnq, 
                                   BindingResult br, Model model) 
    {
    	System.out.println(customerEnq.toString()+" "+br.getErrorCount());
    	br.getAllErrors().forEach(error -> System.out.println("Error: " + error.getDefaultMessage()));

        if (br.hasErrors())
        {
        	System.out.println("here");
            return "user-register"; // Return to form if validation fails
        }
        
        boolean isRegistered = customerEnqInt.addCustomerService(customerEnq);
        if (isRegistered) 
        {
            model.addAttribute("successMessage", "User registered successfully!");
            return "user-register-done"; // Redirect to success page
        }
        else 
        {
            model.addAttribute("errorMessage", "Error registering employee!");
            return "user-register"; // Return to form on failure
        }
    }
	
	
	
	@PostMapping("/loginForm")
	public String adminPage(@RequestParam("email1") String email,
			@RequestParam("pass1") String pass,Model model,HttpSession session)
	{
		String page="login";
		if(email.equals("vaibhav123@gmail.com") && pass.equals("vaibhav123@"))
		{
			page="admin";
			session.setAttribute("session_name","vaibhav ");
		}
		else
		{
			Employee emp = service.login(email);
			if(emp != null && emp.getPassword().equals(pass))
			{
				
				page="employee";
				session.setAttribute("session_name",emp.getName());
				session.setAttribute("session_id", emp.getId());  // Assuming emp.getId() is the employee ID
				
			}
			else
			{
				model.addAttribute("error", "Email and Password Did'nt Match");
				page = "login";
			}
		}
		return page;
	}
	

	@GetMapping("/registerpageUser")
	public String registerPageUser(Model model)
	{
	    model.addAttribute("model-register", new CustomerEnq());  // Replace YourM
		return "user-register";
	}
	
	@GetMapping("/loginpageuser")
	public String logincustomer(Model model,HttpSession session)
	{
		session.invalidate();
	    //model.addAttribute("model-register", new CustomerEnq());  // Replace YourM
		return "customerlogin";
	}
	

//	@PostMapping("/loginPageUser")
//	public String userPage(@RequestParam("email1") String email,
//			@RequestParam("pass1") String pass,Model model,HttpSession session)
//	{
//			String page="";
//			System.out.println(email+"----> "+pass);
//			model.addAttribute("model-register", new CustomerEnq());  // Replace YourM
//			CustomerEnq customer = customerEnqInt.loginUser(email);
//			System.out.println(customer);
//			if(customer != null && customer.getPassword().equals(pass))
//			{
//				page="customerEnq-form";
//						
//			}
//			else
//			{
//				model.addAttribute("error", "Email and Password Did'nt Match");
//				page = "customerlogin";
//			}
//			return page;
//	}
	
	@PostMapping("/loginPageUser")
	public String userPage(@RequestParam("email1") String email,
	                       @RequestParam("pass1") String pass,
	                       Model model, HttpSession session)
	{
	    String page = "";
	    System.out.println(email + "----> " + pass);
	    model.addAttribute("model-attribute", new CustomerEnq()); // Ensure matching name with JSP

	    // Assuming loginUser is correctly implemented to fetch the customer by email
	    CustomerEnq customer = customerEnqInt.loginUser(email);
	    System.out.println(customer);

	    if (customer != null && customer.getPassword().equals(pass))
	    {	
	    	session.setAttribute("customerphoneno", customer.getPhone());
	    	session.setAttribute("user", customer);
	        List<String> coursesList=productService.getCourseList();
			model.addAttribute("courses_list",coursesList);
			
			//int random = (int)(Math.random() * 900000) + 100000;
			session.setAttribute("customer_id", customer.getId());

	        page = "customerEnq-form"; // Assuming this is the view for logged-in users
	    } else {
	        // If no match found
	        model.addAttribute("error", "Email and Password didn't match");
	        page = "customerlogin"; // Assuming this is the login page view
	    }

	    return page;
	}

	@GetMapping("/getCoursePrice")
	@ResponseBody  // Ensures that the returned Map is serialized into JSON
	public Map<String, Object> getCoursePrice(@RequestParam("courseName") String courseName) {
	    Map<String, Object> response = new HashMap<>();
	    System.out.println("Fetching price for course: " + courseName);
	    try {
	        // Fetch course details using your service (assuming you have a Product entity)
	        Product product = productService.getProductByName(courseName);
	        System.out.println(courseName + "  " + product.getDiscountedprice());
	        if (product != null) {
	            response.put("price", product.getDiscountedprice());
	        } else {
	            response.put("price", "Not Available");
	        }
	    } catch (Exception e) {
	        response.put("price", "Error Fetching Price");
	    }
	    return response;
	}

	
	
	
	@GetMapping("/listemp")
	public String employeeList(Model model)
	{
		List<Employee> list=service.getAllEmployeesService();
		model.addAttribute("emplist", list);
		return "employees-list";
	}
	
	
	@GetMapping("/addemp")
	public String addEmployees(Model model,Employee employee)
	{
		model.addAttribute("model-register", employee);
		return "empregister-form";
	}
	
	
	@PostMapping("/registerEmployee")
	public String registerEmployee(@Valid @ModelAttribute("model-register") Employee employee,BindingResult br,Model model)
	{
		String page="empregister-form";
		if(!br.hasErrors())
		{
			boolean b=service.addEmployeeService(employee);
			if(b)
			{
				 model.addAttribute("error","Employee Register Sucsesfully");
				 page="empregister-done";			
			}
			else
			{
				page="empregister-form";
			}
		}
		return page;
	}
	
	@PostMapping("/deleteEmp")
	public String deleteEmployee(@RequestParam("id") String id1,Model model)
	{
		int n=Integer.parseInt(id1.toString());
		boolean b=service.deleteId(n);;
			List<Employee> list=service.getAllEmployeesService();
			model.addAttribute("emplist", list);
			model.addAttribute("error","Employee Deleted Sucessfully");
		return "employees-list";
	}
	
	
	@PostMapping("/updateEmp")
	public String updateEmployee(@RequestParam("email") String email,Model model)
	{
		Employee employee1=service.updateEmployeeForm(email);
		model.addAttribute("model_emp", employee1);
		
		service.deleteEmployee(employee1);
		
		model.addAttribute("model-register",new Employee());
		return "empupdate-form";
	}
	

	@PostMapping("/updateEmployeeForm")
	public String updateEmployeeData(@Valid @ModelAttribute("model-register") Employee employee,BindingResult br,Model model)
	{
		String page="empupdate-form";
		if(!br.hasErrors()) 
		{
			boolean b=service.updateEmployeeData(employee);
			if(b)
			{
				 model.addAttribute("error","Employee Updated Sucsesfully");
				 page="empregister-done";			
			}
			else
			{
				page="empregister-form";
			}
		}
		return page;
	}
	
	
	@GetMapping("/saleCourse")
	public String openEmpHome(Model model)
	{
		List<Object[]> list = service.getPurchasedCourseCountService();
		model.addAttribute("intrested_course", list);
		
		return "salecourse";
	}
	
	@GetMapping("/onlineCourses")
	public String openVideoLinks(Model model)
	{
		List<Product> list=productService.getAllProductsService();
		model.addAttribute("prdlist", list);
		
		for(Product p:list)
			{
				System.out.println(p.getCoursename());
			}
		return "ViewOnlineCourses";
	}
	
	
}
