<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广告模块</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<!-- <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"> -->
<link rel="apple-touch-icon-precomposed" href="images/t_logo.jpg">
<link rel="shortcut icon" href="images/t_logo.jpg">
<script src="js/jquery-2.1.4.min.js"></script>
<script src="js/admin-scripts.js"></script>

</head>
<body class="user-select">
	<section class="container-fluid">

		<!--头部-->
		<%@ include file="/WEB-INF/jsp/admin/common/head.jsp"%>
		<!--头部-->


		<!-- 左边的菜单 -->
		<%@ include file="/WEB-INF/jsp/admin/common/menu.jsp"%>
		<!-- 左边的菜单 -->

		<!-- 右边主区域 -->
		<div
			class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main"
			id="main">
			<h1 class="page-header">广告管理</h1>
			<div class="table-responsive">
				<table class="table table-hover">
					<caption><button type="button" class="btn btn-default"><a data-toggle="modal" data-target="#addAdsModal">发布广告</a></button> </caption>
					<thead>
						<tr>
							<th>编号</th>
							<th>广告标题</th>
							<th>子标题</th>
							<th>图片</th>
							<th>发布时间</th>
							<th>状态</th>
							<th>操作</th>       
						</tr>
					</thead>

					<tbody id="load">
						<c:forEach items="${pageInfo.list}" var="item" varStatus="id">
							<tr>
								<td class="article-title">${item.id}</td>
								<td>${item.title}</td>
								<td>${item.subtitle}</td>
								<td><div style="width: 50px; heigth: 50px;" class="pdiv">
										<img style="width: 100%; heigth: 100%;" class="pic"
											src="/pic/${item.pic}" />
									</div></td>
								<td><font color="blue"><fmt:formatDate value="${item.ptime}" pattern="yyyy-MM-dd HH:mm:ss" /></font></td>
								<td><c:if test="${item.stage eq 0}">
										<font color="orange">下架</font>
									</c:if> <c:if test="${item.stage eq 1}">
									                    上架
							          </c:if></td>
				
								<td style="display: none">/pic/${item.pic}</td>
								<td style="display: none">${item.stage}</td>
								<td style="display: none">${item.describle}</td>
								<td style="width: 188px;">
									<button type="button" class="btn btn-info" data-toggle="modal"
										data-target="#editModal" name="edit">修改</button>
								 <a href="${pageContext.request.contextPath}/backAds/downAds?id=${item.id}">
										<button type="button" class="btn btn-warning">下架</button>
								</a> <a
									href="${pageContext.request.contextPath}/backAds/upAds?id=${item.id}">
										<button type="button" class="btn  btn-default">上架</button>
								</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>


			<footer class="message_footer">
				<nav>
					<ul class="pagination pagenav"
						style="position: absolute; right: 70px; top: 500px;">
						<li><a
							href="${pageContext.request.contextPath}/backAds/requestAllAds?page=${pageInfo.prePage}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach var="i" begin="1" end="${pageInfo.pages}"
							varStatus="status">

							<c:choose>
								<c:when test="${pageUtils.currentPageNum==i}">
									<li class="active"><a
										href="${pageContext.request.contextPath}/backAds/requestAllAds?page=${status.index}">${status.index}</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/backAds/requestAllAds?page=${status.index}">${status.index}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<li><a
							href="${pageContext.request.contextPath}/backAds/requestAllAds?page=${pageInfo.nextPage}"
							aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</ul>
				</nav>
			</footer>
		</div>
	</section>

