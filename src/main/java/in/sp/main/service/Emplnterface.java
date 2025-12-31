package in.sp.main.service;

import java.util.List;
import java.util.Optional;

import org.antlr.v4.runtime.misc.TestRig;

import in.sp.main.entity.CustomerEnq;
import in.sp.main.entity.Employee;

public interface Emplnterface 
{
	public Employee login(String email);
	public boolean addEmployeeService(Employee emp);
	public List<Employee> getAllEmployeesService();
	
	public boolean deleteId(int id);
	public Employee updateEmployeeForm(String email);
	
	public boolean updateEmployeeData(Employee emp);
	public void deleteEmployee(Employee emp);
	
	public List<Object[]> getPurchasedCourseCountService();
	public Optional<Employee> findByEmpId(int id);


}
