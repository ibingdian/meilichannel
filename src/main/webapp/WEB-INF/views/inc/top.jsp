<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/include/tlcommon.jsp" %>
<html >
<head>
<base target="main_content">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" />
<link href="${ctx}/static/default/css/top.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/static/default/js/jquery-1.6.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/style/channel.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/style/nav.css" />
<title>上侧内容</title>
<script type="text/javascript">
	$(document).ready(function(){
	
	    $("#xm").css("color","#FFFF00");
  	$("a").click(function(){
	$("a").css("color","");
	   $(this).css("color","#FFFF00");
  });
 
});
</script>
</head>

<body>

	<div class="headerBar">
  <div class="header comWidth">
    <div class="fl"><img src="${ctx}/static/images/header/logo.png" alt="logo" id="logo" /></div>
    <div class="rightArea fr">
      <div class="topBar">
        <ul>
          <li id="top0"><a href="#">${user.userName}</a></li>
          <li id="top3"><a href="#">我的频道</a></li>
          <li id="top4"><a href="#">申请商家入驻</a></li>
        </ul>
      </div>
      <div class="navBar">
        <ul>
          <li class="nav_icon1"><a href="${ctx}/login/noLogin">首页</a></li>
          <li class="nav_icon2"><a href="#">美容</a></li>
          <li class="nav_icon3"><a href="${ctx }/meifaProduct">美发</a></li>
          <li class="nav_icon4"><a href="#">美甲</a></li>
        </ul>
      </div>
        <div id="search">
          <input type="text" id="search_ipt" />
          <input type="button" id="search_btn" />
        </div>
       
    </div>
  </div>
</div>
<div id="headersd"></div>
<!--头部end-->
  
</body>
</html>
