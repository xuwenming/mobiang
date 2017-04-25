<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jb.listener.Application"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%
	String defaultDg = "web/images/banner.jpg";
	String bg = Application.get("IM010") == null ? defaultDg : (Application.get("IM010").getIcon() == null ? defaultDg :Application.get("IM010").getIcon());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>上海莫辩信息科技有限公司</title>
<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/style/images/logo.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/css.css" />
<link href="${pageContext.request.contextPath}/web/css/lanrentuku.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jslib/jquery-1.8.3.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/web/js/slide.js"></script>

<script type="text/javascript">
	$(function(){
		parent.setTitle('上海莫辩信息科技有限公司');
		$("#menuDiv").load("${pageContext.request.contextPath}/websiteController/menu");
	});
</script>
</head>
<body>

<table width="100%" border="0" style="background:url(${pageContext.request.contextPath}/<%=bg %>) top center no-repeat; height:768px;" cellspacing="0" cellpadding="0">
	<tr>
    	<td valign="top">
    		<div id="menuDiv"></div>
    		<div id="caseDiv"></div>
			<jsp:include page="bottom.jsp"></jsp:include>
		</td>
  	</tr>
</table>

<script type="text/javascript">
	$(function(){
		$("#caseDiv").load("${pageContext.request.contextPath}/websiteController/show_case?menuId=MU100");
		
		$(".business .yewu").live('mouseover', function(){
			if($(this).index() != 0) {
				$(".business .yewu:eq(0)").removeClass("active");
			}
		});
		$(".business .yewu").live('mouseout', function(){
			$(".business .yewu:eq(0)").addClass("active");
		});
	});
</script>
</body>
</html>
