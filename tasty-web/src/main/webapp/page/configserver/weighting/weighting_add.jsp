<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>
<head>
	<jsp:include page="/page/common/css-js-sources.jsp"/>
	<style type="text/css">
		tbody tr:hover{
			background: #FFFFFF;
		}
	</style>
	<script type="text/javascript">
	function ZQH_isNumeric(str){
	    if(str.length == 0){return false}
	    for(var i=0; i<str.length; i++){
	        if(str.charAt(i) < "0" || str.charAt(i) > "9"){
	            return false;
	        }
	    }
	    return true;
	}
	
	function ZQH_isIP(str){
	    var arrIP = str.split(".");
	    if(arrIP.length != 4){return false;} 
	    else {
	        var i;
	        for(i in arrIP)
	        {
	            if(ZQH_isNumeric(arrIP[i]))
	            {
	                if(arrIP[i] < 0 || arrIP[i] > 255 || arrIP[i].length>3){
	                    return false;
	                }
	            } else {
	                return false;
	            }
	        }
	    }
	    return true;
	}

	$(function() {
		$("#ip").blur(function(){
			if(ZQH_isIP(this.value)){
				$("#services").children().remove();
				$.post("weighting_service_by_ip.html", { ip: this.value},
					   function(data){
						 $("#services").append(data);
					   });
			}else{
				$("#message").html("Ip is invalidate");
			}
		});
		
		$("#ip").keyup(function(){
			if(ZQH_isIP(this.value)){
				$("#services").children().remove();
				$.post("weighting_service_by_ip.html", { ip: this.value},
					   function(data){
						 $("#services").append(data);
					   });
			}else{
			}
		});
	});
	</script>
</head>

<body>
<div id="container">
	<jsp:include page="/page/common/header.jsp">
		<jsp:param name="userName" value="${userName}"/>
		<jsp:param value="data" name="select"/>
	</jsp:include>
	<div id="wrapper">
		<div id="content">
			<div id="box">
				<h2>添加权重 <font style="font-size:12px;"><a href="${baseUrl}/weighting/list.html">查看所有权重规则</a></font> </h2>
				<c:if test="${not empty message}">
					<div id="result" class="top-error">${message}</div>
				</c:if>
				<form action="${baseUrl}/weighting/add.html" method="post" id="form">
					<table class="publish">
						<tr height="40px">
							<td width="15%" align="center">name:</td> 
							<td style="text-align:left;"><input style="height: 20px;" type="text" size="50" name="id" id="id" width="100%"></input>
							</td>
						</tr>
						<tr height="40px">
							<td width="15%" align="center">过期时间:</td> 
							<td style="text-align:left;"><input style="height: 20px;" type="text" size="50" name="time" id="time" width="100%"></input>
							</td>
						</tr>
						<tr height="40px">
							<td width="15%" align="center">IP:</td> 
							<td style="text-align:left;"><input style="height: 20px;" type="text" size="50" name="ip" id="ip" width="100%"></input>
							</td>
						</tr>
					</table>
					<div id="services"></div>
					<table class="publish" id="count">
						<tr height="40px">
							<td width="15%" align="center">复制数量:</td>
							<td style="text-align:left;"><input style="height: 20px;" type="text" size="50" name="counter" id="counter" width="100%"
								"></input></td>
						</tr>
					</table>
					<table class="publish" id="send">
						<tr height="40px">
							<td colspan="2">
								<input style="margin:0 50px 0 50px;width:100px;height: 30px;" type="submit" value="保存" />
								<input style="margin:0 50px 0 50px;width:100px;height: 30px;" type="reset"  value="重置" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		
		<jsp:include page="/page/common/menu.jsp">
			<jsp:param name="select" value='publish_data'/>
		</jsp:include>

	</div>
	<%@include file="/page/common/footer.jsp" %>
	</div>
</body>
</html>