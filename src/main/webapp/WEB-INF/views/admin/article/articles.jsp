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
<title>文章管理</title>
<script type="text/javascript">
	
//文档就绪函数.让下拉框回显

	$(function(){
		 $("#status").val('${article.status}'); 
	})
	
	function query() {
		$("#center").load("/article/articles?title="+$("[name=title]").val()+"&status="+$("#status").val());
	}

	function goPage(pageNum) {
		$("#center").load("/article/articles?title="+$("[name=title]").val()+"&pageNum="+pageNum+"&status="+$("#status").val());
	}
	
	function update(btn,id){
		var hot = $(btn).text()=="是"?0:1;
		$.post("/article/update",{id:id,hot:hot},function(data){
			if(data="true"){
				//alert("修改成功")
				$(btn).text(hot==0?"否":"是");//先改变按钮内容
	        	$(btn).attr("class",hot=="1"?"btn btn-success":"btn btn-danger")//改变按钮颜色
			}else{
				alert("修改失败")
			}
		})
	}
	
	function details(id) {
		$("#center").load("/article/article?id="+id);
	}
</script>
</head>
<body>
	<div class="form-row align-items-center">
		<div class="form-group form-inline">
			<div class="input-group mb-2">
				<div class="input-group-prepend">
					<div class="input-group-text">标题</div>
				</div>
				<input type="text" name="title" class="form-control"
					id="inlineFormInputGroup" value="${article.title }">&nbsp;&nbsp;
				<div class="input-group-prepend">
					<div class="input-group-text">文章状态</div>
				</div>
				<select class="form-control" name="status" id="status">
					<option value="-1">待审</option>
					<option value="1">已审</option>
					<option value="0">驳回</option>
					<option value="">全部</option>
				</select>
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
					<th>文章标题</th>
					<th>作者</th>
					<th>是否热门</th>
					<th>所属栏目</th>
					<th>所属分类</th>
					<th>更新时间</th>
					<th>操作</th>
					<th>是否通过审核</th>
				</tr>
			</thead>
			<c:forEach items="${info.list }" var="article" varStatus="index">
				<tr>
					<td>${(info.pageNum-1)*info.pageSize+index.index+1 }</td>
					<td>${article.title }</td>
					<td>${article.user.username }</td>
					<td><c:if test="${article.status==1 }">
							<c:if test="${article.hot==1 }">
								<button type="button" class="btn btn-success"
									onclick="update(this,${article.id})">是</button>
							</c:if>
							<c:if test="${article.hot==0 }">
								<button type="button" class="btn btn-danger"
									onclick="update(this,${article.id})">否</button>
							</c:if>
						</c:if> <c:if test="${article.status==0 }">
							<button type="button" class="btn btn-danger"
								onclick="update(this,${article.id})" disabled="disabled">否</button>
						</c:if></td>
					<td>${article.channel.name }</td>
					<td>${article.category.name }</td>
					<td><fmt:formatDate value="${article.updated }"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>
						<button type="button" class="btn btn-info"
							onclick="details(${article.id })">详情</button>
					</td>
					<td><c:if test="${article.status==1 }">
						是
					</c:if> <c:if test="${article.status==0 }">
						否
					</c:if> <c:if test="${article.status==-1 }">
						待审
					</c:if></td>

				</tr>
			</c:forEach>
		</table>
		<jsp:include page="/WEB-INF/views/common/pageUtil.jsp" />
</body>
</html>