package com.cn.crud.bean;

import java.util.HashMap;
import java.util.Map;

import com.github.pagehelper.PageInfo;

/*
 * 通用的返回的类
 */
public class Msg {
	//状态码   返回100  代表成功  -100代表失败
	private int code;
	//提示详细信息  失败原因
	private String msg;
	//用户要返回给浏览器的数据
	private Map<String,Object> extend =new HashMap<String ,Object>();
	
	public static Msg success() {   //返回成功
		Msg result=new Msg();
		result.setCode(100);
		result.setMsg("处理成功!");
		return result;
	}
	public static Msg fail() {   //返回成功
		Msg result=new Msg();
		result.setCode(-100);
		result.setMsg("处理失败!");
		return result;
	}
	
	public Msg add(String key,Object value) {
		this.getExtend().put(key, value);
		return this;
		
	}
	
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getExtend() {
		return extend;
	}
	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}
	
	
	
	
}
