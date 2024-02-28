<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//아이디
		let checkId = false;
		$('#checkId').click(function() {
			if ($("#userId").val().trim() == '') {
				$('#messageId').css('color', '#fba082').text('아이디를 입력하세요');
				$('#userId').val('').focus();
				return;
			}
			
			$.ajax({
				url : 'checkId',
				type : 'post',
				data : {
					id : $("#userId").val()
				},
				success : function(data) {
					if (data == 'idNotFound') {
						checkId = true;
						$('#messageId').css('color', 'green').text('사용가능합니다.');
						$('#userId').css('background-color', '#ddd');
						$('#userId').prop('readonly', true);
					} else if (data == 'idDuplicated') {
						checkId = false;
						$('#messageId').css('color', 'red').text('존재하는 아이디입니다.');
					} else if (data == 'notMatchPattern') {
						checkId = false;
						$('#messageId').css('color', 'red').text('4~12자의 영문 소문자, 숫자만 사용 가능합니다.');
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
		$('#checkPw').on('input', function() {
			userPw = $("#userPw").val();
			checkPw = $("#checkPw").val();
			if (userPw == checkPw) {
				$('#messagePw').css('color', 'green').text('비밀번호가 일치합니다.');
			} else {
				$('#messagePw').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
			}
		});

		//이메일
		const $domainListEl = $('#domainList');
		const $domainInputEl = $('#domainTxt');

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
		const $birthYearEl = $('#birthYear');
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
	        $('input').each(function() {
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
	<%@ include file="../nav.jsp"%>
	<%@ include file="../header.jsp"%>
	<form action="signup">
		<table>
			<tr>
				<td>아이디</td>
				<td><input name="id" id="userId"> <input type="button"
					id="checkId" value="중복체크"><br>
					<div id="messageId"></div></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input name="pw" id="userPw" type="password"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input id="checkPw" type="password"><br>
					<div id="messagePw"></div></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input name="name"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input name="email" id="domainTxt"><select
					id="domainList">
						<option value="type">직접 입력</option>
						<option value="@naver.com">naver.com</option>
						<option value="@google.com">google.com</option>
						<option value="@hanmail.com">hanmail.com</option>
						<option value="@nate.com">nate.com</option>
						<option value="@kakao.com">kakao.com</option>
						<option value="@daum.net">daum.net</option>
				</select></td>
			</tr>
			<tr>
				<td>출생연도</td>
				<td><select name="birth" id="birthYear">
						<option disabled selected>----</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2">
					<button id="signup" disabled>회원가입</button>
				</td>
			</tr>
		</table>
	</form>
</body>

</html>