<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${caseList}" var="c" varStatus="vs">
	<div class="cp">
		<a href="${pageContext.request.contextPath}/websiteController/showMenu?type=2&menuId=${c.menu}&dataType=${c.type}&dataId=${c.id}">
			<img src="${pageContext.request.contextPath}/${c.icon}" width="236" height="353" border="0" />
			<span>${c.title}</span>
		</a>
	</div>
</c:forEach>