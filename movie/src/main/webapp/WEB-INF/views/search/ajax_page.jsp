<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:forEach var="vo" items="${list}">
	<div class="board-post">
		<div class="row">
			<div class="col-1">
				<img
					src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
					class="bimg">
			</div>
			<div class="col-7 align-self-center ps-3">${vo.writer}</div>
			<div class="col-4 align-self-center" style="text-align: right;">
				<fmt:formatDate value="${vo.date}" pattern="yyyy-MM-dd" />
			</div>
		</div>
	
		<div style="padding: 17px 0 0;">${vo.content}</div>
		
		<c:if test="${!empty vo.tagList}">
			<div style="padding: 17px 0 0;">
				<c:forEach var="tag" items="${vo.tagList}">
					<a href="/movie/search/tag?tag_no=${tag.tag_no}&page=1" style="color:blue">
						#${tag.tag_name}
					</a>
				</c:forEach>
			</div>
		</c:if>
	</div>
</c:forEach>
