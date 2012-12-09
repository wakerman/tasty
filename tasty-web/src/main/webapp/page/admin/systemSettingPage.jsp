<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp"%>
<html>
<head>
</head>


<body>
<jsp:include page="/page/common/header.jsp" flush="true">
	<jsp:param name="select" value='admin' />
</jsp:include>
	<div class="container">

		<h1>系统配置</h1>
		<br>
		<form class="form-horizontal" action="updateSystemSettingHandle.html">

			<div class="control-group">
				<label class="control-label" for="inputEmail">ID</label> <label class="control-label"
					for="inputEmail">${systemSetting.id }</label> <input type="hidden" name="id" id="id"
					value="${systemSetting.id }">
			</div>

			<div class="control-group">
				<label class="control-label" for="inputEmail">支持模糊查询的LogType</label>
				<div class="controls">
					<textarea class="span10" rows="5" id="logTypeListForFuzzySearch"
						name="logTypeListForFuzzySearch">${systemSetting.logTypeListForFuzzySearch }</textarea>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="inputEmail">验证码</label>
				<div class="controls">
					<input class="span2" type="text" id="checkCode" name="checkCode" >
				</div>
			</div>

			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn">Update</button>
				</div>
			</div>


		</form>

	</div>









</body>
</html>
