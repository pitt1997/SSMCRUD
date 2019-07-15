package com.cn.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.crud.bean.Employee;
import com.cn.crud.bean.EmployeeExample;
import com.cn.crud.bean.EmployeeExample.Criteria;
import com.cn.crud.dao.EmployeeMapper;


@Service
public class EmployeeService {

	@Autowired
	EmployeeMapper 	employeeMapper;
	
	//查询所有员工
	public List<Employee> getAll() {		
		return employeeMapper.selectByExampleWithDept(null);
	}

	public void saveEmp(Employee employee) {	
		employeeMapper.insertSelective(employee);  //1.insertSelective  id自增的  2.insert   具有id的
	}
	//检验用户名是否可用   是否已经拥有了    ==0  true:代表当前姓名可用  false:代表不可用
	public boolean checkUser(String empName) {
		EmployeeExample example=new EmployeeExample();
		Criteria criteria=example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count=employeeMapper.countByExample(example);
		return count==0;
	}

	/**
	 * 按照id查找员工
	 * @param id
	 * @return
	 */
	public Employee getEmp(Integer id) {
		Employee employee=employeeMapper.selectByPrimaryKey(id);
		return employee;
	}
	/**
	 * 员工更新
	 * @param employee
	 */
	public void updateEmp(Employee employee) {
		employeeMapper.updateByPrimaryKeySelective(employee);  //按照主键有选择的更新   名字没变则不用更新
		
	}
	/**
	 * 员工删除
	 * @param id
	 */
	public void deleteEmp(Integer id) {
		employeeMapper.deleteByPrimaryKey(id);
		
	}

	public void deleteBatch(List<Integer> ids) {
		//构建条件
		EmployeeExample example=new EmployeeExample();
		Criteria criteria=example.createCriteria();
		criteria.andEmpIdIn(ids);    //wherre empId in (1,2,3,.....) 
		employeeMapper.deleteByExample(example);//按条件删除
		
	}

	

	

}
