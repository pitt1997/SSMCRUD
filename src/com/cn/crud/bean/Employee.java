package com.cn.crud.bean;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;

public class Employee {
   
    private Integer empId; 
    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})"
    		,message="用户名必须是2-5位中文或者6-16位英文和数字或者下划线的组合!!!")
    private String empName; 
    private String empGender;  
    //@Email
    @Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
    		,message="邮箱格式不正确!!!")
    private String email;  
    private Integer deptId;  
    //查询员工时  外键部门信息
    private Department department;
    
    
    
    public Employee() {
		super();
		
	}
	public Employee(Integer empId, String empName, String empGender, String email, Integer deptId) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.empGender = empGender;
		this.email = email;
		this.deptId = deptId;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public Integer getEmpId() {
        return empId;
    }    
    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }  
    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }
  
    public String getEmpGender() {
        return empGender;
    }
   
    public void setEmpGender(String empGender) {
        this.empGender = empGender == null ? null : empGender.trim();
    }
   
    public String getEmail() {
        return email;
    }

   
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }
   
    public Integer getDeptId() {
        return deptId;
    }
    
    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }
}