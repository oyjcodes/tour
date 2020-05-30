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
<title>风景模块</title>

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
			<!-- 	<form action="/Article/checkAll" method="post"> -->
			<h1 class="page-header">景区管理</h1>
			<div class="table-responsive">
				<table class="table table-hover">
					<caption>景区列表</caption>
					<thead>
						<tr>
							<th style="width:50px;">选择</th>
							<th style="width:50px;">编号</th>
							<th>景点名称</th>
							<th style="width:50px;">状态</th>
							<th>地址</th>
							<th>图片</th>
							<th>价格</th>
							<th>开放时间</th>
							<th>电话</th>
							<th>操作</th>
						</tr>
					</thead>

					<tbody id="load">
						<c:forEach items="${pageInfo.list}" var="scenicVo" varStatus="id">
							<tr>
								<td><input type="checkbox" class="input-control"
									name="checkbox[]" value="${scenicVo.scenicid}" /></td>
								<td class="article-title">${scenicVo.scenicid}</td>
								<td>${scenicVo.name}</td>
								<td><c:if test="${scenicVo.stage eq 0}">
										<font color="orange">下架</font>
									</c:if> <c:if test="${scenicVo.stage eq 1}">
									                    上架
									    </c:if></td>
								<td>${scenicVo.scenicaddress}</td>
								<td><div style="width: 50px; heigth: 50px;" class="pdiv">
										<img style="width: 100%; heigth: 100%;" class="pic"
											src="/pic/${scenicVo.pic1}" />
									</div></td>
								<td>${scenicVo.cost}</td>
								<td>${scenicVo.time}</td>
								<td>${scenicVo.tel}</td>
								<td style="display: none">${scenicVo.video}</td>
								<td style="display: none">${scenicVo.scenicnum}</td>
								<td style="display: none">${scenicVo.title1}</td>
								<td style="display: none">${scenicVo.describle}</td>
								<td style="display: none">${scenicVo.category}</td>
								<td style="display: none">/pic/${scenicVo.pic1}</td>
								<td style="display: none">/pic/${scenicVo.pic2}</td>
								<td style="display: none">/pic/${scenicVo.pic3}</td>
								<td style="display: none">${scenicVo.stage}</td>
								<td style="display: none">${scenicVo.pic1}</td>
								<td style="width: 250px;">
								<button type="button" class="btn btn-info" data-toggle="modal"
										data-target="#publishScenic" name="publish">发布</button>   
									<button type="button" class="btn btn-info" data-toggle="modal"
										data-target="#myModal" name="edit">修改</button> <a
									href="${pageContext.request.contextPath}/backScenic/downScenic?id=${scenicVo.scenicid}"><button
											type="button" class="btn btn-warning">下架</button></a> <a
									href="${pageContext.request.contextPath}/backScenic/upScenic?id=${scenicVo.scenicid}"><button
											type="button" class="btn  btn-default">上架</button></a>
								</td>
							</tr>


						</c:forEach>

					</tbody>

				</table>
			</div>


			<footer class="message_footer">
				<nav>
					<div class="btn-toolbar operation" role="toolbar" id="btndiv1"
						style="position: absolute; left: 50px; top: 500px;">
						<div class="btn-group" role="group">
							<a class="btn btn-default" onClick="select()">全选</a> <a
								class="btn btn-default" onClick="reverse()">反选</a> <a
								class="btn btn-default" onClick="noselect()">不选</a>
						</div>
						<div class="btn-group" role="group">
							<button type="submit" class="btn btn-default" id="delete"
								data-toggle="tooltip" data-placement="bottom" title="删除全部选中"
								name="checkbox_delete">删除</button>
						</div>
					</div>
					<ul class="pagination pagenav"
						style="position: absolute; right: 70px; top: 500px;">
						<li><a
							href="${pageContext.request.contextPath}/backScenic/requestAllScenics?page=${pageInfo.prePage}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach var="i" begin="1" end="${pageUtils.pageNum}"
							varStatus="status">

							<c:choose>
								<c:when test="${pageUtils.currentPageNum==i}">
									<li class="active"><a
										href="${pageContext.request.contextPath}/backScenic/requestAllScenics?page=${status.index}">${status.index}</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/backScenic/requestAllScenics?page=${status.index}">${status.index}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<!-- <li class="active"><a>1</a></li> -->
						<li><a
							href="${pageContext.request.contextPath}/backScenic/requestAllScenics?page=${pageInfo.nextPage}"
							aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</ul>
				</nav>
			</footer>
			</form>
		</div>
	</section>

	<div>
		<!-- 模态框 （Modal）修改景点 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: 1000px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">修改景点信息</h4>
					</div>
					<div class="modal-body">
						<form name="editForm" class="form-horizontal" role="form"
							action="${pageContext.request.contextPath}/backScenic/editScenic.action"
							method="post" enctype="multipart/form-data">
							<!-- 模态框左侧部分 -->
							<input type="hidden" name="scenicid" id="scenicid" />
							<div style="float: left; width: 50%;">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">景点名称</label>
									<div class="col-sm-7">
										<input type="text" value="" class="form-control" id="name"
											name="name" placeholder="请输入景点名称">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">地址</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" id="scenicaddress"
											name="scenicaddress" placeholder="请输入景点地址">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">城市区域</label>

									<div class="col-sm-7">
										<select name="scenicnum" id="scenicnum">
											<option value="1101">南昌</option>
											<option value="1102">九江</option>
											<option value="1103">赣州</option>
											<option value="1104">上饶</option>
											<option value="1105">宜春</option>
											<option value="1106">吉安</option>
											<option value="1107">抚州</option>
											<option value="1108">鹰潭</option>
											<option value="1109">萍乡</option>
											<option value="1110">新余</option>
											<option value="1111">景德镇</option>
										</select>
									</div>

								</div>
								<div class="form-group" style="width: 50%; float: left;">
									<label for="lastname" class="col-sm-5 control-label">景区类型</label>
									<div>

										<select name="category" id="category">
											<option value="1">红色景点</option>
											<option value="0">一般景点</option>

										</select>
									</div>
								</div>
								<div class="form-group" style="width: 50%; float: left;">
									<label for="lastname" class="col-sm-5 control-label">景区状态</label>
									<div>
										<select name="stage" id="stage">
											<option value="1">上架</option>
											<option value="0">下架</option>

										</select>
									</div>
								</div>
								<div style="clear: both;"></div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">票价</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" id="cost" name="cost"
											placeholder="请输入景点票价">
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">景点描述</label>
									<div class="col-sm-9">
										<textarea rows="7" class="form-control" id="describle"
											name="describle" placeholder="请输入景点描述"></textarea>
									</div>
								</div>

							</div>

							<!-- 模态框右侧部分 -->
							<div style="float: left; width: 50%;">

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">标题介绍</label>
									<div class="col-sm-8">
										<textarea rows="4" class="form-control" id="title1"
											name="title1" placeholder="请输入标题介绍"></textarea>
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">开放时间</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="time" name="time"
											placeholder="开放时间">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">电话</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" id="tel" name="tel"
											placeholder="电话">
									</div>
								</div>

								<div class="form-group">
									<label for="pic1" class="col-sm-2 control-label">图片一</label>
									<div class="col-sm-5" style="float: left;">
										<input type="file" name="file" class="form-control" id="pic1"
											name="pic1" placeholder="图片一">

									</div>
									<div style="float: left; width: 50px; heigth: 50px;">
										<img id="pic1" style="width: 100%; heigth: 100%;" class="pic"
											src="" />
									</div>
								</div>
								<div class="form-group">
									<label for="pic1" class="col-sm-2 control-label">图片二</label>
									<div class="col-sm-5" style="float: left;">
										<input type="file" name="file" class="form-control" id="pic2"
											name="pic2" placeholder="图片二">

									</div>
									<div style="float: left; width: 50px; heigth: 50px;">
										<img id="pic2" style="width: 100%; heigth: 100%;" class="pic"
											src="" />
									</div>
								</div>

								<div class="form-group">
									<label for="pic1" class="col-sm-2 control-label">图片三</label>
									<div class="col-sm-5" style="float: left;">
										<input type="file" name="file" class="form-control" id="pic3"
											name="pic3" placeholder="图片三">

									</div>
									<div style="float: left; width: 50px; heigth: 50px;">
										<img id="pic3" style="width: 100%; heigth: 100%;" class="pic"
											src="" />
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">视频地址</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="video"
											name="video" placeholder="请输入视频地址">
									</div>
								</div>
								</div>
						</form>
					</div>
					<div class="modal-footer" style="text-align: center"
						style="height:50px">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button onclick="editForm.submit();" type="button"
							class="btn btn-primary">提交更改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</div>

	<div>
		<!-- 模态框 （Modal）增加景点 -->
		<div class="modal fade" id="addScenicModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: 1000px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">修改景点信息</h4>
					</div>
					<div class="modal-body">
						<form name="addForm" class="form-horizontal" role="form"
							action="${pageContext.request.contextPath}/backScenic/addScenic.action"
							method="post" enctype="multipart/form-data">
							<!-- 模态框左侧部分 -->
							<input type="hidden" name="scenicid" id="scenicid" />
							<div style="float: left; width: 50%;">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">景点名称</label>
									<div class="col-sm-7">
										<input type="text" value="" class="form-control" id="name"
											name="name" placeholder="请输入景点名称">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">地址</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" id="scenicaddress"
											name="scenicaddress" placeholder="请输入景点地址">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">城市区域</label>

									<div class="col-sm-7">
										<select name="scenicnum" id="scenicnum">
											<option value="1101">南昌</option>
											<option value="1102">九江</option>
											<option value="1103">赣州</option>
											<option value="1104">上饶</option>
											<option value="1105">宜春</option>
											<option value="1106">吉安</option>
											<option value="1107">抚州</option>
											<option value="1108">鹰潭</option>
											<option value="1109">萍乡</option>
											<option value="1110">新余</option>
											<option value="1111">景德镇</option>
										</select>
									</div>

								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">景区类型</label>
									<div class="col-sm-7">

										<select name="category" id="category">
											<option value="1">红色景点</option>
											<option value="0">一般景点</option>

										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">票价</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" id="cost" name="cost"
											placeholder="请输入景点票价">
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">景点描述</label>
									<div class="col-sm-9">
										<textarea rows="7" class="form-control" id="describle"
											name="describle" placeholder="请输入景点描述"></textarea>
									</div>
								</div>

							</div>

							<!-- 模态框右侧部分 -->
							<div style="float: left; width: 50%;">

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">标题介绍</label>
									<div class="col-sm-8">
										<textarea rows="4" class="form-control" id="title1"
											name="title1" placeholder="请输入标题介绍"></textarea>
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">开放时间</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="time" name="time"
											placeholder="开放时间">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">电话</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" id="tel" name="tel"
											placeholder="电话">
									</div>
								</div>

								<div class="form-group">
									<label for="pic1" class="col-sm-2 control-label">图片一</label>
									<div class="col-sm-5" style="float: left;">
										<input type="file" name="file" class="form-control" id="pic1"
											name="pic1" placeholder="图片一">

									</div>
									<div style="float: left; width: 50px; heigth: 50px;">
										<!-- <img style="width: 100%; heigth: 100%;"  src=""/> -->
									</div>
								</div>
								<div class="form-group">
									<label for="pic1" class="col-sm-2 control-label">图片二</label>
									<div class="col-sm-5" style="float: left;">
										<input type="file" name="file" class="form-control" id="pic2"
											name="pic2" placeholder="图片二">

									</div>
									<div style="float: left; width: 50px; heigth: 50px;">
										<!-- <img style="width: 100%; heigth: 100%;"  src=""/> -->
									</div>
								</div>

								<div class="form-group">
									<label for="pic1" class="col-sm-2 control-label">图片三</label>
									<div class="col-sm-5" style="float: left;">
										<input type="file" name="file" class="form-control" id="pic3"
											name="pic3" placeholder="图片三">

									</div>
									<div style="float: left; width: 50px; heigth: 50px;">
										<!-- <img style="width: 100%; heigth: 100%;"  src=""/> -->
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">视频地址</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="video"
											name="video" placeholder="请输入视频地址">
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer" style="text-align: center"
						style="height:50px">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button onclick="addForm.submit();" type="button"
							class="btn btn-primary">增加景点</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</div>




