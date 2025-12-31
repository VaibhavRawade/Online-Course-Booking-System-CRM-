package in.sp.main.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import in.sp.main.entity.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee,Integer>
{
	public Employee  findByEmail(String email);
}
