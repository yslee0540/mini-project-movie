<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%@ include file="../nav.jsp"%>
<%@ include file="../header.jsp"%>
<script type="text/javascript">
	$(function() {
		//아이디
		let checkId = false;
		$('#check-id').click(function() {
			if ($("#user-id").val().trim() == '') {
				$('#id-message').css('color', '#fba082').text('아이디를 입력하세요');
				$('#user-id').val('').focus();
				return;
			}

			$.ajax({
				url : 'checkId',
				type : 'post',
				data : {
					id : $("#user-id").val()
				},
				success : function(data) {
					if (data == 'idNotFound') {
						checkId = true;
						$('#id-message').css('color', 'green').text('사용가능합니다.');
						$('#user-id').css('background-color', '#ddd');
						$('#user-id').prop('readonly', true);
					} else if (data == 'idDuplicated') {
						checkId = false;
						$('#id-message').css('color', 'red').text(
								'존재하는 아이디입니다.');
					} else if (data == 'notMatchPattern') {
						checkId = false;
						$('#id-message').css('color', 'red').text(
								'4~12자의 영문 소문자, 숫자만 사용 가능합니다.');
					} else {
						checkId = false;
						alert('아이디 중복체크 오류');
					}
				},
				error : function() {
					alert('네트워크 오류 발생');
				}
			});
		});

		//비밀번호
		var checkPw = '';
		var userPw = '';
		$('#check-pw').on('input', function() {
			userPw = $("#user-pw").val();
			checkPw = $("#check-pw").val();
			if (userPw == checkPw) {
				$('#pw-message').css('color', 'green').text('비밀번호가 일치합니다.');
			} else {
				$('#pw-message').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
			}
		});

		//이메일
		const $domainListEl = $('#domain-list');
		const $domainInputEl = $('#domain-txt');

		$domainListEl.on('change', function(event) {
			let email = $domainInputEl.val().split('@');

			if ($(this).val() !== "type") {
				$domainInputEl.val(email[0] + $(this).val());
			} else {
				$domainInputEl.val(email[0]);
				$domainInputEl.prop('disabled', false);
			}
		});

		//출생연도
		const $birthYearEl = $('#birth-year');
		let isYearOptionExisted = false;

		$birthYearEl.on('focus', function() {
			if (!isYearOptionExisted) {
				isYearOptionExisted = true;
				for (let i = 1940; i <= 2024; i++) {
					const yearOption = $('<option>', {
						value : i,
						text : i
					});
					$(this).append(yearOption);
				}
			}
		});

		//회원가입
		$('input, select').on('input change', function() {
	        var allInputsFilled = true;
	        $('#signupForm input').each(function() {
	            if ($(this).val() === '') {
	                allInputsFilled = false;
	                return false;
	            }
	        });
	        
	        if (allInputsFilled && isYearOptionExisted && userPw == checkPw && checkId) {
	            $('#signup').prop('disabled', false);
	        } else {
	            $('#signup').prop('disabled', true);
	        }
	    });
	});
</script>
</head>

<body>
	<div class="main" style="width: 700px;">
		<form action="signup" id="signupForm" method="post">
			<div class="row g-3">
				<div class="col-12">
					<label for="user-id" class="form-label">아이디</label> <input
						class="form-control" id="user-id" name="id">
						<button id="check-id" type="button">중복체크</button>
					<div id="id-message"></div>
				</div>

				<div class="col-12">
					<label for="user-pw" class="form-label">비밀번호</label> <input
						type="password" class="form-control mb-2" id="user-pw" name="pw">
					<label for="check-pw" class="form-label">비밀번호 확인</label> <input
						type="password" class="form-control" id="check-pw">
					<div id="pw-message"></div>
				</div>

				<div class="col-12">
					<label for="name" class="form-label">닉네임</label> <input
						class="form-control" name="name" id="name">
				</div>

				<div class="col-md-8">
					<label for="domain-txt" class="form-label">이메일</label> <input
						type="email" class="form-control" name="email" id="domain-txt">
				</div>

				<div class="col-md-4">
					<label class="form-label"><br></label> <select
						class="form-select" id="domain-list">
						<option value="type">직접 입력</option>
						<option value="@naver.com">naver.com</option>
						<option value="@google.com">google.com</option>
						<option value="@hanmail.com">hanmail.com</option>
						<option value="@nate.com">nate.com</option>
						<option value="@kakao.com">kakao.com</option>
						<option value="@daum.net">daum.net</option>
					</select>
				</div>

				<div class="col-md-6">
					<label class="form-label">출생연도</label> <select
						class="form-select" name="birth" id="birth-year">
						<option disabled selected>----</option>
					</select>
				</div>

				<hr class="my-4">
				<button class="btn btn-primary btn-lg" id="signup" disabled>회원가입</button>
			</div>

		</form>
	</div>
</body>

</html>