<!-- 模态框 （Modal）发布景点信息到前台首页 -->
<div class="modal fade" id="publishScenic" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 800px;">
        <div class="modal-content">
            <div class="modal-header">
               
                <h4 class="modal-title" id="myModalLabel">发布景点信息</h4>
            </div>
            
            <!--   添加主体 开始--> 
            <div class="modal-body" style="top:15px;">    
               <form name="publishForm" class="form-horizontal" role="form"
							action="${pageContext.request.contextPath}/backScenic/publishScenic.action"  
							method="post" enctype="multipart/form-data">
							<!-- 模态框左侧部分 -->   
							<input type="hidden" name="contentid" id="contentid" />
							<input type="hidden" name="pic" id="pic" />
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">标题</label>
									<div class="col-sm-7">
										<input type="text" value="" class="form-control" id="title"
											name="title" placeholder="请输入标题">
									</div>
								</div>
									<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">区域</label>

									<div class="col-sm-7">
										<select name="areanum" id="areanum">
											<option value="1101">南昌</option>
											<option value="1102">九江</option>
											<option value="1103">赣州</option>
											<option value="1104">上饶</option>
											<option value="1105">宜春</option>
											<option value="1106">吉安</option>
											<option value="1107">抚州</option>
											<option value="1108">鹰潭</option>
											<option value="1109">萍乡</option>
											<option value="1110">新余</option>
											<option value="1111">景德镇</option>
										</select>
									</div>

								</div>
								
								
	
							<div class="form-group">
								<label class="col-sm-2 control-label">资讯状态</label>
								<div class="col-sm-4">
									<select name="stage" id="stage">
										<option value="1">上架</option>
										<option value="0">下架</option>

									</select>
								</div>
							</div>
								<div class="form-group">
									<label for="pic1" class="col-sm-2 control-label">图片</label>
									 
									<div style="float: left; width: 150px; heigth: 150px;">
										<img id="pic" style="width: 100%; heigth: 100%;" class="pic"
											src="" />
									</div>
								</div>
								 
						</form>
            </div>
            <!--   添加主体结束 -->
             
             
             <!--    开始按钮 -->
            <div class="modal-footer"  style="text-align: center" style="height:50px">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button onclick="publishForm.submit();" type="button"class="btn btn-primary">景点发布</button>  
            </div>
            <!--    结束按钮 -->  
            
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
    </div>





	<script>  
		//取页面的值传给模态框
		$(function() {
			
			
			
			
			$("Button[name='publish']").each(
					function() {
						$(this).click(
								function() {
									var contentid = $(this).parent().parent()
											.children().eq(1).text();
									var title = $(this).parent().parent()
											.children().eq(2).text();
									 

									 
									var areanum = $(this).parent().parent()
											.children().eq(10).text();
								 
									 
								 

									var pic = $(this).parent().parent()
											.children().eq(14).text();
								 
									var stage = $(this).parent().parent()
											.children().eq(17).text();
									var path = $(this).parent().parent()
									.children().eq(18).text();

									$("#contentid").val(contentid);
									$("#title").val(title);
									$("#pic").val(path);
							 
									$("select#areanum").val(areanum);
									$("select#stage").val(stage);
									$("img#pic").attr("src", pic);
									 
								})

					});			
			
			
			
			
			
			
			
			
			
			
			$("Button[name='edit']").each(
					function() {
						$(this).click(
								function() {
									var scenicid = $(this).parent().parent()
											.children().eq(1).text();
									var name = $(this).parent().parent()
											.children().eq(2).text();
									var scenicaddress = $(this).parent()
											.parent().children().eq(4).text();
									var cost = $(this).parent().parent()
											.children().eq(6).text();
									var time = $(this).parent().parent()
											.children().eq(7).text();
									var tel = $(this).parent().parent()
											.children().eq(8).text();

									var video = $(this).parent().parent()
											.children().eq(9).text();
									var scenicnum = $(this).parent().parent()
											.children().eq(10).text();
									var title1 = $(this).parent().parent()
											.children().eq(11).text();
									var describle = $(this).parent().parent()
											.children().eq(12).text();
									var category = $(this).parent().parent()
											.children().eq(13).text();

									var pic1 = $(this).parent().parent()
											.children().eq(14).text();
									var pic2 = $(this).parent().parent()
											.children().eq(15).text();
									var pic3 = $(this).parent().parent()
											.children().eq(16).text();
									var stage = $(this).parent().parent()
											.children().eq(17).text();

									$("#scenicid").val(scenicid);
									$("#name").val(name);
									$("#scenicaddress").val(scenicaddress);
									$("#cost").val(cost);
									$("#time").val(time);
									$("#tel").val(tel);
									$("#describle").val(describle);
									$("#title1").val(title1);
									$("#video").val(video);
									$("select#scenicnum").val(scenicnum);
									$("select#category").val(category);
									$("select#stage").val(stage);
									$("img#pic1").attr("src", pic1);
									$("img#pic2").attr("src", pic2);
									$("img#pic3").attr("src", pic3);
								})

					});
		})

		//是否确认删除
		$(function() {

			$("#delete")
					.click(
							function() {
								var ids = [];
								var get = $(".input-control");
								for (i = 0; i < get.length; i++) {
									if (get[i].checked) {
										ids.push(get[i].value);

									}
								}
								$
										.ajax({
											type : 'post',
											url : '${pageContext.request.contextPath}/backScenic/downSomeScenics.action',
											data : 'ids=' + ids + '',
											success : function(data) {//返回json结果 
												var html = '';
												$.each(data,function(i,scenicVo) {
																	var s = '';
																	if (scenicVo.stage == 0) {
																		s = '<font color="orange">已下架</font>';
																	} else {
																		s = "上架";
																	}

																	html += '<tr>'
																			+ '<td><input type="checkbox" class="input-control" name="checkbox[]" value="'+scenicVo.scenicid+'" /></td>'
																			+ '<td class="article-title">'
																			+ scenicVo.scenicid
																			+ '</td>'
																			+ '<td>'
																			+ scenicVo.name
																			+ '</td>'
																			+ '<td>'
																			+ s
																			+ '</td>'
																			+ '<td>'
																			+ scenicVo.scenicaddress
																			+ '</td>'
																			+ '<td><div style="width: 50px; heigth: 50px;" class="pdiv">'
																			+ '<img style="width: 100%; heigth: 100%;" class="pic" src="/pic/'
																			+ scenicVo.pic1
																			+ '" /></div></td>'
																			+ '<td>'
																			+ scenicVo.cost
																			+ '</td>'
																			+ '<td>'
																			+ scenicVo.time
																			+ '</td>'
																			+ '<td>'
																			+ scenicVo.tel
																			+ '</td>'
																			+ '<td style="display: none">'
																			+ scenicVo.video
																			+ '</td>'
																			+ '<td style="display: none">'
																			+ scenicVo.scenicnum
																			+ '</td>'
																			+ '<td style="display: none">'
																			+ scenicVo.title1
																			+ '/td>'
																			+ '<td style="display: none">'
																			+ scenicVo.describle
																			+ '</td>'
																			+ '<td style="display: none">'
																			+ scenicVo.category
																			+ '</td>'
																			+ '<td style="display: none">/pic/'
																			+ scenicVo.pic1
																			+ '</td>'
																			+ '<td style="display: none">/pic/'
																			+ scenicVo.pic2
																			+ '</td>'
																			+ '<td style="display: none">/pic/'
																			+ scenicVo.pic3
																			+ '</td>'
																			+ '<td style="display: none">'
																			+ scenicVo.stage
																			+ '</td>'
																			+ '<td style="width: 188px;">'
																			+ '<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" name="edit">修改</button>'
																			+ '<a href="${pageContext.request.contextPath}/backScenic/downScenic?id='
																			+ scenicVo.scenicid
																			+ '">'
																			+ '<button type="button" class="btn btn-warning">下架</button></a>'
																			+ '<a href="${pageContext.request.contextPath}/backScenic/upScenic?id='
																			+ scenicVo.scenicid
																			+ '">'
																			+ '<button type="button" class="btn  btn-default">上架</button></a>'
																			+ '</td>'
																			+ '</tr>'
																	$("#load")
																			.empty()
																});
												$("#load").html(html);
											}
										});

							});

		});

		//点击左侧菜单【查询景点】调用ajax请求刷新scenic.jsp的景区模块
		/* $(function() {
		 $.ajax({
		 type : 'post',
		 url :  '${pageContext.request.contextPath}/backScenic/requestAllScenics.action', 
		 success : function(data) {//返回json结果 
		 var html = '';
		 $.each(data, function(i, item) {
		 alert(item.name);        
		 });   
		 }

		 });
		 });  */
	</script>
</body>
</html>