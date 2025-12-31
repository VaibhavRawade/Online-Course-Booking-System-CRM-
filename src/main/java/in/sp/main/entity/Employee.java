package in.sp.main.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

@Entity
//@Table(uniqueConstraints={@UniqueConstraint(columnNames={"phone"})})
public class Employee 
{
	@Id
    @GeneratedValue (strategy = GenerationType.AUTO)
	private int id;
	
	@NotEmpty(message = "First name cannot be null and must have size greater than 0")
	private String name;
	
	@Size(min = 10,message = "Enter valid email")
	private String email;
	
	@Size(min = 5,message = "Password length should be more than 5")
	private String password;
	
	@Size(min = 10, max = 10, message = "phone no should be 10 digits")
	private String phone;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
