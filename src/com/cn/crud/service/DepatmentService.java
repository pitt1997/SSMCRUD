package com.cn.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.crud.bean.Department;
import com.cn.crud.dao.DepartmentMapper;

@Service
public class DepatmentService {
	@Autowired
	private DepartmentMapper departmentMapper;
	public List<Department> getDepts() {
		List <Department> list=departmentMapper.selectByExample(null);
		return list;
	}

}
