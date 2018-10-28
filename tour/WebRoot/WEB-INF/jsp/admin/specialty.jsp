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
			<h1 class="page-header">特产管理</h1>
			<div class="table-responsive">
				<table class="table table-hover">
					<caption>特产列表</caption>
					<thead>
						<tr>
							<th>编号</th>
							<th>特产名称</th>
							<th>特产地</th>
							<th>图片</th>
							<th>价格</th>
							<th>库存量</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>

					<tbody id="load">
						<c:forEach items="${pageInfo.list}" var="item" varStatus="id">
							<tr>
								<td class="article-title">${item.id}</td>
								<td>${item.tname}</td>
								<td>${item.areaName}</td>
								<td><div style="width: 50px; heigth: 50px;" class="pdiv">
										<img style="width: 100%; heigth: 100%;" class="pic"
											src="/pic/${item.tpic}" />
									</div></td>
								<td><font color="red">${item.tprice}</font></td>
								<td>${item.stocknum}</td>
								<td><c:if test="${item.stage eq 0}">
										<font color="orange">下架</font>
									</c:if> <c:if test="${item.stage eq 1}">
									                    上架
									    </c:if></td>

								<td style="display: none">${item.stage}</td>
								<td style="display: none">/pic/${item.tpic}</td>
								<td style="display: none">/pic/${item.pic2}</td>
								<td style="display: none">/pic/${item.pic3}</td>
								<td style="display: none">${item.tcategory}</td>
								<td style="display: none">${item.tnum}</td>
								<td style="display: none">${item.tdescrible}</td>
								<td style="display: none">${item.tpic}</td>
								<td style="width: 250px;">
								<button type="button" class="btn btn-info" data-toggle="modal"
										data-target="#pSpecialty" name="publish">发布</button>
									<button type="button" class="btn btn-info" data-toggle="modal"
										data-target="#myModal" name="edit">修改</button> <a
									href="${pageContext.request.contextPath}/backSpecialty/downSpecialty?id=${item.id}"><button
											type="button" class="btn btn-warning">下架</button></a> <a
									href="${pageContext.request.contextPath}/backSpecialty/upSpecialty?id=${item.id}"><button
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
							href="${pageContext.request.contextPath}/backSpecialty/requestAllSpecialty?page=${pageInfo.prePage}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach var="i" begin="1" end="${pageInfo.pages}"
							varStatus="status">

							<c:choose>
								<c:when test="${pageUtils.currentPageNum==i}">
									<li class="active"><a
										href="${pageContext.request.contextPath}/backSpecialty/requestAllSpecialty?page=${status.index}">${status.index}</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/backSpecialty/requestAllSpecialty?page=${status.index}">${status.index}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<!-- <li class="active"><a>1</a></li> -->
						<li><a
							href="${pageContext.request.contextPath}/backSpecialty/requestAllSpecialty?page=${pageInfo.nextPage}"
							aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</ul>
				</nav>
			</footer>
			</form>
		</div>
	</section>


