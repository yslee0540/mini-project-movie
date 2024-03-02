<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	function validateForm() {
		var content = document.getElementById('content').value;
		if (content.trim() == '') {
			alert('내용을 입력해주세요');
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<%@ include file="../nav.jsp"%>
<%@ include file="../header.jsp"%>
<form action="write" method="post" onsubmit="return validateForm()">
<input name="writer" value="${id}" type="hidden">
	<table>
		<tr>
			<td>작성자: ${id}</td>
		</tr>
		<tr>
			<td>
				<textarea name="content" id="content" rows="4" cols="50" placeholder="내용을 입력하세요"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<button id="write">작성</button>
			</td>
		</tr>
	</table>
</form>
</body>

</html>