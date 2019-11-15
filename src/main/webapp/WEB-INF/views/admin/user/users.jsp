<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<script type="text/javascript" src="/resource/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resource/css/bootstrap.min.css" />
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resource/js/cms.js"></script>
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">

		function query() {
			$("#center").load("/user/users?username=" + $("[name='username']").val());
		}
		

		function goPage(pageNum) {
			$("#center").load("/user/users?username="+$("[name=username]").val()+"&pageNum="+pageNum);
		}
	</script>


	<div class="form-row align-items-center">
		<div class="col-auto">
			<div class="input-group mb-2">
				<div class="input-group-prepend">
					<div class="input-group-text">用户名</div>
				</div>
				<input type="text" name="username" class="form-control"
					id="inlineFormInputGroup" value="${user.username }">
			</div>
		</div>
		<div class="col-auto">
			<button type="button" class="btn btn-primary mb-2" onclick="query()">查询</button>
		</div>
	</div>
	<table class="table table-hover table-bordered"
		style="text-align: center">
		<thead class="thead-dark">
			<tr>
				<th>序号</th>
				<th>用户名</th>
				<th>昵称</th>
				<th>生日</th>
				<th>性别</th>
				<th>注册日期</th>
				<th>修改日期</th>
				<th>操作</th>
			</tr>
		</thead>
		<c:forEach items="${users }" var="user" varStatus="index">
			<tr>
				<td>${(info.pageNum-1)*info.pageSize+index.index+1 }</td>
				<td>${user.username }</td>
				<td>${user.nickname }</td>
				<td><fmt:formatDate value="${user.birthday }"
						pattern="yyyy-MM-dd" /></td>
				<td>${user.gender==0?"男":"女" }</td>
				<td><fmt:formatDate value="${user.created }"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td><fmt:formatDate value="${user.updated }"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>
					<c:if test="${user.locked==1 }">
						<button type="button" class="btn btn-success" onclick="update(this,${user.id})">启动</button>
					</c:if>
					<c:if test="${user.locked==0 }">
						<button type="button" class="btn btn-danger" onclick="update(this,${user.id})">禁用</button>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>

	<jsp:include page="/WEB-INF/views/common/pageUtil.jsp"/>
</body>
<script type="text/javascript">
	function update(btn,id){
		var locked = $(btn).text()=="启动"?0:1;
		$.post("/user/update",{id:id,locked:locked},function(data){
			if(data="true"){
				//alert("修改成功")
				$(btn).text(locked==0?"禁用":"启动");//先改变按钮内容
	        	$(btn).attr("class",locked=="1"?"btn btn-success":"btn btn-danger")//改变按钮颜色
			}else{
				alert("修改失败")
			}
		})
	}
	
</script>
</html>
