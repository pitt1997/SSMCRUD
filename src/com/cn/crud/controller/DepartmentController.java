package com.cn.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cn.crud.bean.Department;
import com.cn.crud.bean.Msg;
import com.cn.crud.service.DepatmentService;

//处理和部门有关的请求
@Controller
public class DepartmentController {
	@Autowired
	private DepatmentService depatmentService;
	
	//返回所有部门信息
	@RequestMapping("/depts")
	@ResponseBody
	public Msg getDeots() {
		List <Department> list=depatmentService.getDepts();
		return Msg.success().add("depts", list);
	}
}