<!-- 模态框 （Modal）修改特产 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 1000px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">修改特产信息</h4>
				</div>
				<div class="modal-body">
					<form name="editForm" class="form-horizontal" role="form"
						action="${pageContext.request.contextPath}/backSpecialty/editSpecialty.action"
						method="post" enctype="multipart/form-data">
						<!-- 模态框左侧部分 -->
						<input type="hidden" name="id" id="id" />
						<div style="float: left; width: 50%;">
							<div class="form-group">
								<label for="firstname" class="col-sm-2 control-label">特产名称</label>
								<div class="col-sm-7">
									<input type="text" value="" class="form-control" id="tname"
										name="tname" placeholder="请输入特产名称">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">价格</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="tprice"
										name="tprice" placeholder="请输入价格">
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">特产地</label>

								<div class="col-sm-7">
									<select name="tnum" id="tnum">
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
								<label for="lastname" class="col-sm-5 control-label">特产类型</label>
								<div>

									<select name="tcategory" id="tcategory">
										<option value="2">熟食</option>
										<option value="3">酒类</option>
										<option value="1">其它</option>

									</select>
								</div>
							</div>
							<div class="form-group" style="width: 50%; float: left;">
								<label for="lastname" class="col-sm-5 control-label">特产状态</label>
								<div>
									<select name="stage" id="stage">
										<option value="1">上架</option>
										<option value="0">下架</option>

									</select>
								</div>
							</div>
							<div style="clear: both;"></div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">库存</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="stocknum"
										name="stocknum" placeholder="请输入库存量">
								</div>
							</div>
						</div>

						<!-- 模态框右侧部分 -->
						<div style="float: left; width: 50%;">

							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">特产描述</label>
								<div class="col-sm-9">
									<textarea rows="7" class="form-control" id="tdescrible"
										name="tdescrible" placeholder="请输入特产描述"></textarea>
								</div>
							</div>

							<div class="form-group">
								<label for="pic1" class="col-sm-2 control-label">图片一</label>
								<div class="col-sm-5" style="float: left;">
									<input type="file" name="file" class="form-control" id="tpic"
										name="tpic" placeholder="图片一">

								</div>
								<div style="float: left; width: 50px; heigth: 50px;">
									<img id="tpic" style="width: 100%; heigth: 100%;" class="pic"
										src="" />
								</div>
							</div>
							<div class="form-group">
								<label for="pic2" class="col-sm-2 control-label">图片二</label>
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
								<label for="pic3" class="col-sm-2 control-label">图片三</label>
								<div class="col-sm-5" style="float: left;">
									<input type="file" name="file" class="form-control" id="pic3"
										name="pic3" placeholder="图片三">

								</div>
								<div style="float: left; width: 50px; heigth: 50px;">
									<img id="pic3" style="width: 100%; heigth: 100%;" class="pic"
										src="" />
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


	<!-- 模态框 （Modal）增加特产 -->
	<div class="modal fade" id="addSpecialtyModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 1000px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">添加特产信息</h4>
				</div>
				<div class="modal-body">
					<form name="addForm" class="form-horizontal" role="form"
						action="${pageContext.request.contextPath}/backSpecialty/addSpecialty.action"
						method="post" enctype="multipart/form-data">
						<!-- 模态框左侧部分 -->     
						<input type="hidden" name="id" id="id" />
						<div style="float: left; width: 50%;">
							<div class="form-group">
								<label for="firstname" class="col-sm-2 control-label">特产名称</label>
								<div class="col-sm-7">
									<input type="text" value="" class="form-control" id="tname"
										name="tname" placeholder="请输入特产名称">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">价格</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="tprice"
										name="tprice" placeholder="请输入价格">
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">特产地</label>

								<div class="col-sm-7">
									<select name="tnum" id="tnum">
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
								<label for="lastname" class="col-sm-5 control-label">特产类型</label>
								<div>

									<select name="tcategory" id="tcategory">
										<option value="2">熟食</option>
										<option value="3">酒类</option>
										<option value="1">其它</option>

									</select>
								</div>
							</div>
							<div class="form-group" style="width: 50%; float: left;">
								<label for="lastname" class="col-sm-5 control-label">特产状态</label>
								<div>
									<select name="stage" id="stage">
										<option value="1">上架</option>
										<option value="0">下架</option>

									</select>
								</div>
							</div>
							<div style="clear: both;"></div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">库存</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="stocknum"
										name="stocknum" placeholder="请输入库存量">
								</div>
							</div>
						</div>

						<!-- 模态框右侧部分 -->
						<div style="float: left; width: 50%;">

							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">特产描述</label>
								<div class="col-sm-9">
									<textarea rows="7" class="form-control" id="tdescrible"
										name="tdescrible" placeholder="请输入特产描述"></textarea>
								</div>
							</div>

							<div class="form-group">
								<label for="pic1" class="col-sm-2 control-label">图片一</label>
								<div class="col-sm-5" style="float: left;">
									<input type="file" name="file" class="form-control" id="tpic"
										name="tpic" placeholder="图片一">
								</div>
							</div>
							<div class="form-group">
								<label for="pic2" class="col-sm-2 control-label">图片二</label>
								<div class="col-sm-5" style="float: left;">
									<input type="file" name="file" class="form-control" id="pic2"
										name="pic2" placeholder="图片二">

								</div>
							</div>

							<div class="form-group">
								<label for="pic3" class="col-sm-2 control-label">图片三</label>
								<div class="col-sm-5" style="float: left;">
									<input type="file" name="file" class="form-control" id="pic3"
										name="pic3" placeholder="图片三">
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
						class="btn btn-primary">添加特产</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

