<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/resource/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resource/css/bootstrap.min.css" />
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>
<title>管理页面</title>
</head>
<body>

	<div class="container-fluit">
		<div class="row">
			<div class="col-md-12"style="min-height: 100px; background-color: #000">
				<img alt="" src="/resource/img/logo.jpg" class="rounded-circle">
			</div>
		</div>
		<div class="row" style="min-height: 500px; margin-top: 10px">
			<div class="col-md-2"
				style="text-align: center;border-right: 1px solid #000" >
				<ul class="nav flex-column" style="font-size: 30px">
					<li class="nav-item"><a class="nav-link active" href="/admin/index">后台首页</a></li>
					<li class="nav-item"><a class="nav-link active" href="#"
						data="/user/users">用户管理</a></li>
					<li class="nav-item"><a class="nav-link" href="#" data="/article/articles">文章管理</a></li>
					<li class="nav-item"><a class="nav-link" href="#">分类管理</a></li>
					<li class="nav-item"><a class="nav-link active" href="#"
						data="/users">友情链接</a></li>
					<li class="nav-item"><a class="nav-link disabled" href="#"
						tabindex="-1" aria-disabled="true">系统设置</a></li>
				</ul>
			</div>
			<div class="col-md-9 split" id="center">
				
				<div align="center">
					<img alt="" src="/resource/img/index.jpg" class="rounded-circle" width="70%" height="70%">
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	//文档就绪函数
	$(function() {

		//为左侧菜单添加点击事件
		$(".nav-link").click(function() {
			var li = $("ul li a");
			//先移除所有的list-group-item-info样式
			li.removeClass("list-group-item-danger");
			//为左侧菜单添加动态点击样式 
			$(this).addClass("list-group-item-danger");
			//获取点击URL
			var url = $(this).attr("data");
			//在当前页面的中间区域执行url
			$("#center").load(url);
		})

	})
</script>
</html>