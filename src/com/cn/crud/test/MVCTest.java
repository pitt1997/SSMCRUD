package com.cn.crud.test;

import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import com.cn.crud.bean.Employee;
import com.github.pagehelper.PageInfo;

//使用spring测试模块提供的测试请求功能，测试crud请求
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
//路径需要修改  Eclipse和IDEA路径的不同 D:\developer_projects\SSMCRUD\WebContent\WEB-INF\dispatcherServlet-servlet.xml
@ContextConfiguration(locations= {"classpath:applicationContext.xml",
		"file:D:\\developer_projects\\SSMCRUD\\WebContent\\WEB-INF\\dispatcherServlet-servlet.xml"})
//@ContextConfiguration(locations= {"classpath:applicationContext.xml",
//		"file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MVCTest {
	@Autowired
	WebApplicationContext context;
	MockMvc mockMvc;
	@Before
	public void initMockMvc() {
		mockMvc=MockMvcBuilders.webAppContextSetup(context).build();
	}
	@Test
	public void testPage() throws Exception {
		//模拟发送请求并且拿到返回值
		MvcResult result=  mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();
		//请求成功后，请求域中会有pageInfo  我们可以取出惊醒验证
		MockHttpServletRequest request= result.getRequest();
		PageInfo p=(PageInfo) request.getAttribute("pageInfo");
		System.out.println("当前页码："+p.getPageNum());
		System.out.println("总页码："+p.getPages());
		System.out.println("总记录数："+p.getTotal());
		System.out.println("在页面需要连续显示的页码：");
		int []nums=p.getNavigatepageNums();
		for(int i:nums) {
			System.out.print(" --"+i);
		}
		//获取员工数据
		List<Employee> list=p.getList(); 
		for(Employee employee :list) {
			System.out.println("ID:"+employee.getEmpId()+"  Name："+employee.getEmpName());;
			
		}
		
	}
}
