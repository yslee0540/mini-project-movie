<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물</title>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
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
	<%@ include file="../../../nav.jsp"%>
	<%@ include file="../../../header.jsp"%>
	<div id="post"></div>
</body>
</html>