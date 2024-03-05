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
<script>
    $(function () {
        var tag = {};
        var counter = 0;

        function addTag (value) {
            tag[counter] = value;
            counter++;
        }

        function marginTag () {
            return Object.values(tag).filter(function (word) {
                return word !== "";
            });
        }
    
        // 서버에 제공
        $("#write-form").on("submit", function () {
            var value = marginTag();
            $("#rdTag").val(value); 
        });

        $("#tag").on("keypress", function (e) {
            if (e.key === "Enter" || e.keyCode == 32) {
                var tagValue = $(this).val();

                if (tagValue !== "") {
                    var result = Object.values(tag).filter(function (word) {
                        return word === tagValue;
                    })
                
                    if (result.length == 0) { 
                        $("#tag-list").append("<li class='tag-item'>"+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
                        addTag(tagValue);
                        $(this).val("");
                    } else {
                        alert("태그값이 중복됩니다.");
                    }
                }
                e.preventDefault();
            }
        });
		
        $(document).on("click", ".del-btn", function () {
            var index = $(this).attr("idx");
            tag[index] = "";
            $(this).parent().remove();
        });
})
</script>
</head>
<body>
<%@ include file="../nav.jsp"%>
<%@ include file="../header.jsp"%>
<c:if test="${!empty id}">
	<form action="write" id="write-form" method="post" onsubmit="return validateForm()">
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
	            	<input type="hidden" name="tag" id="rdTag">
	            	<input id="tag" placeholder="엔터로 해시태그를 등록해주세요.">
					<ul id="tag-list"></ul>
				</td>
			</tr>
			<tr>
				<td>
					<button id="write">작성</button>
				</td>
			</tr>
		</table>
	</form>
</c:if>
</body>

</html>