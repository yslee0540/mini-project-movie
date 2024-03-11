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
				<c:choose>
					<c:when test="${empty id}">
						<button type="button" class="btn btn-primary fixed-button"
							data-bs-toggle="modal" data-bs-target="#exampleModal">
							게시물 작성</button>

						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel">로그인
											필요</h1>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">게시물 작성을 위해서는 로그인이 필요합니다.</div>
									<div class="modal-footer">
										<a href="/movie/member/login.jsp">
											<button class="btn btn-primary">로그인</button>
										</a> <a href="/movie/member/signup.jsp">
											<button class="btn btn-secondary">회원가입</button>
										</a>
									</div>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<a href="write.jsp">
							<button class="btn btn-primary fixed-button">게시물 작성</button>
						</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>