<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.dropdown-item:active {
	background: #14870c;
}
</style>
<header class="p-3 mb-5 border-bottom">
	<div class="container">
		<div
			class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
			<a href="/movie" class="mb-2 text-decoration-none"> <span
				style="margin-right: 15px;"><b>MOVIE</b></span>
			</a>

			<ul
				class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center">
				<li><a href="/movie/board/list"
					class="nav-link px-2 link-body-emphasis">커뮤니티</a></li>
				<li><a href="#" class="nav-link px-2 link-body-emphasis">작품</a></li>
			</ul>

			<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
				<input type="search" class="form-control" placeholder="검색">
			</form>
			<%
				if (session.getAttribute("id") == null) {
			%>
			<div class="text-end">
				<a href="/movie/member/login.jsp" style="text-decoration: none;">
					<button type="button" class="btn btn-outline-primary me-2">로그인</button>
				</a> <a href="/movie/member/signup.jsp" style="text-decoration: none;">
					<button type="button" class="btn btn-primary">Sign-up</button>
				</a>
			</div>
			<%
				} else {
			%>
			<div class="dropdown text-end">
				<a href="#"
					class="d-block link-body-emphasis text-decoration-none dropdown-toggle"
					data-bs-toggle="dropdown" aria-expanded="false"> <img
					src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png" alt="프로필" width="32" height="32"
					class="rounded-circle">
				</a>
				<ul class="dropdown-menu text-small">
					<li><a class="dropdown-item" href="${id}">마이페이지</a></li>
					<li>
						<hr class="dropdown-divider">
					</li>
					<li><a class="dropdown-item" href="/movie/member/logout">로그아웃</a></li>
				</ul>
			</div>
			<%
				}
			%>
		</div>
	</div>
</header>
