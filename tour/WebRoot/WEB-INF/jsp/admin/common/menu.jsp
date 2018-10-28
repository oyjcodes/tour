<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div class="row">
    <aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
      <ul class="nav nav-sidebar">
        <li class="active"><a href="index.html">首页信息</a></li>
      </ul>
    
    <!--景区管理 -->  
      <ul class="nav nav-sidebar">
        <li><a class="dropdown-toggle" id="userMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">景区管理</a>
          <ul class="dropdown-menu" aria-labelledby="userMenu">  
            <li><a data-toggle="modal" data-target="#addScenicModal">新增景点</a></li>                
            <li role="separator" class="divider"></li>  
            <li><a href="${pageContext.request.contextPath}/backScenic/requestAllScenics.action">查询景点</a></li>
          </ul>
        </li>
      </ul>
      
      <ul class="nav nav-sidebar">
        <li><a class="dropdown-toggle" id="settingMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">特产管理</a>
          <ul class="dropdown-menu" aria-labelledby="settingMenu">
            <li><a data-toggle="modal" data-target="#addSpecialtyModal">新增特产</a></li> 
            <li role="separator" class="divider"></li>
            <li><a href="${pageContext.request.contextPath}/backSpecialty/requestAllSpecialty.action">查询特产</a></li>
          </ul>     
        </li>       
      </ul>   
      
      <ul class="nav nav-sidebar">   
        <li><a class="dropdown-toggle" id="settingMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">酒店管理</a>
          <ul class="dropdown-menu" aria-labelledby="settingMenu">
            <li><a data-toggle="modal" data-target="#addHotelModal">新增酒店</a></li> 
            <li role="separator" class="divider"></li>
           <li><a href="${pageContext.request.contextPath}/backHotel/requestAllHotel.action">酒店查询</a></li>
          </ul>
        </li>
      </ul>
      
      <ul class="nav nav-sidebar">   
        <li><a class="dropdown-toggle" id="settingMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">信息发布管理</a>
          <ul class="dropdown-menu" aria-labelledby="settingMenu">
            <li><a href="${pageContext.request.contextPath}/backAds/requestAllAds.action">广告管理</a></li>
            <li><a href="${pageContext.request.contextPath}/backInformation/requestAllInformation.action">资讯管理</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="${pageContext.request.contextPath}/backContent/getPublishContent.action?categoryid=1">特产管理</a></li>
            <li><a href="${pageContext.request.contextPath}/backContent/getPublishContent.action?categoryid=0">景区管理</a></li>
          </ul>
        </li>
      </ul>
      
      <ul class="nav nav-sidebar">   
        <li><a class="dropdown-toggle" id="settingMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">游记管理</a>
          <ul class="dropdown-menu" aria-labelledby="settingMenu">
            <li><a href="${pageContext.request.contextPath}/backTravel/requestAllTravels">游记查询</a></li>
          </ul>
        </li>
      </ul>
      
      <ul class="nav nav-sidebar">   
        <li><a class="dropdown-toggle" id="settingMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">评论管理</a>
          <ul class="dropdown-menu" aria-labelledby="settingMenu">
            <li><a href="${pageContext.request.contextPath}/backComment/getScenicComment">景点评论</a></li>
            <li><a href="${pageContext.request.contextPath}/backComment/getSpecialtyComment">特产评论</a></li>
            <li role="separator" class="divider"></li>  
            <li><a href="${pageContext.request.contextPath}/backComment/getHotelComment">酒店评论</a></li>
            <li><a href="${pageContext.request.contextPath}/backComment/getTravelsComment">游记评论</a></li>
          </ul>
        </li>
      </ul>
      
      <ul class="nav nav-sidebar">   
        <li><a class="dropdown-toggle" id="settingMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">订单管理</a>
          <ul class="dropdown-menu" aria-labelledby="settingMenu">
            <li><a href="${pageContext.request.contextPath}/backOrder/getAllOrder">订单查询</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav nav-sidebar">   
        <li><a class="dropdown-toggle" id="settingMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">用户管理</a>
          <ul class="dropdown-menu" aria-labelledby="settingMenu">
            <li><a href="${pageContext.request.contextPath}/backUser/getAllUser">用户查询</a></li>
          </ul>
        </li>
      </ul>
    </aside>
</div>

</body>
</html>