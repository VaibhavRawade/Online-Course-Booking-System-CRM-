package in.sp.main.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sp.main.dao.CustomerRepository;
import in.sp.main.dao.ProductRepository;
import in.sp.main.entity.CustomerEnq;
import in.sp.main.entity.Employee;
import in.sp.main.entity.Product;

@Service
public class CustomerImpl implements CustomerInterface
{
	@Autowired
	private CustomerRepository dao;
	
	@Autowired
	private ProductRepository productRepo;
	
	public CustomerEnq registerCustomer(CustomerEnq customerEnq)
	{
		CustomerEnq enq;
		try 
		{
			enq=dao.save(customerEnq);
			System.out.println("--->"+enq.getId());
		} 
		catch (Exception e) 
		{
			enq=null;
			e.printStackTrace();
		}
		return enq;
	}
	
	
	public List<CustomerEnq> getAllCustomer()
	{
		List<CustomerEnq> list;
		try
		{
			list=dao.findAll();
		}
		catch (Exception e) 
		{
			list=null;
			e.printStackTrace();
		}
		return list;
	}
	
/*
	public List<Object[]> getPurchasedCourseCountService()
	{
		 List<Object[]> list=dao.countByPurchasedCourse();
	   	return list;
	}
*/

	@Override
	public boolean notPurchesedCustomer()
	{
		boolean b=false;
		try 
		{
			//b=dao.deleteNotPurchesedCustomer();
			dao.deleteNotPurchesedCustomer();
			b=true;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return b;
	}
	
	public Optional<Product> findByNameproduct(String name)
	{
		return productRepo.findByCoursename(name);
	}
	
	 public List<CustomerEnq> getCustomersByProduct(Integer productId) 
	 {
	        return dao.findByProduct(productId);
	   }
	 
	 
	 
	  public List<CustomerEnq> getCustomersByEmployeeId(int empId)
	  {
	        // First, find all products associated with this employee
	        List<Product> products = productRepo.findByEmpId(empId);
	        
	        // Now, find customers associated with those products
	        List<Integer> productIds = products.stream()
	                                           .map(Product::getId)
	                                           .collect(Collectors.toList());
	        
	        // Fetch all customers whose product_id is in the list of productIds
	        return dao.findByProductIn(productIds);
	    }
	  
	  
	  @Override
		public CustomerEnq loginUser(String email)
		{
		  	CustomerEnq customerEnq = dao.findByEmail(email);
			return customerEnq;
		}
	  
	  
	  @Override
		public boolean addCustomerService(CustomerEnq cus) 
		{
			boolean status = false;
			try
			{
				dao.save(cus);
				status = true;
			}
			catch(Exception e)
			{
				status = false;
				e.printStackTrace();
			}
			return status;
		}
}
