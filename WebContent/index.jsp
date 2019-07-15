<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% pageContext.setAttribute("path", request.getContextPath()); %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="${path}/static/jquery/jquery.min.js"></script>
<link href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>	
	<!-- 
	<script type="text/javascript" src="${path}/static/jquery/jquery.easyui.min.js"></script>																 
	 -->	   
    
<title>员工列表</title>
</head>
<body>
	<!-- Modal  员工修改的模态框 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  	<div class="modal-dialog" role="document">
    <div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" >员工修改</h4>
    </div>
    <div class="modal-body">
	  	<form class="form-horizontal">
			<div class="form-group">
				<label for="empName_add_input" class="col-sm-2 control-label">empName</label>
				<div class="col-sm-10">
					<p class="form-control-static" id="empName_update_static"></p>
					<span class="help-block" ></span>
				</div>
			</div>
						
			<div class="form-group">
				<label for="email_add_input" class="col-sm-2 control-label">email</label>
				<div class="col-sm-10">
					<input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@123.com">
					<span class="help-block" ></span>
				</div>
			</div>
			<div class="form-group">
				<label for="email_add_input" class="col-sm-2 control-label">gender</label>
				<div class="col-sm-10">
					<label class="radio-inline"> 
						<input type="radio" name="empGender" id="gender_update_input" value="M" checked="checked">男
					</label> 
					<label class="radio-inline"> 
						<input type="radio" name="empGender" id="gender_update_input02" value="F">女
					</label>
				</div>
			</div>
			<div class="form-group">
				<label for="email_update_input" class="col-sm-2 control-label">deptName</label>
				<div class="col-sm-4">
								<select class="form-control" name="deptId" id="dept_update_select"></select>
				</div>
			</div>										
		</form>

	</div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
    </div>
    </div>
 	</div>
	</div>


	<!-- Modal  员工添加的模态框 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  	<div class="modal-dialog" role="document">
    <div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
    </div>
    <div class="modal-body">
	  	<form class="form-horizontal">
			<div class="form-group">
				<label for="empName_add_input" class="col-sm-2 control-label">empName</label>
				<div class="col-sm-10">
					<input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
					<span class="help-block" ></span>
				</div>
			</div>
						
			<div class="form-group">
				<label for="email_add_input" class="col-sm-2 control-label">email</label>
				<div class="col-sm-10">
					<input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@123.com">
					<span class="help-block" ></span>
				</div>
			</div>
			<div class="form-group">
				<label for="email_add_input" class="col-sm-2 control-label">gender</label>
				<div class="col-sm-10">
					<label class="radio-inline"> 
						<input type="radio" name="empGender" id="gender_add_input" value="M" checked="checked">男
					</label> 
					<label class="radio-inline"> 
						<input type="radio" name="empGender" id="gender_add_input02" value="F">女
					</label>
				</div>
			</div>
			<div class="form-group">
				<label for="email_add_input" class="col-sm-2 control-label">deptName</label>
				<div class="col-sm-4">
								<select class="form-control" name="deptId" id="dept_add_select"></select>
				</div>
			</div>										
		</form>

	</div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
    </div>
    </div>
 	</div>
	</div>


	<!-- 显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
			<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button type="button" class="btn btn-primary" id="emp_add_modal_btn">新增</button>
				<button type="button" class="btn btn-danger" id="emp_del_all_modal_btn">删除</button> 				
			</div>		
		</div>
		<!-- 显示数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id ="emps_table">
					<thead>
					<tr>
						<th>
							<input type="checkbox" id="check_all"/>
						</th>
						<th>#Id</th>
						<th>empName</th>
						<th>gender</th>
						<th>email</th>
						<th>departmentName</th>
						<th>操作</th>
					</tr>					
					</thead>
					<tbody>						
					</tbody>
				</table>
			</div>		
		</div>
		<!-- 分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6" id="page_info_area">
				
			</div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area">			
			</div>
		</div>
	
	</div>
	
	<script type="text/javascript">		
		var totalRecord,currentPage; 
		
		//1.页面加载完成后，直接发送一个ajax请求，要求分页数据
		$(function(){
			to_page(1);//首页
		});
		function build_emps_table(result){
			//构建之前都清空table表格!!!!!!!
			$("#emps_table tbody").empty();
			//alert(10);
			var emps=result.extend.pageInfo.list;
			//alert(11);
			$.each(emps,function(index,item){
				var checkBoxTD=$("<td><input type='checkbox' class='check_item'/></td>");
				var empIdTD=$("<td></td>").append(item.empId);
				var empNameTD=$("<td></td>").append(item.empName);
				var empGenderTD=$("<td></td>").append(item.empGender=="M"?"男":"女");
				var emailTD=$("<td></td>").append(item.email);
				var deptNameTD=$("<td></td>").append(item.department.deptName);					
				var editBtn=$("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				//为编辑按钮添加一个自定义属性  ，来表示当前员工的id			
				editBtn.attr("edit-id",item.empId);
				var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				//
				delBtn.attr("del-id",item.empId);
				var btnTD=$("<td></td>").append(editBtn).append("  ").append(delBtn);
				$("<tr></tr>").append(checkBoxTD)
				.append(empIdTD)
				.append(empNameTD)
				.append(empGenderTD)
				.append(emailTD)
				.append(deptNameTD)
				.append(btnTD)				
				.appendTo("#emps_table tbody");

			});						
		}
		//
		function build_page_info(result){
			$("#page_info_area").empty();
			$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+result.extend.pageInfo.pages+"页,总"+result.extend.pageInfo.total+"条记录");	
			
			totalRecord=result.extend.pageInfo.total;
			currentPage=result.extend.pageInfo.pageNum;
		}
		function build_page_nav(result){
			$("#page_nav_area").empty();
			var ul=$("<ul></ul>").addClass("pagination");
			
			var firsPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
			if(result.extend.pageInfo.hasPreviousPage==false){
				firsPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}else{
				firsPageLi.click(function(){
					to_page(1);	
				});
				prePageLi.click(function(){
					to_page(result.extend.pageInfo.pageNum-1);	
				});
			}
			
			var nexPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));			
			var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			if(result.extend.pageInfo.hasNextPage==false){
				nexPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}else{
				nexPageLi.click(function(){
					to_page(result.extend.pageInfo.pageNum+1);				
				});
				lastPageLi.click(function(){
					to_page(result.extend.pageInfo.pages);				
				});
			}
			
			ul.append(firsPageLi).append(prePageLi);
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				var numLi=$("<li></li>").append($("<a></a>").append(item));
				//判断
				if(result.extend.pageInfo.pageNum==item ){
					numLi.addClass("active");
				}
				numLi.click(function(){
					to_page(item);	
				});
				ul.append(numLi);
			});
			ul.append(nexPageLi).append(lastPageLi);
			var nav=$("<nav></nav>").append(ul);  //把ul加入到nav中去
			$("#page_nav_area").append(nav);
			//nav.appendTo("#page_nav_area");
			
			
		}
		function to_page(pn){
			$.ajax({
				url:"${path}/emps",
				data:"pn="+pn,
				type:"GET",
				success:function(result){
					//console.log(result);
					//1.解析并显示员工数据
					build_emps_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.解析显示分页条数据
					build_page_nav(result);
					
				}
			});
		}
		//重置 所有数据都重置（数据和样式）
		function reset_form(ele){
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");   //$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");   //清空span里面的提示信息
			
		}
		//点击新增按钮弹出模态框
		$('#emp_add_modal_btn').click(function(){
				//弹出之前都该清除表单数据(表单重置)    所有数据都重置（数据和样式）
				reset_form("#empAddModal form");
				//$("#empAddModal form")[0].reset();
				//发送Ajax请求，查出部门信息，显示在下拉列表
				getDeptInfo("#empAddModal select");
				$("#empAddModal").modal({
					backdrop:"static"
				});
		});
		
		
		
		//查出所有部门信息并且显示到下拉列表中
		function getDeptInfo(ele){
			//清空之前下拉列表的数据
			$(ele).empty();	
			$.ajax({
				url:"${path}/depts",
				type:"GET",
				success:function(result){
					//console.log(result);//[{deptId: 1, deptName: "开发部"}, {deptId: 2, deptName: "人事部"}, {deptId: 3, deptName: "开发部02"},…]
									
					$.each(result.extend.depts,function(){//遍历
						var optionE=$("<option></option>").append(this.deptName).attr("value",this.deptId);
						optionE.appendTo(ele);
					});					
				}
			});				
		}
		//校验表单数据
		function validate_add_form(){
			//取得校验数据,适应正则表达式
			var empName=$("#empName_add_input").val();
			var regName=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;  //允许1.“a-z”  2.“A-Z”  3.“0-9”  4.“_”（下划线） 5.“-” 6. 6到16位字符  7.允许中文
			if(!regName.test(empName)){
				//alert("用户名可以是2-5位中文或者6-16位英文和数字或者下划线的组合!!!");
				show_validate_msg("#empName_add_input","error","用户名可以是2-5位中文或者6-16位英文和数字或者下划线的组合!!!");				
				return false;
			}else{
				show_validate_msg("#empName_add_input","success","");								
			}
			//2.校验邮箱信息
			var email=$("#email_add_input").val();
			var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;  
			if(!regEmail.test(email)){
				//alert("邮箱格式不正确!!!");
				show_validate_msg("#email_add_input","error","邮箱格式不正确!!!");					
				return false;
			}else{
				show_validate_msg("#email_add_input","success","");			
			}
			
			return true;
		}
		function show_validate_msg(element,status_info,msg){
			//清除当前元素的校验状态
			$(element).parent().removeClass("has-success has-error");
			$(element).next("span").text("");
			if("success"==status_info){
				$(element).parent().addClass("has-success");
				$(element).next("span").text(msg);
			}else if("error"==status_info){
				$(element).parent().addClass("has-error");
				$(element).next("span").text(msg);
			}
		}
		//修改时候获取员工的信息
		function getEmp(id){
			$.ajax({
				url:"${path}/emp/"+id,
				type:"GET",
				success:function(result){
					var emp=result.extend.emp;	
					$("#empName_update_static").text(emp.empName);
					$("#email_update_input").val(emp.email);
					$("#empUpdateModal input[name=empGender]").val([emp.empGender]);
					$("#empUpdateModal select").val([emp.deptId]);
					
				}
			});
		}
		//给输入框添加一个change事件
		//$('#emp_save_btn').attr("ajax-va","success");//添加一个校验标记    判断是否真的可以保存  禁用保存按钮
		$("#empName_add_input").change(function(){
			//发送ajax请求校验用户名是否可用
			var empName=this.value;
			$.ajax({
				url:"${path}/checkuser",
				data:"empName="+empName,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#empName_add_input","success","用户名可用!");
						$('#emp_save_btn').attr("ajax-va","success");//添加一个校验标记    判断是否真的可以保存  禁用保存按钮
					}else{
						show_validate_msg("#empName_add_input","error",result.extend.va_msg);
						$('#emp_save_btn').attr("ajax-va","error");
					}
				}
			});
		});
		
		//保存按钮事件
		$('#emp_save_btn').click(function(){
			//1.模态框中填写的表单数据提交给服务器保存
			//保存前先对员工信息进行校验
			
			//用后端来校验  更加安全    使用前后端一起校验  安全性！！！！！！
			if(!validate_add_form()){
				return false;
			} 
			
			
			//1.判断之前Ajax校验用户名是否正确
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
			
			//2.发送Ajax请求保存员工			
			$.ajax({
				url:"${path}/emp",
				type:"POST",
				data:$("#empAddModal form").serialize(),
				success:function(result){					
					if(result.code==100){
						//alert(result.msg);
						//员工保存成功后 1.关闭模态框  2.到最后一页显示数据 (发送ajax请求显示最后一页数据即可)
						$("#empAddModal").modal('hide');
						to_page(totalRecord);	  //取得很大的一个数   使得分页到最后一页	
					}else{
						//显示失败信息
						console.log(result);
						if(undefined!=result.extend.errorFields.email){
							//显示邮箱错误信息
							show_validate_msg("#email_add_input","error",result.extend.errorFields.email);	
						}
						if(undefined!=result.extend.errorFields.empName){
							//显示用户名错误信息
							show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);
						}
					}									
				}
			}); 			
		});
		//为编辑按钮绑事件     按钮创建之前就去绑定事件  所以不能成功（按钮是通过Ajax去请求的）
 		//1.在创建按钮的时候就绑定事件
 		//2.绑定单击事件    live()可以为以后添加的元素添加事件    使用on方法也可以替代
		/* $(".edit_btn").click(function(){
			alert("edit");
		}); */		
		$(document).on("click",".edit_btn",function(){
			//alert("edit");
			//1.查出部门信息，显示部门列表
			getDeptInfo("#empUpdateModal select");
			//2.查出员工信息，显示员工信息
			getEmp($(this).attr("edit-id"));
			//3.将员工id传递到模态框的更新按钮里面
			$("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
			$("#empUpdateModal").modal({
				backdrop:"static"
			});
		});
		
		//单个删除按钮  
		$(document).on("click",".delete_btn",function(){
			//弹出是否确认删除对话框
			//找到祖先 元素  第二个td
			var delempName=$(this).parents("tr").find("td:eq(2)").text();
			var delempId=$(this).attr("del-id");
			if(confirm("确认删除【"+delempName+"】吗？")){
				//确认之后发送ajax请求
				$.ajax({
					url:"${path}/emp/"+delempId,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						to_page(currentPage);
					}
				});
			}
		});
		
		//更新按钮
		$("#emp_update_btn").click(function(){
			//验证邮箱是否合法			
			var email=$("#email_update_input").val();
			var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;  
			if(!regEmail.test(email)){
				//alert("邮箱格式不正确!!!");
				show_validate_msg("#email_update_input","error","邮箱格式不正确!!!");					
				return false;
			}else{
				show_validate_msg("#email_update_input","success","");			
			}
			//2.发送ajax请求保存更新的员工数据
			$.ajax({
				url:"${path}/emp_update/"+$(this).attr("edit-id"),
				type:"POST",
				data:$("#empUpdateModal form").serialize(),
				success:function(result){
					//alert(result.msg);
					//1.关闭框
					$("#empUpdateModal").modal("hide");
					//2.回到本页
					to_page(currentPage);
				}
			});
		});
		//完成全选和/全不选的功能
		$("#check_all").click(function(){
			//attr是获取自定义属性的值$(this).attr("checked");
			//prop是修改和读取dom原始属性的值
			//alert($(this).prop("checked"));   $(this).prop("checked") 返回值为true和false
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		
		//为每一个选择绑定事件
		$(document).on("click",".check_item",function(){
			//$("#check_all").prop("checked");
			//alert($(".check_item:checked").length);   //$(".check_item").length
			var flag=$(".check_item:checked").length==$(".check_item").length;
			$("#check_all").prop("checked",flag);
		});
		//点击全部删除   即批量删除
		$("#emp_del_all_modal_btn").click(function(){
			var empNames="";
			var del_ids=""
			$.each($(".check_item:checked"),function(){   //遍历已经选中的元素
				empNames+=$(this).parents("tr").find("td:eq(2)").text()+",";//找到父元素的tr里面的索引为2的td
				//组装员工ids
				del_ids+=$(this).parents("tr").find("td:eq(1)").text()+"-";				
			});			
			empNames.substring(0,empNames.length-1);
			del_ids.substring(0,del_ids.length-1);
			if(confirm("确认删除【"+empNames+"】吗？")){
				//发送ajax请求
				alert(1);
				$.ajax({
					url:"${path}/emp/"+del_ids,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						//回到当前页面
						to_page(currentPage);
					}
				});
			}
		});
		
		
		
	</script>	
</body>
</html>