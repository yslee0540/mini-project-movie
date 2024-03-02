<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:forEach var="vo" items="${list}">
	<table>
		<tr>
			<td>${vo.writer}</td>
			<td><fmt:formatDate value="${vo.date}" pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<td colspan="2" id="content">${vo.content}</td>
		</tr>
	</table>
	<hr>
</c:forEach>
