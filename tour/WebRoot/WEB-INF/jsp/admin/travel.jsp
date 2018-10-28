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
<title>游记模块</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/mystyle.css">
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
			<h1 class="page-header">游记发布管理</h1>
			<div class="table-responsive">
				<table class="table table-hover">
					<caption>特产列表</caption>
					<thead>
						<tr>
							<th>选择</th>
							<th>编号</th>
							<th>用户ID</th>
							<th>标题</th>
							<th>发布时间</th>
							<th>图片一</th>
							<th>图片二</th>
							<th>图片三</th>
							<th>状态</th>
							<th>点赞</th>
							<th>操作</th>
						</tr>
					</thead>

					<tbody id="load">
						<c:forEach items="${pageInfo.list}" var="item" varStatus="id">
							<tr>
								<td><input type="checkbox" class="input-control"
									name="checkbox[]" value="${item.id}" /></td>
								<td class="article-title">${item.id}</td>
								<td>${item.usernum}</td>
								<td>${item.title}</td>
								<td><font color="blue"><fmt:formatDate
											value="${item.ptime}" pattern="yyyy-MM-dd HH:mm:ss" /></font></td>
								<td>
									<div style="width: 50px; heigth: 50px;" class="pdiv">
										<img style="width: 100%; heigth: 100%;" class="pic"
											src="/pic/${item.pic1}" />
									</div>
								</td>
								<td>
									<div style="width: 50px; heigth: 50px;" class="pdiv">
										<img style="width: 100%; heigth: 100%;" class="pic"
											src="/pic/${item.pic2}" />
									</div>
								</td>
								<td>
									<div style="width: 50px; heigth: 50px;" class="pdiv">
										<img style="width: 100%; heigth: 100%;" class="pic"
											src="/pic/${item.pic3}" />
									</div>
								</td>

								<td><c:if test="${item.stage eq 1}">
										<font color="blue">通过</font>
									</c:if> <c:if test="${item.stage eq 0}">
										<font color="red">待审</font>
									</c:if></td>
								<td>${item.readnum}</td>
								<td><button type="button" class="btn btn-info"
										data-toggle="modal" data-target="#myModal" name="edit" id="edit">查看</button>
								</td>
								<td style="width: 188px;">
								<a href="${pageContext.request.contextPath}/backTravel/pass?id=${item.id}">
										<button type="button" class="btn btn-warning">通过</button>
								</a> 
								<a href="${pageContext.request.contextPath}/backTravel/reject?id=${item.id}">     
										<button type="button" class="btn btn-default">不通过</button>  
								</a>
								</td>
								<td style="display: none">${item.describle1}</td>
								<td style="display: none">/pic/${item.pic1}</td>
								<td style="display: none">${item.describle2}</td>
								<td style="display: none">/pic/${item.pic2}</td>
								<td style="display: none">${item.describle3}</td>
								<td style="display: none">/pic/${item.pic3}</td>
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
							<button type="submit" class="btn btn-warning" id="pass"
								data-toggle="tooltip" data-placement="bottom" title="通过全部选中"
								name="checkbox_pass">通过审核</button>
						</div>
					</div>


					<ul class="pagination pagenav"
						style="position: absolute; right: 70px; top: 500px;">
						<li><a
							href="${pageContext.request.contextPath}/backTravle/requestAllTravels?page=${pageInfo.prePage}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach var="i" begin="1" end="${pageInfo.pages}"
							varStatus="status">

							<c:choose>
								<c:when test="${pageUtils.currentPageNum==i}">
									<li class="active"><a
										href="${pageContext.request.contextPath}/backTravel/requestAllTravels?page=${status.index}">${status.index}</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/backTravel/requestAllTravels?page=${status.index}">${status.index}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<li><a
							href="${pageContext.request.contextPath}/backTravel/requestAllTravels?page=${pageInfo.nextPage}"
							aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</ul>
				</nav>
			</footer>
		</div>
	</section>


	<!-- 模态框 （Modal）显示每一项游记的具体信息 -->
	<div>
		<!-- 模态框 （Modal）修改景点 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: 1000px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">游记具体信息</h4>
					</div>
					<div class="modal-body" style="top:15px;">
						<form class="form-horizontal" role="form">
							<!-- 模态框左侧部分 -->
							<div style="float: left; width: 50%;">
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">游记标题</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="title"
											name="title"  readonly>
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">作者编号</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="usernum"
											name="usernum"  readonly>
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">发布时间</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="ptime"
											name="ptime" placeholder="开放时间"  readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">点赞人数</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" id="readnum"
											name="readnum"  readonly>
									</div>
								</div>

								<div class="form-group">
									<label for="pic1" class="col-sm-2 control-label">图片一</label>
									 
									<div style="float: left; width: 130px; heigth: 130px;">
										<img id="pic1" style="width: 100%; heigth: 100%;" class="pic"
											src="" />         
									</div>
								</div>
								<div class="form-group">
									<label for="pic1" class="col-sm-2 control-label">图片二</label>
									 
									<div style="float: left; width: 130px; heigth: 130px;">
										<img id="pic2" style="width: 100%; heigth: 100%;" class="pic"
											src="" />
									</div>
								</div>

								<div class="form-group">
									<label for="pic1" class="col-sm-2 control-label">图片三</label>
									   
									<div style="float: left; width: 130px; heigth: 130px;">  
										<img id="pic3" style="width: 100%; heigth: 100%;" class="pic"
											src="" />
									</div>
								</div>
							</div>

							<!-- 模态框右侧部分 -->
							<div style="float: left; width: 50%;">

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">描述一</label>
									<div class="col-sm-9">
										<textarea rows="7" class="form-control" id="describle1"
											name="describle1" readonly></textarea>
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">描述二</label>
									<div class="col-sm-9">
										<textarea rows="7" class="form-control" id="describle2"
											name="describle2" readonly></textarea>
									</div>
								</div>


								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">描述三</label>
									<div class="col-sm-9">
										<textarea rows="7" class="form-control" id="describle3"
											name="describle3" readonly></textarea>
									</div>
								</div>

							</div>

						</form>
					</div>
					<div class="modal-footer" style="text-align: center"
						style="height:50px">
						<button type="button" class="btn btn-info" data-dismiss="modal">关闭
						</button>
						 
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</div>

