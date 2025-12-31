package in.sp.main.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import in.sp.main.entity.CustomerEnq;
import jakarta.transaction.Transactional;

@Repository
public interface CustomerRepository extends JpaRepository<CustomerEnq,Integer>
{
	@Query("SELECT intrestedcourse, COUNT(status) FROM  CustomerEnq GROUP BY intrestedcourse")
	public List<Object[]> countByPurchasedCourse();
//	
//	@Query("DELETE FROM CustomerEnq WHERE status='1' ")
//	public boolean deleteNotPurchesedCustomer();
	
	   @Modifying
	    @Transactional
	    @Query("DELETE FROM CustomerEnq WHERE status='1' ")
	    void deleteNotPurchesedCustomer();
	   
	   
	    List<CustomerEnq> findByProduct(Integer productId);
	    
	    
	    List<CustomerEnq> findByProductIn(List<Integer> productIds); // Find customers based on product IDs


	    CustomerEnq findByEmail(String email);
	    
	    
	   // Optional<CustomerEnq> findFirstByCid(Integer cid);
	    
	    List<CustomerEnq> findByCid(Integer cid);

}

