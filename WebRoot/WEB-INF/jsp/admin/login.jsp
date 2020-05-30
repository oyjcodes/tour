<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理系统</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
	<link rel="stylesheet" type="text/css" href="css/blogin.css">
</head>
<body>
	<div class="htmleaf-container">
		<header class="htmleaf-header">
			<h1>JX【TOUR】管理系统</h1>
		</header>
		<div class="demo form-bg">
	        <div class="container">
	            <div class="row">
	                <div class="col-md-offset-3 col-md-6">  
	                    <form action="${pageContext.request.contextPath}/backCheck/loginCheck" class="form-horizontal" method="post">
	                        <span class="heading">管理员登录</span>
	               
	                       
	                        <div class="form-group">
	                            <input type="text" name="usernum" class="form-control" id="inputEmail3" placeholder="账号">
	                            <i class="fa fa-user"></i>
	                        </div>
	                        <div class="form-group help">
	                            <input type="password" name="password" class="form-control" id="inputPassword3" placeholder="密码">
	                            <i class="fa fa-lock"></i>
	                            <a href="#" class="fa fa-question-circle"></a>
	                        </div>
	                        <div class="form-group">
	                             
	                            <button type="submit" class="btn btn-default">立刻登录</button>
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>