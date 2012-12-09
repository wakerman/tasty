<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>
<head>
	<jsp:include page="/page/common/css-js-sources.jsp">
		<jsp:param name="baseUrl" value="${baseUrl}"/>
	</jsp:include>
</head>

<body>
	<div id="container">
		<jsp:include page="/page/common/header.jsp">
			<jsp:param value="help" name="select"/>
		</jsp:include>
        <div id="wrapper">
            <div id="content">
       			<div id="box">
                	<h3>帮助中心</h3>
					<form id="form" action="" method="post">
						<fieldset id="opt">
							<legend>OPTIONS</legend>
							<label for="choice">主题 : </label>
							<select name="choice">
								<option selected="selected" label="none" value="none">
								General
								</option>
								<optgroup label="Group 1">
									<option label="cg1a" value="val_1a">Selection group 1a
									</option>
									<option label="cg1b" value="val_1b">Selection group 1b
									</option>
									<option label="cg1c" value="val_1c">Selection group 1c
									</option>
								</optgroup>
								<optgroup label="Group 2">
									<option label="cg2a" value="val_2a">Selection group 2a
									</option>
									<option label="cg2b" value="val_2a">Selection group 2b
									</option>
								</optgroup>
								<optgroup label="Group 3">
									<option label="cg3a" value="val_3a">Selection group 3a
									</option>
									<option label="cg3a" value="val_3a">Selection group 3b
									</option>
								</optgroup>
							</select>
							<input id="searchButton" type="submit" value="Send" /> 
						</fieldset>
					</form>
                </div>
			</div>
        <jsp:include page="/page/common/menu.jsp">
			<jsp:param name="select" value="help" />
		</jsp:include>
      </div>
	<%@include file="/page/common/footer.jsp" %>
</div>
</body>
</html>
