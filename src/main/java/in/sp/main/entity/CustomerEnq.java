package in.sp.main.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "customer_enq")
public class CustomerEnq
{
	@Id
    @GeneratedValue (strategy = GenerationType.AUTO)
	private int id;
	
	//@NotEmpty(message = "status cannot be null",r)
	public String status;
	
	@NotEmpty(message = "name cannot be null and must have size greater than 0")
	private String name;
	
	@Override
	public String toString() {
		return "CustomerEnq [id=" + id + ", status=" + status + ", intrestedcourse=" + intrestedcourse + "]";
	}


	@Column(name = "phone")  // or just omit it if default name is fine
	@Size(min = 10, max = 10, message = "phone no should be 10 digits")
	private String phone;
	
	@Column(name="password")
	private String Password;
	
	private String intrestedcourse;
	
	@Column(name="EnquiryDate")
	private String enquirydate;
	
	private String enquirytype;
	
	 	@Email
	    @Column(unique = true) // This ensures the email field is unique in the database
	    private String email;

		@Column(name="customer_ref_id")
		private Integer cid;


		public Integer getCid() {
			return cid;
		}

		public void setCid(Integer cid) {
			this.cid = cid;
		}

		public String getPassword() {
			return Password;
		}

		public void setPassword(String password) {
			Password = password;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}


		@Column(name = "product_id")
	    private Integer product;
		
		

	 
	

	public Integer getProduct() {
			return product;
		}

		public void setProduct(Integer product) {
			this.product = product;
		}

	public String getEnquirydate() {
		return enquirydate;
	}

	public void setEnquirydate(String enquirydate) {
		this.enquirydate = enquirydate;
	}

	
	//@NotEmpty(message = "discussion cannot be null and must have size greater than 0")
	private String discussion;
	
	

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIntrestedcourse() {
		return intrestedcourse;
	}

	public void setIntrestedcourse(String intrestedcourse) {
		this.intrestedcourse = intrestedcourse;
	}

	public String getEnquirytype() {
		return enquirytype;
	}

	public void setEnquirytype(String enquirytype) {
		this.enquirytype = enquirytype;
	}


	public String getDiscussion() {
		return discussion;
	}

	public void setDiscussion(String discussion) {
		this.discussion = discussion;
	}

	public String getCallto() {
		return callto;
	}

	public void setCallto(String callto) {
		this.callto = callto;
	}

	private String callto;

	
	
}
