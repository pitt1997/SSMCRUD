<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% pageContext.setAttribute("path", request.getContextPath()); %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
  
	<link rel="stylesheet" type="text/css" href="${path}/static/jquery/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${path}/static/jquery/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${path}/static/jquery/demo.css">
	<script type="text/javascript" src="${path}/static/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="${path}/static/jquery/jquery.easyui.min.js"></script>															
	<script type="text/javascript" src="${path}/static/ckeditor/ckeditor.js"></script>     
    
<title>员工列表</title>
</head>
<body>
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
				<button type="button" class="btn btn-primary">新增</button>
				<button type="button" class="btn btn-danger">删除</button> 				
			</div>		
		</div>
		<!-- 显示数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>#Id</th>
						<th>empName</th>
						<th>gender</th>
						<th>email</th>
						<th>departmentName</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list}" var="emp">
					<tr>
						<th>${emp.empId}</th>
						<th>${emp.empName}</th>
						<th>${emp.empGender=="M"?"男":"女"}</th>
						<th>${emp.email }</th>
						<th>${emp.department.deptName }</th>
						<th>
							<button class="btn btn-primary btn-sm">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							编辑</button>
							<button class="btn btn-danger btn-sm">删除</button> 
							
						</th>
					</tr>	
					
					</c:forEach>
					
				</table>
			</div>
		
		</div>
		<!-- 分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6">
				当前${pageInfo.pageNum },总${pageInfo.pages }页,总${pageInfo.total }条记录
			</div>
			<!-- 分页条信息 -->
			<div class="col-md-6">
				<nav aria-label="Page navigation">
  				<ul class="pagination">
  				<li><a href="${path }/emps?pn=1">首页</a></li>
  				<c:if test="${pageInfo.hasPreviousPage }">
  					<li>
      				<a href="${path }/emps?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
        			<span aria-hidden="true">&laquo;</span>
      				</a>
    				</li>
  				</c:if>    			
    			<c:forEach items="${pageInfo.navigatepageNums }" var="PageNum">
    				<c:if test="${PageNum==pageInfo.pageNum }">
    				<li class="active"><a href="#">${PageNum }</a></li>
    				</c:if>  				
    				<c:if test="${PageNum!=pageInfo.pageNum }">
    				<li ><a href="${path }/emps?pn=${PageNum }">${PageNum }</a></li>
    				</c:if>
    			</c:forEach>
    			
    			<c:if test="${pageInfo.hasNextPage }">
    			
  					<li>
      				<a href="${path }/emps?pn=${pageInfo.pageNum+1 }" aria-label="Next">
        			<span aria-hidden="true">&raquo;</span>
      				</a>
    				</li>
  				</c:if>
    			
    			<li><a href="${path }/emps?pn=${pageInfo.pages}">最后一页</a></li>
  				</ul>
				</nav>
			</div>
		</div>
	
	</div>
</body>
</html>