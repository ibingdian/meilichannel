<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/include/common.jsp"%>
<<tags:wjs items="back.js"></tags:wjs>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<!--导航区 -->
<div class="top">
	<ul>
		<li>修改层次</li>
		<p>基本数据>>修改层次</p>
	</ul>
</div>

<!-- 列表区 -->
<form id="levelForm" action="${ctx }/level/levelModify">
	<input type="hidden" value="${eduLevel.edulevelKey }" name="edulevelKey" id="hid_edulevelKey">
	<table id="table1">
		<tr id="tr1">
			<td id="left" colspan="4">修改层次信息</td>
		</tr>
		<tr>
			<td id="right" width="200px;"><font color="red">*</font>层次名称 </td>
			<td id="left">
				<input type="text" name="levelName" id="levelName" value="${eduLevel.levelName }"/>
				<input type="hidden" id="hid_levelName" name="hid_levelName" value="${eduLevel.levelName }"/>
			</td>
	 	<tr>	
			<td id="right" width="200px;"><font color="red">*</font>层次代码</td>
			<td id="left">
				<input type="text" name="edulevelID" id="edulevelID" value="${eduLevel.edulevelID }"/>
				<input type="hidden" id="hid_edulevelID" name="hid_edulevelID" value="${eduLevel.edulevelID}" />
			</td>
		</tr>
		<tr>
			<td id="right" width="200px;"><font color="red">*</font>学制</td>
			<td id="left">
				<select id="schoolingLength" name="schoolingLength" >
					<option value="0.5" <c:if test="${eduLevel.schoolingLength=='0.5'}"> selected="selected"</c:if>>0.5</option>
					<option value="1" 	<c:if test="${eduLevel.schoolingLength=='1'}"> selected="selected"</c:if>>1</option>
					<option value="1.5" <c:if test="${eduLevel.schoolingLength=='1.5'}"> selected="selected"</c:if>>1.5</option>
					<option value="2"   <c:if test="${eduLevel.schoolingLength=='2'}"> selected="selected"</c:if>>2</option>
					<option value="2.5" <c:if test="${eduLevel.schoolingLength=='2.5'}"> selected="selected"</c:if>>2.5</option>
					<option value="3"   <c:if test="${eduLevel.schoolingLength=='3'}"> selected="selected"</c:if>>3</option>
					<option value="3.5" <c:if test="${eduLevel.schoolingLength=='3.5'}"> selected="selected"</c:if>>3.5</option>
					<option value="4"   <c:if test="${eduLevel.schoolingLength=='4'}"> selected="selected"</c:if>>4</option>
					<option value="4.5" <c:if test="${eduLevel.schoolingLength=='4.5'}"> selected="selected"</c:if>>4.5</option>
					<option value="5"   <c:if test="${eduLevel.schoolingLength=='5'}"> selected="selected"</c:if>>5</option>
				</select>
			</td>
		</tr>
		<tr>
			<td id="right" width="200px;"><font color="red">*</font>教育类型</td>
			<td id="left">
				<tags:wselect id="eduType" key="EduType" name="eduType" value="${eduLevel.eduType}" /></font>
			</td>
		</tr>
		<tr>
			<td id="right" width="200px;"><font color="red">*</font>有无学位</td>
			<td colspan="3" id="left">
				<select id="degreeFlg" name="degreeFlg">
					<option value="1" <c:if test="${eduLevel.degreeFlg==1}"> selected="selected"</c:if>>有学位</option>
					<option value="0" <c:if test="${eduLevel.degreeFlg==0}"> selected="selected"</c:if>>无学位</option>
				</select>
			</td>
		</tr>
	</table>
	
<!-- 按钮区  -->
	<div class="content" align="center">
		<span class="add"><input type="submit" class="btn" id="btn_query" value="提交" /></span>
		<span class="add"><input type="button" value="返回" id="btn_back" class="btn"  onclick="back('${ctx}/level')"/></span>
		<p>
	</div>
</form>

<!-- 表单校验区 -->
<script type="text/javascript">
$(document).ready(function() {
	// 汉字
	jQuery.validator.addMethod("levelName", function(value, element) {
		var tel = /^[\u4e00-\u9fa5]+$/;
		return this.optional(element) || (tel.test(value));
	}, "请输入汉字");
	
	//字母数字
	jQuery.validator.addMethod("edulevelID", function(value, element) {
		var eduId = /^[a-zA-Z0-9]+$/;
	return this.optional(element) || (eduId.test(value));
	}, "只能包括英文字母和数字");
	
	//英文字母
	jQuery.validator.addMethod("alnum", function(value, element) {
		return this.optional(element) || /^[a-zA-Z]+$/.test(value);
	}, "只能包括英文字母");
	
	$("#levelForm").validate({ 
	rules: { 
		levelName: { 
			required: true, 
			levelName: true, 
			rangelength: [2,10],
			remote:{ //自带远程验证存在的方法  
                 url:"${ctx}/level/levelNameUnique",  
                 type:"post",  
                 dataType:"json",
                 data:{  
                      levelName:function(){return $("#levelName").val();}, 
                      hid_levelName:function(){return $("#hid_levelName").val();} 
                 } 
			}
		},
		edulevelID:{
	    	required: true,
	    	edulevelID:true,
	    	maxlength: true,
			alnum: true,
	    	remote:{
	    		url:"${ctx}/level/edulevelIDUnique",
	    		type:"post",  
                dataType:"json",
	    		data:{  
                      edulevelID:function(){return $("#edulevelID").val();},
                      hid_edulevelID:function(){return $("#hid_edulevelID").val();}
                }
	    	}
		},
		eduType:{
				required: true,
			}	
	},
	messages: { 
		levelName: { 
			required: "请填写层次名称", 
			rangelength: "层次名必须在2-10个字符之间" ,
			remote: "该层次名称已存在"  
		},
		edulevelID:{
	    	required: "请填写层次代码",
	    	maxlength: "最大长度为1",
	    	remote: "该层次代码已存在"
		},
		eduType:{
				required: "请选择教育类型"
			}
	}	
	}); 
});
</script>