<!-- 模态框 （Modal）修改广告 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1000px;">
        <div class="modal-content">
            <div class="modal-header">
               
                <h4 class="modal-title" id="myModalLabel">广告信息修改</h4>
            </div>
            
            <!--   添加主体 开始--> 
            <div class="modal-body" style="top:15px;">    
               <form name="editAdsForm" class="form-horizontal" role="form"
							action="${pageContext.request.contextPath}/backAds/editAds.action"
							method="post" enctype="multipart/form-data">
							<!-- 模态框左侧部分 -->   
							<input type="hidden" name="id" id="id" />
							<div style="float: left; width: 50%;">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">标题</label>
									<div class="col-sm-7">
										<input type="text" value="" class="form-control" id="title"
											name="title" placeholder="请输入标题">
									</div>
								</div>
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">子标题</label>
									<div class="col-sm-7">
										<input type="text" value="" class="form-control" id="subtitle"
											name="subtitle" placeholder="请输入子标题">
									</div>
								</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">广告状态</label>
								<div class="col-sm-4">
									<select name="stage" id="stage">
										<option value="1">上架</option>
										<option value="0">下架</option>

									</select>
								</div>
							</div>

						</div>
							<!-- 模态框右侧部分 -->
							<div style="float: left; width: 50%;">
								<div class="form-group">
									<label for="pic1" class="col-sm-2 control-label">图片</label>
									<div class="col-sm-5" style="float: left;">
										<input type="file" name="file" class="form-control" id="pic"
											name="pic" placeholder="图片一">

									</div>
									<div style="float: left; width: 50px; heigth: 50px;">
										<img id="pic" style="width: 100%; heigth: 100%;" class="pic"
											src="" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">内容描述</label>
									<div class="col-sm-9">
										<textarea rows="7" class="form-control" id="describle"
											name="describle" placeholder="请输入广告内容描述"></textarea>
									</div>  
								</div>
								

							</div>
						</form>
            </div>
            <!--   添加主体结束 -->
             
             
             <!--    开始按钮 -->
            <div class="modal-footer"  style="text-align: center" style="height:50px">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button onclick="editAdsForm.submit();" type="button"class="btn btn-primary">提交更改</button>  
            </div>
            <!--    结束按钮 -->  
            
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>



<!-- 新增广告信息 -->
<div class="modal fade" id="addAdsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1000px;">
        <div class="modal-content">
            <div class="modal-header">
               
                <h4 class="modal-title" id="myModalLabel">广告信息修改</h4>
            </div>
            
            <!--   添加主体 开始-->
            <div class="modal-body" style="top:15px;"> 
               <form name="editForm" class="form-horizontal" role="form"
							action="${pageContext.request.contextPath}/backAds/addAds.action"
							method="post" enctype="multipart/form-data">
							<!-- 模态框左侧部分 -->
							<input type="hidden" name="id" id="id" />
							<div style="float: left; width: 50%;">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">标题</label>
									<div class="col-sm-7">
										<input type="text" value="" class="form-control" id="title"
											name="title" placeholder="请输入标题">
									</div>
								</div>
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">子标题</label>
									<div class="col-sm-7">
										<input type="text" value="" class="form-control" id="subtitle"
											name="subtitle" placeholder="请输入子标题">
									</div>
								</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">广告状态</label>
								<div class="col-sm-4">
									<select name="stage" id="stage">
										<option value="1">上架</option>
										<option value="0">下架</option>

									</select>
								</div>
							</div>

						</div>
							<!-- 模态框右侧部分 -->
							<div style="float: left; width: 50%;">
								<div class="form-group">
									<label for="pic1" class="col-sm-2 control-label">图片</label>
									<div class="col-sm-5" style="float: left;">
										<input type="file" name="file" class="form-control" id="pic"
											name="pic" placeholder="图片一">

									</div>
									 
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">内容描述</label>
									<div class="col-sm-9">
										<textarea rows="7" class="form-control" id="describle"
											name="describle" placeholder="请输入广告内容描述"></textarea>
									</div>
								</div>
								

							</div>
						</form>
            </div>
            <!--   添加主体结束 -->
             
             
             <!--    开始按钮 -->
            <div class="modal-footer"  style="text-align: center" style="height:50px">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button onclick="editForm.submit();" type="button"class="btn btn-primary">提交更改</button>
            </div>
            <!--    结束按钮 -->
            
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
	<script>
		//取页面的值传给模态框
		$(function() {
			$("Button[name='edit']").each(
					function() {
						$(this).click(
								function() {
									var id = $(this).parent().parent()
											.children().eq(0).text();
									var title = $(this).parent().parent()
											.children().eq(1).text();
									var subtitle = $(this).parent().parent()
											.children().eq(2).text();
									var ptime = $(this).parent().parent()
											.children().eq(4).text();
									var pic = $(this).parent().parent()
											.children().eq(6).text();
		

									var stage = $(this).parent().parent()
											.children().eq(7).text();
				
									var describle = $(this).parent().parent()
											.children().eq(8).text();

									$("#id").val(id);
									$("#title").val(title);
									$("#subtitle").val(subtitle);
									$("#ptime").val(ptime);
	
									$("#describle").val(describle);
									$("select#stage").val(stage);
									$("img#pic").attr("src", pic);  

								})

					});
		})
	</script>
</body>
</html>