<div>
<!-- 模态框 （Modal）发布特产信息到前台首页 -->
<div class="modal fade" id="pSpecialty" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 800px;">
        <div class="modal-content">
            <div class="modal-header">
                 
                <h4 class="modal-title" id="myModalLabel">发布特产信息</h4>
            </div>
            
            <!--   添加主体 开始--> 
            <div class="modal-body" style="top:15px;">    
               <form name="publishForm" class="form-horizontal" role="form"
							action="${pageContext.request.contextPath}/backSpecialty/publishSpecialty.action"  
							method="post" enctype="multipart/form-data">
							<!-- 模态框左侧部分 -->   
							<input type="hidden" name="contentid" id="contentid" />
							<input type="hidden" name="pic" id="pic" />
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">标题</label>
									<div class="col-sm-7">
										<input type="text" value="" class="form-control" id="title"
											name="title">
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
				<button onclick="publishForm.submit();" type="button"class="btn btn-primary">特产发布</button>  
            </div>
            <!--    结束按钮 -->  
            
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
    </div>
    </div>



	
	<script>
		//取页面的值传给模态框
		$(function() {
			
			$("Button[name='publish']").each(
					function() {
						$(this).click(
								function() {
									var contentid = $(this).parent().parent()
											.children().eq(0).text();
									var title = $(this).parent().parent()
											.children().eq(1).text();
								 
									 
									var stage = $(this).parent().parent()
											.children().eq(7).text();
									var pic = $(this).parent().parent()
											.children().eq(8).text();
									var areanum = $(this).parent().parent()
									.children().eq(12).text();
									var path = $(this).parent().parent()
									.children().eq(14).text();
  

									$("#contentid").val(contentid);
									$("#title").val(title);
									$("#areanum").val(areanum);
									$("#pic").val(path);
								 
									$("select#stage").val(stage);
									$("img#pic").attr("src", pic);
									 

								})

			
			
		});
			
			
			
			
			
			
			

			
			$("Button[name='edit']").each(
					function() {
						$(this).click(
								function() {
									var id = $(this).parent().parent()
											.children().eq(0).text();
									var tname = $(this).parent().parent()
											.children().eq(1).text();
									var tprice = $(this).parent().parent()
											.children().eq(4).text();
									var stocknum = $(this).parent().parent()
											.children().eq(5).text();
									var stage = $(this).parent().parent()
											.children().eq(7).text();
									var tpic = $(this).parent().parent()
											.children().eq(8).text();

									var pic2 = $(this).parent().parent()
											.children().eq(9).text();
									var pic3 = $(this).parent().parent()
											.children().eq(10).text();

									var tcategory = $(this).parent().parent()
											.children().eq(11).text();
									var tnum = $(this).parent().parent()
											.children().eq(12).text();

									var tdescrible = $(this).parent().parent()
											.children().eq(13).text();

									$("#id").val(id);
									$("#tname").val(tname);
									$("#tprice").val(tprice);
									$("#stocknum").val(stocknum);
									$("#tdescrible").val(tdescrible);
									$("#tcategory").val(tcategory);
									$("select#tnum").val(tnum);
									$("select#tcategory").val(tcategory);
									$("select#stage").val(stage);
									$("img#tpic").attr("src", tpic);
									$("img#pic2").attr("src", pic2);
									$("img#pic3").attr("src", pic3);

								})

					});
		})

		//是否确认删除
		$(function() {
			$("#delete").click(
							function() {
								var ids = [];
								var get = $(".input-control");
								for (i = 0; i < get.length; i++) {
									if (get[i].checked) {
										ids.push(get[i].value);
										alert(ids[i])
									}
								}
								$.ajax({
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