package com.cn.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;
//import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cn.crud.bean.Employee;
import com.cn.crud.bean.Msg;
import com.cn.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;	
	
	
	/**
	 * 批量+单个  删除
	 * @param
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	public Msg deleteEmp(@PathVariable("ids")String ids) {
		if(ids.contains("-")) {//批量删除
			String []str_ids=ids.split("-");
			List<Integer> del_ids=new ArrayList<Integer>();
			//组装ids集合
			for(String s:str_ids) {
				del_ids.add(Integer.parseInt(s));
			}
			employeeService.deleteBatch(del_ids);//批量删除
			return Msg.success();
		}else {     			//单个删除
			Integer id=Integer.parseInt(ids);
			employeeService.deleteEmp(id);
			return Msg.success();
		}
		
	}
	
	/**
	 * 更新员工信息
	 * @param employee
	 * @return
	 */
	@RequestMapping(value="/emp_update/{empId}",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(Employee employee) {
		System.out.println("数据："+employee.getEmail());
		System.out.println("数据："+employee.getEmpGender());
		System.out.println("数据："+employee.getEmpName());
		System.out.println("数据："+employee.getDeptId());
		System.out.println("数据："+employee.getEmpId());
		employeeService.updateEmp(employee);
		return Msg.success();
	}
	
	/**
	 * 根据id查询员工
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id")Integer id) {
		Employee employee =employeeService.getEmp(id); 
		return Msg.success().add("emp", employee);
	}
	
	/**
	 * 检查用户名是否可用
	 * @param empName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkUser(@RequestParam("empName")String empName) {
		//先判断用户名是否是合法的表达式
		String regempName="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		if(!empName.matches(regempName)) {
			return Msg.fail().add("va_msg", "用户名可以是2-5位中文或者6-16位英文和数字或者下划线的组合!!!"); 
		}
		
		//数据库用户名重复验证
		boolean b=employeeService.checkUser(empName);
		if(b) {
			return Msg.success();  //100
		}else {
			return Msg.fail().add("va_msg", "用户名不可用!!!");
		}
		
	}
	
	
	@RequestMapping(value="/emp",method=RequestMethod.POST)     //规定POST请求为保存
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee,BindingResult result) {   //@Valid :校验 
		if(result.hasErrors()) {
			List <FieldError> errors=result.getFieldErrors();
			Map <String ,Object>map=new HashMap <String, Object>();
			for(FieldError fieldError:errors) {
				System.out.println("错误的字段名:"+fieldError.getField());
				System.out.println("错误的信息:"+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);	//校验失败
		}else {
			employeeService.saveEmp(employee);
			return Msg.success();	
		}		
	} 
	
	@RequestMapping("/emps")
	@ResponseBody       //@ResponseBody作用自动将返回的对象转为json字符串   需要导入jackson包
	public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn) {
		PageHelper.startPage(pn, 5);//顺序重要
		List<Employee> emps= employeeService.getAll();
		//使用pageInfo包装查询后的结果，只需将pageInfo交给页面就行了。
		//里面封装了详细的分页信息，包括有我们查询出来的数据
		PageInfo page=new PageInfo(emps,5);  //连续显示的页数
		return Msg.success().add("pageInfo", page);
		
	}
	
	//查询员工数据	 
	//@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn,
			Model model) {
		
		PageHelper.startPage(pn, 5);//顺序重要
		List<Employee> emps= employeeService.getAll();
		//使用pageInfo包装查询后的结果，只需将pageInfo交给页面就行了。
		//里面封装了详细的分页信息，包括有我们查询出来的数据
		PageInfo page=new PageInfo(emps,5);  //连续显示的页数
		model.addAttribute("pageInfo",page);
		//page.getNavigatepageNums();
		return "list";
	}
}
