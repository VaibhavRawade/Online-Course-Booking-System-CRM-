package in.sp.main.controllers;

import in.sp.main.dao.CustomerRepository;
import in.sp.main.entity.*;
import in.sp.main.service.Emplnterface;
import in.sp.main.service.ProductInterface;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController
{
	@Autowired
	private ProductInterface service;
	
	@Autowired
	private CustomerRepository customerRepo;
	
	
	@Autowired
	private Emplnterface serviceEmployee;
	
	@GetMapping("/addprd")
	public String addProduct(Model model)
	{
		model.addAttribute("model-register",new Product());
		
		List<Employee> list=serviceEmployee.getAllEmployeesService();
		model.addAttribute("emplist", list);
		
		return "prdregister-form";
	}
	
	@PostMapping("/registerProduct")
	public String registerProduct(@Valid @ModelAttribute("model-register") Product product,BindingResult br,Model model)
	{
		String page="prdregister-form";
		if(!br.hasErrors())
		{
            Optional<Employee> trainer = serviceEmployee.findByEmpId(Integer.parseInt(product.getTrainersname()));
            boolean b=false;
            if(trainer.isPresent())
            {
            	String employee=trainer.get().getName();
            	product.setTrainersname(employee);
            	product.setEmpId(trainer.get().getId());
            	b=service.addProduct(product);
            }
			if(b)
			{
				 model.addAttribute("error","Product Added Sucsesfully");
				 page="prdregister-done";			
			}
			else
			{
				page="prdregister-form";
			}
		}
		return page;
	}
	
	@GetMapping("/listprd")
	public String getAllProducts(Model model)
	{
		List<Product> list=service.getAllProductsService();
		model.addAttribute("prdlist", list);
		return "products-list";
	}
	
	
	@PostMapping("/prdDetails")
	public String deleteEmployee1(@RequestParam("id") String id1,Model model)
	{
		int n=Integer.parseInt(id1.toString());
		Product product1=service.getSingleProductDetails(n);
		model.addAttribute("product",product1);
		
		return "product-data";
	}
	
	@GetMapping("/prdDetailsEmployee")
	public String deleteEmployee2(Model model, @RequestParam(value = "id", required = false, defaultValue = "52") String id1)
	{
		
		//int n=Integer.parseInt(id1.toString());
		int n=52;
		Product product1=service.getSingleProductDetails(n);
		model.addAttribute("product",product1);		
		
		return "product-data-employee";
	}
	
//	@GetMapping("/prdDetailsCustomer")
//	public String deleteEmployee3(Model model, @RequestParam(value = "id", required = false, defaultValue = "52") String id1,HttpSession session)
//	{
//		
//		//int n=Integer.parseInt(id1.toString());
//		int id = (int) session.getAttribute("primaryid");
//		if(id!=0)
//		{
//			System.out.println("Getting Session Id-->"+id);
//			int n=1	;
//			Product product1=service.getSingleProductDetails(n);
//			model.addAttribute("product",product1);		
//			return "product-data-customer";
//		}
//		else
//		{
//			return "NoContent";
//		}
//	}
	
	
	@GetMapping("/prdDetailsCustomer")
	public String deleteEmployee3(Model model, HttpSession session) 
	{

	    //Object primaryIdObj = session.getAttribute("primaryid");
		int custommerid = (int) session.getAttribute("customer_id");
		Integer customerObject=new Integer(custommerid);
	    if (customerObject != null) 
	    {
	    	System.out.println("here 2");
	      //  int id = (int) primaryIdObj;
	        //System.out.println("Getting Session Id --> " + id);
	        //Optional<CustomerEnq> customereEnq=customerRepo.findById(id);
	        
	        //Optional<CustomerEnq> customereEnq=customerRepo.findFirstByCid(custommerid);
	    	
	      //  if(customereEnq.isPresent())
//	        {
//	        	int productId=customereEnq.get().getProduct();
//		        Product product1 = service.getSingleProductDetails(productId);
//		        model.addAttribute("product", product1);
//		        model.addAttribute("course",product1.getCoursename().toLowerCase());
//		        return "product-data-customer";
//	        }
	    	
	    	List<CustomerEnq> enquiries = customerRepo.findByCid(customerObject);
	    	if (!enquiries.isEmpty()) 
	    	{
    	        System.out.println("here 3");
	    	    List<Product> products = new ArrayList<>();

	    	    for (CustomerEnq enq : enquiries)
	    	    {
	    	        System.out.println("here 4");

	    	        int productId = enq.getProduct();
	    	        System.out.println("Product id->"+productId);
	    	        Product product = service.getSingleProductDetails(productId);
	    	        if (product != null)
	    	        {
	    	            products.add(product);
	    	        }
	    	    }
	    	    model.addAttribute("products", products);
	    	    return "product-data-customer"; 
	    	} 
	        System.out.println("here 5");

	        return "NoContent";
	    } 
	    else 
	    {
	    	System.out.println("here 5");
	        return "NoContent";
	    }
	}

	
	
	
	@PostMapping("/updatePrd")
	public String updateProduct(@RequestParam("id") String id1,Model model)
	{
		int n=Integer.parseInt(id1.toString());
		Product product1=service.updateProductForm(n);
		model.addAttribute("model_prd",product1);
		
		service.deleteProduct(product1);
		
		model.addAttribute("model-register",new Product());
		return "prdupdate-form";
	}
	

	@PostMapping("/updateProductForm")
	public String updateProductData(@Valid @ModelAttribute("model-register") Product product,BindingResult br,Model model)
	{
		String page="prdupdate-form";
		if(!br.hasErrors()) 
		{
			boolean b=service.updateProductData(product);
			if(b)
			{
				 model.addAttribute("error","Product Updated Sucsesfully");
				 page="prdregister-done";			
			}
			else
			{
				page="prdregister-form";
			}
		}
		return page;
	}
	
	@PostMapping("/deletePrd")
	public String deleteProduct(@RequestParam("id") String id1,Model model)
	{
		int n=Integer.parseInt(id1.toString());
		Product product1=service.deleteProductForm(n);
		
		service.deleteProduct(product1);
		
		List<Product> list=service.getAllProductsService();
		model.addAttribute("prdlist", list);
		model.addAttribute("error","Product Deleted Sucessfully");
		return "products-list";
	}
		
}
