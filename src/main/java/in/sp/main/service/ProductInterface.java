package in.sp.main.service;

import java.util.List;

import in.sp.main.entity.Employee;
import in.sp.main.entity.Product;

public interface ProductInterface 
{
	public boolean addProduct(Product product);
	public List<Product> getAllProductsService();
	
	public Product getSingleProductDetails(int id);
	public Product updateProductForm(int id);
	
	public void deleteProduct(Product product);
	public boolean updateProductData(Product product);
	public Product deleteProductForm(int id);
	
	public List<String> getCourseList();
	public Product getProductByName(String courseName);
	public List<Employee> getAllEmployeesService();
}
