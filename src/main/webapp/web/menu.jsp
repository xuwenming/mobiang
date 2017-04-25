<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jb.listener.Application"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String defaultLogo = "web/images/logo.png";
	String logo = Application.get("IM050") == null ? defaultLogo : (Application.get("IM050").getIcon() == null ? defaultLogo :Application.get("IM050").getIcon());
%>

<script type="text/javascript">
$(document).ready(function(){
	var menuId = $("#menuId").val();
	if(menuId) {
		$("#menu_"+menuId).closest("#menu").find("a").removeClass("active"); 
		$("#menu_"+menuId).addClass("active");
	}
});
</script>

<input type="hidden" id="menuId" value="${menuId}"/>
<table width="1000" align="center" border="0" cellspacing="0" cellpadding="0" style="margin-top:35px;">
	<tr>
		<td width="290"><a href="${pageContext.request.contextPath}/web/home.jsp"><img src="${pageContext.request.contextPath}/<%=logo %>" width="239" height="76" border="0" /></a></td>
    	<td width="710">
    		<div id="menu">
		       	<ul id="nav">
		            <li class="mainlevel" id="menu_SY" style="width:75px;">
		            	<a href="${pageContext.request.contextPath}/web/home.jsp" style="width:75px;letter-spacing:5px;" class="active" target="contentFrame">首页</a>
		            </li>
		            <c:forEach items="${menuList}" var="menu" varStatus="vs">
		            	<li class="mainlevel">
		            		<c:choose>
		            			<c:when test="${menu.menuDesc.extLink}">
		            				<a href="${menu.menuDesc.url}" id="menu_${menu.id}" target="${menu.menuDesc.target}">${menu.name}</a>
		            			</c:when>
		            			<c:otherwise>
		            				<a href="${pageContext.request.contextPath}/${menu.menuDesc.url}&menuId=${menu.id}" id="menu_${menu.id}" target="${menu.menuDesc.target}" >${menu.name}</a>
		            			</c:otherwise>
		            		</c:choose>
		            	</li>
		            </c:forEach>
		         </ul>
	       	</div>
	   	</td>
	</tr>
</table>