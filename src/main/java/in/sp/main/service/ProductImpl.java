package in.sp.main.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sp.main.dao.ProductRepository;
import in.sp.main.entity.Employee;
import in.sp.main.entity.Product;

@Service
public class ProductImpl implements ProductInterface
{
	@Autowired
	private ProductRepository dao;
	
	public Product getProductByName(String courseName) 
	{
	    return dao.getCourseDetailsByName(courseName);
	}
	
	public boolean addProduct(Product product)
	{
		boolean b=false;
		try 
		{
			dao.save(product);
			b=true;
		} 
		catch (Exception e)
		{
			b=false;
			e.printStackTrace();
		}
		return b;
	}
	
	public List<Product> getAllProductsService()
	{
		List<Product> list=dao.findAll();
		return list;
	}
	
	public Product getSingleProductDetails(int id)
	{
		Optional<Product> product=dao.findById(id);
		Product prd=product.get();
		return prd;
	}
	
	public Product updateProductForm(int id)
	{
		Optional<Product> product=dao.findById(id);
		Product prd=product.get();
		return prd;
	}
	
	
	public void deleteProduct(Product product)
	{
		dao.delete(product);
	}
	
	public boolean updateProductData(Product product)
	{
		boolean b=false;
		try
		{
			dao.save(product);
			b=true;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return b;
	}
	
	public Product deleteProductForm(int id)
	{
		Optional<Product> product=dao.findById(id);
		Product prd=product.get();
		return prd;
	}
	
	
	public List<String> getCourseList()
	{
		List<String> list=null;
		try 
		{
			list=dao.getAllCourse();
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Employee> getAllEmployeesService()
	{
		return null;
	}
}
