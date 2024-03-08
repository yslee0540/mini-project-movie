<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물</title>
<%@ include file="../../../nav.jsp"%>
<%@ include file="../../../header.jsp"%>
<script>
$(function() {
	GetList(1);
});

const GetList = function(currentPage){
    $.ajax({
	    url : 'ajax_page',
		type : 'GET',
		data : {
			page : currentPage
		},
		success : function(data) {
			$('#post').append(data);
			isLoading = false;
		},
		error : function() {
			alert('네트워크 오류 발생');
		}
	});
};

let currentPage = 1;
let isLoading = false;

$(window).on("scroll", function() {
    let scrollTop = $(window).scrollTop();
    let windowHeight = $(window).height();
    let documentHeight= $(document).height();
    let isBottom = scrollTop + windowHeight + 10 >= documentHeight;

    if (isBottom) {
        if(currentPage == ${totalPageCount} || isLoading){
            return;
        }
        isLoading = true;
        currentPage++;
        GetList(currentPage);
    };
});
</script>
</head>
<body>
	<div class="main" style="width: 800px;">
		<div class="row">
			<div class="col-9">
				<div id="post"></div>
			</div>

			<div class="col-2">
				<a href="write.jsp">
					<button class="btn btn-primary fixed-button">게시물 작성</button>
				</a>
			</div>
		</div>
	</div>
	<c:if test="${!empty id}">
	</c:if>
</body>
</html>