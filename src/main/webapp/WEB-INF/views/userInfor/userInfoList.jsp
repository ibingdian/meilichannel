<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/common.jsp"%>

<tags:wjs items="checkbox.js"></tags:wjs>
<tags:wcss items="message.css"></tags:wcss>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<head>
<link rel="stylesheet" type="text/css" href="${ctx}/static/style/channel.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/style/nav.css" />
<script src="${ctx}/static/js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/calendar/calendar.js" type="text/javascript"></script>
<script src="${ctx}/static/js/calendar/WdatePicker.js" type="text/javascript"></script>
<script src="${ctx}/static/js/Area.js" type="text/javascript"></script>
<script src="${ctx}/static/js/AreaData_min.js" type="text/javascript"></script>

<script type="text/javascript">
$(function (){
	initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, '44', '0', '0');
});

//得到地区码
function getAreaID(){
	var area = 0;          
	if($("#seachdistrict").val() != "0"){
		area = $("#seachdistrict").val();                
	}else if ($("#seachcity").val() != "0"){
		area = $("#seachcity").val();
	}else{
		area = $("#seachprov").val();
	}
	return area;
}

function showAreaID() {
	//地区码
	var areaID = getAreaID();
	//地区名
	var areaName = getAreaNamebyID(areaID) ;
	alert("您选择的地区码：" + areaID + "      地区名：" + areaName);            
}

//根据地区码查询地区名
function getAreaNamebyID(areaID){
	var areaName = "";
	if(areaID.length == 2){
		areaName = area_array[areaID];
	}else if(areaID.length == 4){
		var index1 = areaID.substring(0, 2);
		areaName = area_array[index1] + " " + sub_array[index1][areaID];
	}else if(areaID.length == 6){
		var index1 = areaID.substring(0, 2);
		var index2 = areaID.substring(0, 4);
		areaName = area_array[index1] + " " + sub_array[index1][index2] + " " + sub_arr[index2][areaID];
	}
	return areaName;
}
</script><script type="text/javascript">
$(function (){
	initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, '44', '0', '0');
});

//得到地区码
function getAreaID(){
	var area = 0;          
	if($("#seachdistrict").val() != "0"){
		area = $("#seachdistrict").val();                
	}else if ($("#seachcity").val() != "0"){
		area = $("#seachcity").val();
	}else{
		area = $("#seachprov").val();
	}
	return area;
}

function showAreaID() {
	//地区码
	var areaID = getAreaID();
	//地区名
	var areaName = getAreaNamebyID(areaID) ;
	alert("您选择的地区码：" + areaID + "      地区名：" + areaName);            
}

//根据地区码查询地区名
function getAreaNamebyID(areaID){
	var areaName = "";
	if(areaID.length == 2){
		areaName = area_array[areaID];
	}else if(areaID.length == 4){
		var index1 = areaID.substring(0, 2);
		areaName = area_array[index1] + " " + sub_array[index1][areaID];
	}else if(areaID.length == 6){
		var index1 = areaID.substring(0, 2);
		var index2 = areaID.substring(0, 4);
		areaName = area_array[index1] + " " + sub_array[index1][index2] + " " + sub_arr[index2][areaID];
	}
	return areaName;
}
</script>
</head>
<!--[if IE 6]>
<script src="js/DD_belatedPNG_0.0.8a.js"></script>
<script>
DD_belatedPNG.fix('#logo,.navBar,#top1,#top2,#top3,#top4,.nav_icon1,.nav_icon2,.nav_icon3,.nav_icon4,.shade,input,#point,#point1,#point2,#point3,#point4,.messbox,#portrait');
</script>
<![endif]-->
<!--导航区 -->
<body>
    <div id="container">
      <form action="${ctx }/userInfor/update" method="post" >
      <input type="hidden" name="userId" value="${user.userId}">
 <select id="seachprov" name="seachprov" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');"></select>&nbsp;&nbsp;
<select id="seachcity" name="homecity" onChange="changeCity(this.value,'seachdistrict','seachdistrict');"></select>&nbsp;&nbsp;
<span id="seachdistrict_div"><select id="seachdistrict" name="seachdistrict"></select></span>
      <input class="Wdate" type="text" id="txt_startingTime" name="startingTime" 
				class="required" onClick="WdatePicker()" value="" />
       <img id="line-bg" src="static/images/channel/line-bg.png" alt="线条背景" />
       <a href="${ctx }/userInfor" target="mainFrame"><img id="basic-infor" src="static/images/channel/basic-infor.png" alt="基本信息" /></a>
       <a href="${ctx }/userInfor/userImg"><img id="photo" src="static/images/channel/photo.png" alt="头像照片" /></a>
       <div id="present"><img src="static/images/channel/present.png" alt="当前头像" /><br/><span>当前头像</span></div>
       <ul class="infor left">
         <li>昵称</li>
         <li></li>
         <li>性别</li>
         <li></li>
         <li>居住地</li>
         <li></li>
         <li>出生日期</li>
         <li></li>
         <li>兴趣爱好</li>
         <li></li>
         <li>邮箱</li>
       </ul>
       <ul class="infor right">
       <c:forEach items="${userInfoList.content}" var="userInfoList"
				varStatus="status">
         <li><input id="nickname" type="text" name="userName" value="${user.userName}" /></li>
         <li></li>
         <li><span id="sex">
           <input type="radio" value="男" name="sex" id="sex1"/>&nbsp;&nbsp;<label for="sex1">男</label>&nbsp;&nbsp;/&nbsp;&nbsp;
           <input type="radio" value="女" name="sex" id="sex2"/>&nbsp;&nbsp;<label for="sex2">女</label></span></li>
         <li></li>
         <li><span id="addr">
         		<select id="seachprov" name="seachprov" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');"></select>&nbsp;&nbsp;
				<select id="seachcity" name="homecity" onChange="changeCity(this.value,'seachdistrict','seachdistrict');"></select>&nbsp;&nbsp;
				<span id="seachdistrict_div"><select id="seachdistrict" name="seachdistrict"></select></span>
				<input type="button"  value="获取地区" onClick="showAreaID()"/>
				<input class="Wdate" type="text" id="txt_startingTime" name="startingTime" 
				class="required" onClick="WdatePicker()" value="" />
         </span></li>
         <li></li>
         <li><span id="data"><input type="text" /><input type="text" /><input type="text" /></span></li>
    <li></li>
         <li><input id="hobby" type="text" name="message" value="${user.message}"/></li>
         <li></li>
         <li><input id="email" type="text" name="user_email" value="${user.userEmail}"/></li>
         	</c:forEach>
       </ul>
       <input type="submit" id="save" value="" />
      </form>
    </div>
    </body>
<!--主体end-->
