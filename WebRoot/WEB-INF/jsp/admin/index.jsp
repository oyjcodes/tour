<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>江西旅游网站后台管理系统</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="images/t_logo.jpg">
<link rel="shortcut icon" href="images/t_logo.jpg">
<script src="js/jquery-2.1.4.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript" src="js/dataView.js"></script>  
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
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">

      <h1 class="page-header">管理员信息</h1>
      <div id="chartmain" style="width:1100px; height: 530px;">
          
           
  
      </div>
    </div>
    
  <!-- 右边主区域 -->

</section>
<!--个人信息模态框-->
<div class="modal fade" id="seeUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <form name="managerInfo"  action="${pageContext.request.contextPath}/backCheck/editManager" method="post">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" >个人信息</h4>
        </div>
        <div class="modal-body">
          <table class="table" style="margin-bottom:0px;">
            <thead>
              <tr> </tr>
            </thead>
            <tbody id="userInfo">
              <tr>
                <td wdith="20%">姓名:</td>
                <td width="80%"><input type="text"  class="form-control" name="username" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">账号:</td>
                <td width="80%"><input type="text"  class="form-control" name="usernum" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">电话:</td>
                <td width="80%"><input type="text"  class="form-control" name="tel" maxlength="13" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">密码:</td>
                <td width="80%"><input type="text" class="form-control" name="password" maxlength="18" autocomplete="off" /></td>
              </tr>
              
            </tbody>
            <tfoot>
              <tr></tr>
            </tfoot>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="submit" class="btn btn-primary" onclick="managerInfo.submit()">提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
 
<!--提示模态框-->
<div class="modal fade user-select" id="areDeveloping" tabindex="-1" role="dialog" aria-labelledby="areDevelopingModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="areDevelopingModalLabel" style="cursor:default;">该功能正在日以继夜的开发中…</h4>
      </div>
      <div class="modal-body"> <img src="images/baoman/baoman_01.gif" alt="深思熟虑" />
        <p style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<script>
function viewUser(){
	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/backUser/getManager.action',
		success : function(data) {//返回json结果 
			var arr = new Array();    
		    arr[0] = data.username;
		    arr[1] = data.usernum;
		    arr[2] = data.tel;
		    arr[3] = data.password;
			var trList = $("#userInfo").children("tr")
			  for (var i=0;i<trList.length;i++) {
			    var tdArr = trList.eq(i).find("td");
			    tdArr.eq(1).find("input").val(arr[i]);   
			            
			  }
		}
			 
	});  
}



$(function(){
	//初始化echarts实例
	var myChart = echarts.init(document.getElementById('chartmain'));
	 //通过Ajax获取数据
    $.ajax({
        type : "post",
        async : false, //同步执行
        url : "${pageContext.request.contextPath}/view/getOrderNumber.action",
        dataType : "json", //返回数据形式为json
        success : function(data) {
            if (data) {
            	//指定图标的配置和数据
            	var option = {
            		backgroundColor: '#FBFBFB',
            	    title:{
            	        text:'江西省各地级市特产商城的销售情况'
            	    },
            	    tooltip:{
            	    	 trigger: 'axis'  
            	    },
            	    toolbox: {

            	        show : true,

            	        feature : {

            	            mark : {show: true},

            	            dataView : {show: true, readOnly: false},

            	            magicType : {show: true, type: ['line', 'bar']},

            	            restore : {show: true},

            	            saveAsImage : {show: true}

            	        }

            	    },
            	    calculable : true,
            	    legend: { 
            	    	 data: ['下单数量','销售额']
            	    },
            	    xAxis:{
            	    	boundaryGap: false,
            	        data:data.name,
            	        axisLine:{
            	            lineStyle:{
            	                color:'red'
            	            }
            	        },
            	        //x轴文字旋转
            	        axisLabel:{
            	            rotate:30,
            	            interval:0
            	        },
            	       
            	    },
            	    yAxis : [
            	             {
            	                 type : 'value',
            	                 axisLabel : {
            	                     formatter: '{value}'
            	                 }
            	             }
            	         ],
            	    series:[
            	       {
            	        name:'下单数量',
            	        type:'line',
            	        itemStyle:{  
            	            normal:{    
            	                 lineStyle:{    
            	                     color:'#6495ED'    
            	                 }    
            	             }  
            	        },  
            	        data:data.value1
            	        },
            	        
            	        
            	        {
            	        	name:'销售额',
            	            type:'line',
            	            smooth:0.3,
            	            itemStyle:{  
            	                normal:{    
            	                     lineStyle:{    
            	                         color:'#90EC7D'    
            	                     }    
            	                 }  
            	            },  
            	             data:data.value2
            	         
            	        }
            	          
            	  ]
            	    
            	};
            	
            	//使用制定的配置项和数据显示图表
            	myChart.setOption(option);
            	
            	
            }
        },
        error : function(errorMsg) {
            alert("图表请求数据失败啦!");
        }
    });

});
	



</script> 

</body>
</html>