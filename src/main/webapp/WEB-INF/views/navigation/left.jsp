<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/include/tlcommon.jsp" %>
<html >
<head>
<base target="mainFrame">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" />
<title>左侧菜单</title>
<link rel="stylesheet" type="text/css" href="${ctx}/static/style/channel.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/style/nav.css" />
</head>
<body>
      <div id="sidebarbox">
        <div id="my_menu" class="sdmenu">
	      <div>
            <span>个人中心</span>
            <a href="${ctx }/userInfor" target="mainFrame">个人信息</a>
            <a href="${ctx }/Order7/Order_state" target="mainFrame">修改头像</a>
            <a href="${ctx }/Order/myOrder" target="mainFrame">我的账单</a>
          </div>
        <div class="collapsed">
            <span>我的订单</span>
            <a href="${ctx }/Order1/non_payOrder" target="mainFrame">未支付订单</a>
            <a href="${ctx }/Order3/appoint" target="mainFrame">预约订单</a>
            <a href="${ctx }/Order5/review" target="mainFrame">未评价订单</a>
            <a href="${ctx }/Order7/Order_state" target="mainFrame">已取消订单</a>
        </div>
 
        <div class="collapsed">
            <span>
            <a href="${ctx }/Order8/myCollection" target="mainFrame">我的收藏</a>
            </span>
        </div>
        <div  class="collapsed">
            <span>我的评价</span>	
        </div>
        <div  class="collapsed">
            <span>
            <a href="${ctx }/Order8/myCollection" target="mainFrame">我的足迹</a>
            </span>	
        </div>
        <div  class="collapsed">
            <span>信息通知</span>	
        </div>
        <div  class="collapsed">
            <span>退款维权</span>	
        </div>
      </div>
      </div>
      <script type="text/javascript" src="${ctx}/static/js/sdmenu.js"></script>
<script type="text/javascript" src="js/sdmenu.js"></script>

<script type="text/javascript">
var myMenu;
window.onload = function() {
	myMenu = new SDMenu("my_menu");
	myMenu.init();
};
</script>
</body>
</html>
