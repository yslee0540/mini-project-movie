<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() {
		$("#login").click(function() {
			var userId = $("#userId").val();
			var userPw = $("#userPw").val();

			if (userId == "") {
				alert("아이디를 입력하세요");
				$("#userId").focus();
				return;
			}

			if (userPw == "") {
				alert("비밀번호를 입력하세요");
				$("#userPw").focus();
				return;
			}
			
			$.ajax({
				url : 'login',
				type : 'post',
				data : {
					id : userId,
					pw : userPw
				},
				success : function(data) {
					if (data == 'error') {
						$('#errorMessage').text('아이디 또는 비밀번호가 일치하지 않습니다.');
					} else {
						window.location.href = '/movie';
					}
				},
				error : function() {
					alert('네트워크 오류 발생');
				}
			});
		})
		
		$('input').keypress(function (e) {
			if (e.keyCode === 13) {
		        $('#login').trigger('click');
		    }
		});
	})
</script>
</head>
<body>
	<%@ include file="../nav.jsp"%>
	<%@ include file="../header.jsp"%>
	<table>
		<tr>
			<td>아이디</td>
			<td><input name="id" id="userId"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input name="pw" id="userPw" type="password"></td>
		</tr>
		<tr>
			<td colspan="2">
				<button id="login">로그인</button><br>
				<div style="color:red" id="errorMessage"></div>
			</td>
		</tr>
	</table>
</body>

</html>