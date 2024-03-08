<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="../nav.jsp"%>
<%@ include file="../header.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#login").click(function() {
			var userId = $("#user-id").val();
			var userPw = $("#user-pw").val();

			if (userId == "") {
				alert("아이디를 입력하세요");
				$("#user-id").focus();
				return;
			}

			if (userPw == "") {
				alert("비밀번호를 입력하세요");
				$("#user-pw").focus();
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

		$('input').keypress(function(e) {
			if (e.keyCode === 13) {
				$('#login').trigger('click');
			}
		});
	})
</script>
</head>
<body>
	<div class="main login-box">
		<h1 class="h3 mb-4 fw-normal">로그인</h1>

		<div class="form-floating mb-2">
			<input class="form-control" name="id" id="user-id" placeholder="아이디">
			<label for="floatingInput">아이디</label>
		</div>
		<div class="form-floating">
			<input type="password" class="form-control" name="pw" id="user-pw"
				placeholder="비밀번호"> <label for="floatingPassword">비밀번호</label>
		</div>

		<div class="form-check text-start my-3">
			<input class="form-check-input" type="checkbox" value="remember-me"
				id="flexCheckDefault"> <label class="form-check-label"
				for="flexCheckDefault">로그인 정보 기억하기</label>
		</div>
		<button class="btn btn-primary w-100 py-2" id="login">로그인</button>
		<div style="color: red;padding-top:8px;" id="errorMessage"></div>
	</div>
</body>

</html>