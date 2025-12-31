package in.sp.main.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import in.sp.main.entity.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product,Integer>
{
	@Query("SELECT coursename FROM Product")
	public List<String> getAllCourse();
	
	   @Query("SELECT p FROM Product p WHERE LOWER(p.coursename) = LOWER(:coursename)")
	    public Optional<Product> findByCoursename(@Param("coursename") String coursename);
	   
	    List<Product> findByEmpId(int empId); // Find products based on employee ID

	    @Query("SELECT p FROM Product p WHERE LOWER(p.coursename) = LOWER(:coursename)")
	    Product getCourseDetailsByName(@Param("coursename") String coursename);
}
