<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/common.jsp"%>

<tags:wjs items="checkbox.js"></tags:wjs>
<tags:wcss items="message.css"></tags:wcss>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/style/index.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/style/nav.css" />
<script type="text/javascript">
	function changeBelongExamBatch(path) {
		$("#searchForm").action = path;
		$("#searchForm").submit();
	}

	function dispatchTrainingCourse(controllerUrl, trainingKey) {
		//window.open(controllerUrl+"?academicKey="+academicKey,"_blank");
		window.location.href = controllerUrl + "?trainingKey=" + trainingKey;

	}
	function detailTrainingCourse(controllerUrl, trainingKey) {
		window.open(controllerUrl + "?trainingKey=" + trainingKey, "_blank",
				"scrollbars=1","alwaysRaised=1");
		//window.top.location.href=controllerUrl+"?academicKey="+academicKey;

	}
	
	function skip(controllerUrl, keyString) {
		var alertMessage = "您没有勾选要操作的记录，请先勾选！";
		//判断是否勾选复选框，如果没有勾选，提示alertMessage的信息
		var obj = document.getElementsByName("chk_sub_checkBox");
		var j = 0;
		for(var i=0;i<obj.length;i++) {
			if(obj[i].checked==true) {
				j ++;
				break;
			}
		}
		if(j < 1) {
			alert(alertMessage);
			return false;
		}
			var specialKeys=document.getElementsByName("chk_sub_checkBox");
			var keyString = "?keys=";
		    for(var i=0;i<specialKeys.length;i++){
		    	if(specialKeys[i].checked && specialKeys[i].value != ""){
		    		keyString+=specialKeys[i].value+=",";
		    	}
		    }
		    //controller对应的url加上传过去多条记录的主键keys
		    var url = controllerUrl+keyString;
		    window.location.href=url;
		
	}
</script>

<!--导航区 -->


<!--这里是操作完成的消息提示区  -->
<div class="headerBar">
  <div class="header comWidth">
    <div class="fl"><img src="${ctx}/static/images/header/logo.png" alt="logo" id="logo" /></div>
    <div class="rightArea fr">
      <div class="topBar">
        <ul>
          <li id="top1"><a href="#">注册</a></li>
          <li id="top2"><a href="#">登录</a></li>
          <li id="top3"><a href="#">我的频道</a></li>
          <li id="top4"><a href="#">申请商家入驻</a></li>
        </ul>
      </div>
      <div class="navBar">
        <ul>
          <li class="nav_icon1"><a href="#">首页</a></li>
          <li class="nav_icon2"><a href="#">美容</a></li>
          <li class="nav_icon3"><a href="#">美发</a></li>
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
<div id="headersd"><img src="${ctx}/static/images/header/headersd1.jpg" alt="阴影" /></div>
<c:import url="/WEB-INF/include/message.jsp"></c:import>
<form id="searchForm" action="" method="post">
	<div class="gly-top">
	</div>



	<!-- 列表区 -->
	    <div id="container" >
      <div class="bannerbox">
      <div id="focus">
        <ul>
          <li id="bnr1"><a href="#" target="_blank">
              <img src="${ctx}/static/images/banner/banner1.png" alt="" /></a></li>
          <li id="bnr2"><a href="#" target="_blank">
              <img src="${ctx}/static/images/banner/banner2.png" alt="" /></a></li>
          <li id="bnr3"><a href="#" target="_blank">
              <img src="${ctx}/static/images/banner/banner3.png" alt="" /></a></li>
          <li id="bnr4"><a href="#" target="_blank">
              <img src="${ctx}/static/images/banner/banner4.png" alt="" /></a></li>
        </ul>
        <input id="btn_rong" type="button" alt="美容" />
        <input id="btn_fa" type="button" alt="美发" />
        <input id="btn_jia" type="button" alt="美甲" />
      </div>
     </div>
     <img id="sidebar" src="${ctx}/static/images/index/sidebar.png" alt="公告" />
     <div id="ranking">
       <div id="ranktext">
         <span>排序：<a href="###">销售量</a><a href="###">评价</a><a href="###">综合排序</a></span>
       </div>
        
   
      
       <div class="rank-shop">
         <a href="#"><img src="${ctx}/static/images/index/shop7.png" alt="店铺" /></a><span><a href="#">***的店铺</a></span><p>淘宝网是亚太地区较大的网络零售商圈，由阿里巴巴集团在2003年5月10日投资创立。淘宝网现在业务跨越C2C（个人对个人）、B2C（商家对个人）两大部分。截止2014年，淘宝网注册会员超5亿人每天有超过1.2亿的活跃用户，在线商品数达到10亿件，... </p>
       </div>
       <div class="rank-shop">
         <a href="#"><img src="${ctx}/static/images/index/shop7.png" alt="店铺" /></a><span><a href="#">***的店铺</a></span><p>淘宝网是亚太地区较大的网络零售商圈，由阿里巴巴集团在2003年5月10日投资创立。淘宝网现在业务跨越C2C（个人对个人）、B2C（商家对个人）两大部分。截止2014年，淘宝网注册会员超5亿人每天有超过1.2亿的活跃用户，在线商品数达到10亿件，... </p>
       </div>
       <div class="rank-shop">
         <a href="#"><img src="${ctx}/static/images/index/shop7.png" alt="店铺" /></a><span><a href="#">***的店铺</a></span><p>淘宝网是亚太地区较大的网络零售商圈，由阿里巴巴集团在2003年5月10日投资创立。淘宝网现在业务跨越C2C（个人对个人）、B2C（商家对个人）两大部分。截止2014年，淘宝网注册会员超5亿人每天有超过1.2亿的活跃用户，在线商品数达到10亿件，... </p>
       </div>
       <div class="rank-shop">
         <a href="#"><img src="${ctx}/static/images/index/shop7.png" alt="店铺" /></a><span><a href="#">***的店铺</a></span><p>淘宝网是亚太地区较大的网络零售商圈，由阿里巴巴集团在2003年5月10日投资创立。淘宝网现在业务跨越C2C（个人对个人）、B2C（商家对个人）两大部分。截止2014年，淘宝网注册会员超5亿人每天有超过1.2亿的活跃用户，在线商品数达到10亿件，... </p>
       </div>
     </div>
     <img id="pages" src="${ctx}/static/images/channel/pages.png" alt="页码" />
    </div>


	
</form>