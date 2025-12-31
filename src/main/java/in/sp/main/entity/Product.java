package in.sp.main.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotEmpty;

@Entity
public class Product 
{
	@Id
	@GeneratedValue (strategy = GenerationType.AUTO)
	private int id;
	
	@NotEmpty(message = "Course name cannot be null and must have size greater than 0")
	private String coursename;
	
	@NotEmpty(message = "Syllabus cannot be Empty")
	private String syllabus;
	
	@NotEmpty(message = "price cannot be Empty")
	private String originalprice;
	
	@NotEmpty(message = "discount price cannot be Empty")
	private String discountedprice;
	
	@NotEmpty(message = "course validity cannot be Empty")
	private String coursevaliditiy;
	
	@NotEmpty(message = "trainer name cannot be Empty")
	private String trainersname;
	
	@NotEmpty(message = "trainer name cannot be Empty")
	private String trainersdetails;
	
	@Column(name = "employee_id")
    private Integer empId;
	
	public Integer getEmpId() {
		return empId;
	}
	public void setEmpId(Integer empId) {
		this.empId = empId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public String getSyllabus() {
		return syllabus;
	}
	public void setSyllabus(String syllabus) {
		this.syllabus = syllabus;
	}
	public String getOriginalprice() {
		return originalprice;
	}
	public void setOriginalprice(String originalprice) {
		this.originalprice = originalprice;
	}
	public String getDiscountedprice() {
		return discountedprice;
	}
	public void setDiscountedprice(String discountedprice) {
		this.discountedprice = discountedprice;
	}
	public String getCoursevaliditiy() {
		return coursevaliditiy;
	}
	public void setCoursevaliditiy(String coursevaliditiy) {
		this.coursevaliditiy = coursevaliditiy;
	}
	public String getTrainersname() {
		return trainersname;
	}
	public void setTrainersname(String trainersname) {
		this.trainersname = trainersname;
	}
	public String getTrainersdetails() {
		return trainersdetails;
	}
	public void setTrainersdetails(String trainersdetails) {
		this.trainersdetails = trainersdetails;
	}
}