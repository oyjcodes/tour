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
<title>特产美景发布模块</title>

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
			<h1 class="page-header">特产美景管理</h1>
			<div class="table-responsive">
				<table class="table table-hover">
					<caption>发布列表</caption>
					<thead>
						<tr>
							<th>编号</th>
							<th>标题</th>
							<th>区域</th>
							<th>类别</th>
							<th>图片</th>
							<th>发布时间</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>

					<tbody id="load">
						<c:forEach items="${pageInfo.list}" var="item" varStatus="id">
							<tr>
								<td class="article-title">${item.cid}</td>
								<td>${item.title}</td>
								<td>${item.areaName}</td>
								<td>
								    <c:if test="${item.categoryid eq 0}">
										<font color="orange">美景</font>
									</c:if> 
									<c:if test="${item.categoryid eq 1}">
									    <font color="blue">特产</font>  
									</c:if>
							    </td>
								<td><div style="width: 50px; heigth: 50px;" class="pdiv">
										<img style="width: 100%; heigth: 100%;" class="pic"
											src="/pic/${item.pic}" />
									</div></td>
								<td><fmt:formatDate value="${item.created}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><c:if test="${item.stage eq 0}">
										<font color="orange">下架</font>
									</c:if> <c:if test="${item.stage eq 1}">
									                    上架
									</c:if></td>

								<td style="display: none">${item.contentid}</td>
								<td style="display: none">${item.areanum}</td>
								<td style="display: none">${item.categoryid}</td>
								<td style="display: none">${item.stage}</td>
								<td style="display: none">/pic/${item.pic}</td>
								 
								<td style="width: 188px;">
									<button type="button" class="btn btn-info" data-toggle="modal"
										data-target="#myModal" name="edit">修改</button> <a
									href="${pageContext.request.contextPath}/backContent/downPublishContent?cid=${item.cid}&categoryid=${item.categoryid}"><button
											type="button" class="btn btn-warning">下架</button></a> <a
									href="${pageContext.request.contextPath}/backContent/upPublishContent?cid=${item.cid}&categoryid=${item.categoryid}"><button
											type="button" class="btn  btn-default">上架</button></a>
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
							href="${pageContext.request.contextPath}/backContent/getPublishContent?page=${pageInfo.prePage}&categoryid=${pageInfo.list[0].categoryid}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach var="i" begin="1" end="${pageInfo.pages}"
							varStatus="status">

							<c:choose>
								<c:when test="${pageUtils.currentPageNum==i}">
									<li class="active"><a
										href="${pageContext.request.contextPath}/backContent/getPublishContent?page=${status.index}&categoryid=${pageInfo.list[0].categoryid}">${status.index}</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/backContent/getPublishContent?page=${status.index}&categoryid=${pageInfo.list[0].categoryid}">${status.index}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<li><a
							href="${pageContext.request.contextPath}/backContent/getPublishContent?page=${pageInfo.nextPage}&categoryid=${pageInfo.list[0].categoryid}"
							aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</ul>
				</nav>
			</footer>
			</form>
		</div>
	</section>


<!-- 模态框 （Modal）修改发布的特产或风景的信息 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 800px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">修改特产及风景的信息</h4>
				</div>
				<div class="modal-body" style="top:15px;">
					<form name="editForm" class="form-horizontal" role="form"
						action="${pageContext.request.contextPath}/backContent/editContent.action"
						method="post" enctype="multipart/form-data">
						<!-- 模态框左侧部分 -->
						<input type="hidden" name="cid" id="cid" />
						<input type="hidden" name="contentid" id="contentid" />
						 
							<div class="form-group">
								<label for="firstname" class="col-sm-2 control-label">发布标题</label>
								<div class="col-sm-7">
									<input type="text" value="" class="form-control" id="title"
										name="title" placeholder="请输入发布的标题名称">
								</div>
							</div>
							
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">所在地</label>

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
								<label for="lastname" class="col-sm-2 control-label">发布状态</label>
								<div class="col-sm-7">
									<select name="stage" id="stage">
										<option value="1">上架</option>
										<option value="0">下架</option>

									</select>
								</div>
							</div>
							
							 <div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">信息类别</label>
								<div class="col-sm-7">
									<select name="categoryid" id="categoryid">  
										<option value="1">特产</option>
										<option value="0">美景</option>

									</select>
								</div>
							</div>
							  
							 
                   
							<div class="form-group">
								<label for="pic1" class="col-sm-2 control-label">图片一</label>
								<div class="col-sm-5">
									<input type="file" name="file" class="form-control" id="tpic"
										name="tpic" placeholder="图片一">

								</div>
								<div style="float: left; width: 50px; heigth: 50px;">
									<img id="pic" style="width: 100%; heigth: 100%;" class="pic"
										src="" />
								</div>
							</div>
					</form>
				</div>
				<div class="modal-footer" style="text-align: center"
					style="height:70px">
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

	
	<script>
		//取页面的值传给模态框
		$(function() {
			$("Button[name='edit']").each(
					function() {
						$(this).click(
								function() {
									var cid = $(this).parent().parent()
											.children().eq(0).text();
									var title = $(this).parent().parent()
											.children().eq(1).text();
									var areaName = $(this).parent().parent()
											.children().eq(2).text();
									var created = $(this).parent().parent()
											.children().eq(5).text();
									var contentid = $(this).parent().parent()
											.children().eq(7).text();
									var areanum = $(this).parent().parent()
									.children().eq(8).text();
									var categoryid = $(this).parent().parent()
									.children().eq(9).text();
									var stage = $(this).parent().parent()
									.children().eq(10).text();
									var pic = $(this).parent().parent()
									.children().eq(11).text();
									 

									 

									$("#cid").val(cid);
									$("#title").val(title);
									$("#areaName").val(areaName);
									$("#created").val(created);
									$("#contentid").val(contentid);
									 
									$("select#categoryid").val(categoryid);
									$("select#areanum").val(areanum);
									$("select#stage").val(stage);
									$("img#pic").attr("src", pic);
									 

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
										alert(ids[i])
									}
								}
								$
										.ajax({
											type : 'post',
											url : '${pageContext.request.contextPath}/backScenic/downSomeScenics.action',
											data : 'ids=' + ids + '',
											success : function(data) {//返回json结果 
												var html = '';
												$
														.each(
																data,
																function(i,
																		scenicVo) {
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
	</script>
</body>
</html>