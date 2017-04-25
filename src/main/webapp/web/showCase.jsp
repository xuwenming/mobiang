<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table width="1000" border="0" cellspacing="0" cellpadding="0" style="height:190px; background: url(${pageContext.request.contextPath}/web/images/3.png); margin-top:450px;">
	<tr>
		<td valign="top" class="business">
			<c:forEach items="${data}" var="d" varStatus="vs">
				<div class="yewu <c:if test="${vs.index == 0}">active</c:if>" <c:if test="${vs.index == 0}">style="width:250px; height:190px;"</c:if>>
					<a href="${pageContext.request.contextPath}/websiteController/showMenu?type=2&menuId=${d.pid}&dataType=${d.id}"><img src="${pageContext.request.contextPath}/${d.icon}"  width="250" height="190" border="0" ></a>
				</div>
			</c:forEach>
		</td>
	</tr>
</table>