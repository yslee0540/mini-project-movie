<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int tagNo = Integer.parseInt(request.getParameter("tag_no"));
	int currentPage = Integer.parseInt(request.getParameter("page"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<%@ include file="../../../nav.jsp"%>
<%@ include file="../../../header.jsp"%>
<script>
    $(function () {
        function generatePagination(currentPage) {
            var totalPages = ${totalPageCount};
            var startPage = Math.max(1, totalPages - 9);
            var endPage = Math.min(totalPages, 10);
            if (currentPage > 6) {
                endPage = Math.min(totalPages, currentPage + 5);
            }
            if (currentPage < totalPages - 4) {
                startPage = Math.max(1, currentPage - 5);
            }

            var pagination = $('#pagination');
            pagination.empty();

            $('#pre-page').off('click').click(function (event) {
                event.preventDefault();
                if (currentPage > 1) {
                    loadPage(currentPage - 1);
                    generatePagination(currentPage - 1);
                } else {
                	event.preventDefault();
                }
            });

            for (var i = startPage; i <= endPage; i++) {
                var link = $('<a>', {
                    href: '#',
                    class: 'page-link',
                    text: i
                });

                if (i === currentPage) {
                    link.addClass('active');
                }

                link.click(function (event) {
                    var nowPage = parseInt($(this).text())
                    loadPage(nowPage);
                    generatePagination(nowPage);
                });
				
                pagination.append(link);
            }

            $('#next-page').off('click').click(function (event) {
                if (currentPage < totalPages) {
                    loadPage(currentPage + 1);
                    generatePagination(currentPage + 1);
                } else {
                	event.preventDefault();
                }
            });
        }

        function loadPage(currentPage) {
        	$.ajax({
        	    url : 'ajax_page',
        		type : 'GET',
        		data : {
        			page : currentPage,
        			tag_no : <%=tagNo%>
        		},
        		success : function(data) {
        			$('#content').html(data);
        		},
        		error : function() {
        			alert('네트워크 오류 발생');
        		}
        	});
        }
        
        var currentPage = <%=currentPage%>
        loadPage(currentPage)
        generatePagination(currentPage);
    });
</script>
</head>
<body>
	<div class="main" style="width: 800px;">
		<div class="row">
			<div class="col-9">
				<div class="mb-2">
					<b>'${tagName}' 검색결과</b> ${postCount}개
				</div>
				<div id="content"></div>

				<ul class="pagination justify-content-center mt-4">
					<li class="page-item"><a class="page-link" href="#content"
						aria-label="Previous" id="pre-page"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li id="pagination" class="pagination"></li>
					<li class="page-item"><a class="page-link" href="#content"
						aria-label="Next" id="next-page"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</div>

			<div class="col-2">
				<a href="write.jsp">
					<button class="btn btn-primary fixed-button">게시물 작성</button>
				</a>
			</div>
		</div>
	</div>
</body>
</html>