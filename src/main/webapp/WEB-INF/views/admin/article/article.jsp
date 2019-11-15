<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<script type="text/javascript" src="/resource/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resource/css/bootstrap.min.css" />
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">

	function back() {
		$("#center").load("/article/articles");
	}
	
	function update(id,status) {
		$.post("/article/update",{id:id,status:status},function(data){
			if(data="true"){
				back();
			}else{
				alert("修改失败")
			}
		})
	}

</script>
</head>
<body>
		<div style="text-align: center">
		<dl>
			<dt>
			  <h2>${article.title }</h2>
			</dt>
			
			<hr>
			<dd>
			<button type="button" class="btn btn-success" onclick="update(${article.id},1)">同意</button>
			<button type="button" class="btn btn-danger" onclick="update(${article.id},0)">驳回</button>
			<button type="button" class="btn btn-info" onclick="back()">返回列表</button>
			
			</dd>
			<dd><fmt:formatDate value="${aritcle.updated }" pattern="yyyy-MM-dd HH:mm:ss"/> </dd>
			<dd>${article.content }</dd>

		</dl>

	</div>
</body>
</html>