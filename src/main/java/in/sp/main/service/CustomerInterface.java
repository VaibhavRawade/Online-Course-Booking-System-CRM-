package in.sp.main.service;

import java.util.List;
import java.util.Optional;

import in.sp.main.entity.CustomerEnq;
import in.sp.main.entity.Product;

public interface CustomerInterface 
{
	public CustomerEnq registerCustomer(CustomerEnq customerEnq);
	
	public List<CustomerEnq> getAllCustomer();
	
//	public List<Object[]> getPurchasedCourseCountService();
	
	
	public boolean notPurchesedCustomer();
	
	public Optional<Product> findByNameproduct(String name);
	
	 public List<CustomerEnq> getCustomersByProduct(Integer productId);
	 
	  public List<CustomerEnq> getCustomersByEmployeeId(int empId);

		public CustomerEnq loginUser(String email);
		
		public boolean addCustomerService(CustomerEnq cus) ;


}
