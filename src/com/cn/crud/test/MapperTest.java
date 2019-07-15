package com.cn.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cn.crud.bean.Department;
import com.cn.crud.bean.Employee;
import com.cn.crud.dao.DepartmentMapper;
/*
 * 测试dao层的工作
 */
//1.导入springTest模块
//2.使用@ContextConfiguration注解指定spring配置文件的位置
//3.直接autowired要使用的组件
import com.cn.crud.dao.EmployeeMapper;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmployeeMapper employeeMapper;  //批量操作
	@Autowired
	SqlSession sqlSession;
	@Test
	public void testCRUD() {
	//1.创建springIOC容器
	//	ApplicationContext ioc=new ClassPathXmlApplicationContext("applicationContext.xml");
	//2.从容器中获取Mapper
	//	DepartmentMapper bean= ioc.getBean(DepartmentMapper.class);
		System.out.println(departmentMapper);
	//1.插入几个部门
		//departmentMapper.insertSelective(new Department(null,"开发部02"));
		//departmentMapper.insertSelective(new Department(null, "测试部")); 
	//2.生成员工数据，测试员工插入
		//employeeMapper.insertSelective(new Employee(null,"Jerry","M","123@.com",3));
		//employeeMapper.insertSelective(new Employee(null,"Tom","M","122223@.com",3));
	//3.批量插入多个员工    使用可以执行批量操作的sqlSession 
		EmployeeMapper mapper=sqlSession.getMapper(EmployeeMapper.class);
		for(int i=0;i<100;i++) {
			String id=UUID.randomUUID().toString().substring(0, 5)+""+i;
			mapper.insertSelective(new Employee(null,id,i%2==0?"M":"F",id+"@123.com",1));		
		}
		System.out.println("批量执行完成!!!");
	}
}
