<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>发布游记</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-------------jquery库-------------->
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<!-------------Amazeui--------------->
<script type="text/javascript" src="js/amazeui.js"></script>
<link rel="stylesheet" type="text/css" href="css/amazeui.css">
<!------------核心样式-------------->
<link rel="stylesheet" type="text/css" href="css/user.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link href="css/editor.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<%@ include file="/WEB-INF/jsp/my_commons/mhead.jsp"%>
	<!-----------------发布封面---------------->
	<div id="write_cover">
		<div class="replace_name">
			<form action="${pageContext.request.contextPath }/travel/updateTravel.action" method="post" enctype="multipart/form-data">
			      <input type="hidden" name="id" value="${travel.id}"/>
				<div id="div1" class="form-group">
				  
					<label for="name">*标题</label> <input type="text" name="title"
						class="form-control" id="name" placeholder="请输入游记的标题" value="${travel.title}">
					<textarea name="describle1" class="form-control" rows="3"
						placeholder="请输入描述一">${travel.describle1}</textarea>
					<textarea name="describle2" class="form-control" rows="3" 
						placeholder="请输入描述二">${travel.describle2}</textarea>
					<textarea name="describle3" class="form-control" rows="3"  
						placeholder="请输入描述三">${travel.describle3}</textarea>
				</div>
				<div id="div2" class="form-group">
					<label for="inputfile"><img src="images/tip.jpg" /></label>
					<div id="pic">
						<table class="table table-bordered table-hover">
							<tr class="active">
								<td><a class="input-file input-fileup1" href="javascript:;">
										+ 选择文件<input size="100" type="file" name="file" id="file">
								</a>
									<div class="fileerrorTip1"></div>
									<div class="showFileName1"></div></td>
								<td>风景一：
									<div id="pic1">
										<c:if test="${travel.pic1!=null}">
											<img src="/pic/${travel.pic1}" />
										</c:if>

									</div>
								</td>
							</tr>
							<tr class="success">
								<td><a class="input-file input-fileup2" href="javascript:;">
										+ 选择文件<input size="100" type="file" name="file" id="file">
								</a>
									<div class="fileerrorTip2"></div>
									<div class="showFileName2"></div></td>
								<td>风景二：
									<div id="pic2">
										<c:if test="${travel.pic2!=null}">
											<img src="/pic/${travel.pic2}" />
										</c:if>
									</div>
								</td>
							</tr>
							<tr class="warning">
								<td><a class="input-file input-fileup3" href="javascript:;">
										+ 选择文件<input size="100" type="file" name="file" id="file">
								</a>
									<div class="fileerrorTip3"></div>
									<div class="showFileName3"></div></td>
								<td>风景三：
									<div id="pic3">
										<c:if test="${travel.pic3!=null}">
											<img src="/pic/${travel.pic3}" />
										</c:if>
									</div>
								</td>
							</tr>
						</table>
		
					</div>
				</div>
				<div class="clear"></div>
				<!-- ---------------发布按钮-------------- -->
				<div id="write_button">
					<a class="exit" href="#">退出</a> <input type="submit"
						class="express" value="发表" />
					<div class="clear"></div>
				</div>
			</form>
		</div>
	</div>
	<div class="clear"></div>
	<%@ include file="/WEB-INF/jsp/my_commons/mfoot.jsp"%>
</body>
</html>