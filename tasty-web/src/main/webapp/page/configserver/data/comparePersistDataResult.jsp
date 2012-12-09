<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>
<head>
    <jsp:include page="/page/common/css-js-sources.jsp"/>
</head>

<body>
<div id="container">

    <jsp:include page="/page/common/header.jsp" flush="true">
        <jsp:param value="data" name="select"/>
    </jsp:include>


    ${msg}

    </div>
    <%@include file="/page/common/footer.jsp" %>
    </div>
</body>
</html>
