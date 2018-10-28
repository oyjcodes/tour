<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<head>
    <title>修改密码</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<!-------------Amazeui--------------->
    <script type="text/javascript" src="js/amazeui.js"></script>
    <link rel="stylesheet" type="text/css" href="css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="css/user.css">    
</head>
<body>

<!-------------------版头------------------->
  <%@include file="/WEB-INF/jsp/my_commons/mhead.jsp"%>
<!-----------------框架---------------->
<div class="cw1000">
	<div class="w280 fl">
		<div class="public_box">
			<!-----------------设置导航---------------->
			<div id="set_nav">
				<ul>
					<li><a href="${pageContext.request.contextPath}/getUser/my_info"><i class="ico1"></i>我的信息</a></li>
					<li><a href="${pageContext.request.contextPath}/getUser/my_head"><i class="ico2"></i>我的头像</a></li>
					<li><a class="cur" href="${pageContext.request.contextPath}/getUser/security"><i class="ico4"></i>修改密码</a></li>
				</ul>
			</div>
		</div>	
	</div>   
	<div class="w700 fr">
		<div class="public_box">
			<!-----------------修改密码---------------->
			<div id="set_box">
				<div class="title"><h2>修改密码</h2></div>
				<form action="${pageContext.request.contextPath}/getUser/updatePassword" method="post">
				<input type="hidden" name="userid" value="${user.userid}"/>
				<input type="hidden" name="password" value="${user.password}"/>
				<table class="table_list">
					<tr>
						<th>旧密码：</th>
						<td><input class="text" name="password1" type="password" value="" required="required"/>
						</td>
						<td><font color="red">${passwoedError1}</font></td>
					</tr>
					<tr>
						<th>新密码：</th>
						<td><input class="text" name="password2" type="password" value="" required="required"/></td>
						<td><font color="red">${passwoedError2}</font></td>
					</tr> 
					<tr>
						<th>再次输入：</th>    
						<td><input class="text" name="password3" type="password" value="" required="required"/></td>
						<td><font color="red">${passwoedError3}</font></td>
						<td>${success}</td>   
						<c:if test="${not empty success}">
						   <td><a href="${pageContext.request.contextPath}/check/toLogin"><font color="blue">登录</font></a></td>
						</c:if>
					</tr>  
				</table>
				<div class="operation"><input type="submit" class="save" value="保存" /></div>
			</form>
			</div>
		</div>	
	</div>
	<div class="clear"></div>
</div>
<!-----------------版底---------------->
  <%@include file="/WEB-INF/jsp/my_commons/mfoot.jsp"%>
</body>
</html>