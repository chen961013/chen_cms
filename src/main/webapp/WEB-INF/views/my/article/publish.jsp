<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>KindEditor JSP</title>
<link rel="stylesheet"
	href="/resource/kindeditor/themes/default/default.css" />
<link rel="stylesheet"
	href="/resource/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8"
	src="/resource/kindeditor/plugins/code/prettify.js"></script>
<script charset="utf-8" src="/resource/kindeditor/kindeditor-all.js"></script>
    
<script charset="utf-8" src="/resource/kindeditor/lang/zh-CN.js"></script>
<script src="/resource/js/jquery-3.2.1.js"></script>

<script>
	KindEditor.ready(function(K) {
		window.editor1 = K.create('textarea[name="content1"]', {
			cssPath : '/resource/kindeditor/plugins/code/prettify.css',
			uploadJson : '/resource/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '/resource/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
			}
		});
		prettyPrint();
	});
	function query() {
		alert(editor1.html())
		//alert( $("[name='content1']").attr("src"))
	}
</script>
</head>
<body>
	<form name="example" method="post" action="demo.jsp">
		<!-- 标题框 -->
		<div class="form-group">
			<div class="input-group mb-2">
				<div class="input-group-prepend">
					<div class="input-group-text">标题</div>
				</div>
				<input type="text" class="form-control" id="inlineFormInputGroup">
			</div>
		</div>
		<!-- 富文本框 -->
		<div class="form-group">
			<textarea name="content1" cols="100" rows="8" 
			style="width: 795px; height: 300px; visibility: hidden;"><%=htmlspecialchars(htmlData)%></textarea>
		</div>
		<br>
		<!-- 下拉框选择 -->
		<div class="form-group form-inline">
			<div class="input-group mb-2">
				<div class="input-group-prepend">
					<div class="input-group-text">所属栏目</div>
				</div>
				<select class="form-control" name="channelId" id="channel">
					<option value="">请选择</option>
				</select>&nbsp;&nbsp;&nbsp;
				<div class="input-group-prepend">
					<div class="input-group-text">所属分类</div>
				</div>
				<select class="form-control" name="categoryId" id="category">
					<option value="">请选择</option>
				</select>
			</div>
		</div>

		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<button class="btn btn-outline-secondary" type="button"
					id="inputGroupFileAddon03">标题图片</button>
			</div>
			<div class="custom-file">
				<input type="file" class="custom-file-input" id="inputGroupFile03"
					aria-describedby="inputGroupFileAddon03"> <label
					class="custom-file-label" for="inputGroupFile03">上传图片</label>
			</div>
		</div>

		<!-- 提交按钮 -->
		<div class="form-group">
			<br /> <input type="button" name="button" class="btn btn-primary" value="提交内容"
			onclick="query()" /> 
		</div>
		
	</form>
</body>
<script type="text/javascript">

	$(function(){
		$.get("/channel/channels",function(channels){
			for ( var i in channels) {
				$("#channel").append("<option value='"+channels[i].id+"'>"+channels[i].name+"</option>");
			}
		})
		
		
		
		$("#channel").change(function(){
			$("#category").empty();
			if($("#channel").val()==""){
				$("#category").html("<option value=''>请选择</option>");
				return;
			}
			var channelId = $("#channel").val();
			$.get("/category/categorys",{channelId:channelId},function(categorys){
				for ( var i in categorys) {
					$("#category").append("<option value='"+categorys[i].id+"'>"+categorys[i].name+"</option>");
				}
			}
					
			)
		})
	})

</script>
</html>
<%!private String htmlspecialchars(String str) {
		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\"", "&quot;");
		return str;
	}%>