</body>
<!-- 获得每一行游记的具体信息 -->
<script>
	//取页面的值传给模态框
	$(function() {
		$("Button[name='edit']").each(function() {    
			$(this).click(function() { 
				var id = $(this).parent().parent().children().eq(1).text();
				var usernum = $(this).parent().parent().children().eq(2).text();
				var title = $(this).parent().parent().children().eq(3).text();
				var ptime = $(this).parent().parent().children().eq(4).text();
				var readnum = $(this).parent().parent().children().eq(9).text();
				var describle1 = $(this).parent().parent().children().eq(12).text();
				var pic1 = $(this).parent().parent().children().eq(13).text();
				var describle2 = $(this).parent().parent().children().eq(14).text();
				var pic2 = $(this).parent().parent().children().eq(15).text();
				var describle3 = $(this).parent().parent().children().eq(16).text();
				var pic3 = $(this).parent().parent().children().eq(17).text();  

				$("#id").val(id);
				$("#usernum").val(usernum);
				$("#title").val(title);
				$("#ptime").val(ptime);
				$("#readnum").val(readnum);
				$("#describle1").val(describle1);
				$("#describle2").val(describle2);
				$("#describle3").val(describle3);

				$("img#pic1").attr("src", pic1);
				$("img#pic2").attr("src", pic2);
				$("img#pic3").attr("src", pic3);

			})

		});
	});
	
	//批量审核通过
	$(function() {
		$("#pass").click(function() {
							var ids = [];
							var get = $(".input-control");
							for (i = 0; i < get.length; i++) {
								if (get[i].checked) {
									ids.push(get[i].value);
									//alert(get[i].value);  
								}
							}
							  $.ajax({
										type : 'post',
										url : '${pageContext.request.contextPath}/backTravel/passSome.action',
										data : 'ids=' + ids + '',
										success : function(data) {//返回json结果 
											var html='';
											$.each(data,function(i,item) {
												var s = '';
												if (item.stage == 0) {
													s = '<font color="orange">待审</font>';
												} else {
													s = '<font color="blue">通过</font>';
												} 
												 var time = new Date(item.ptime) ;
												 commonTime = time.toLocaleString();
												
												html+='<tr>'
													+'<td><input type="checkbox" class="input-control" name="checkbox[]" value="'+item.id+'"/></td>'
													+'<td class="article-title">'+item.id+'</td>'
													+'<td>'+item.usernum+'</td>'
													+'<td>'+item.title+'</td>'
													+'<td>'+commonTime+'</td>'
													+'<td>'
														+'<div style="width: 50px; heigth: 50px;" class="pdiv">'
															+'<img style="width: 100%; heigth: 100%;" class="pic" src="/pic/'+item.pic1+'" />'
														+'</div>'
													+'</td>'
													+'<td>' 
													+'<div style="width: 50px; heigth: 50px;" class="pdiv">'
													+'<img style="width: 100%; heigth: 100%;" class="pic" src="/pic/'+item.pic2+'" />'
													+'</div>'
													+'</td>'
													+'<td>'
													+'<div style="width: 50px; heigth: 50px;" class="pdiv">'
													+'<img style="width: 100%; heigth: 100%;" class="pic" src="/pic/'+item.pic3+'" />'
													+'</div>'
													+'</td>'

													+'<td>'+s+'</td>'
													+'<td>'+item.readnum+'</td>'
													
													+'</td>'
													+'<td style="width: 188px;">'
													+'<a href="${pageContext.request.contextPath}/backTravel/pass?id='+item.id+'">'
													+'<button type="button" class="btn btn-warning">通过</button>'
													+'</a>'
													+'<a href="${pageContext.request.contextPath}/backTravel/reject?id='+item.id+'"> '    
													+'<button type="button" class="btn btn-default">不通过</button>'  
													+'</a>'
													+'</td>'
													+'<td style="display: none">'+item.describle1+'</td>'
													+'<td style="display: none">/pic/'+item.pic1+'</td>'
													+'<td style="display: none">'+item.describle2+'</td>'
													+'<td style="display: none">/pic/'+item.pic2+'</td>'
													+'<td style="display: none">'+item.describle3+'</td>'
													+'<td style="display: none">/pic/'+item.pic3+'</td>'
													+'</tr>';
			
											});
											$("#load").empty()
											$("#load").html(html); 
											 
										}
									}); 
						}); 
	});
	
</script>
</html>