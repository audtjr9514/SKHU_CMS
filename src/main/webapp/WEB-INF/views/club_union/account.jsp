<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="R" value="../" />


<div id="fh5co-hero">
	<a href="#fh5co-main"
		class="smoothscroll fh5co-arrow to-animate hero-animate-4"><i
		class="ti-angle-down"></i></a>
	<%-- End fh5co-arrow --%>
	<div class="container">
		<div class="col-md-8 col-md-offset-2">
			<div class="fh5co-hero-wrap">
				<div class="fh5co-hero-intro">
					<h1 class="to-animate hero-animate-1">Slant. Free HTML5
						Template</h1>
					<h2 class="to-animate hero-animate-2">
						Lovely Made by <a href="http://freehtml5.co" target="_blank">FREEHTML5.co</a>
					</h2>
					<p class="to-animate hero-animate-3">
						<a href="#" class="btn btn-outline btn-lg">Get Started</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<%-- START fhtco-main --%>
<div id="fh5co-main">
	<%-- START container --%>
	<div class="container">

		<div class="row animate-box">
			<h2 class="fh5co-uppercase-heading-sm text-center">회계 관리</h2>

		</div>


		<div class="row animate-box">
			<div class="fh5co-spacer fh5co-spacer-md"></div>
			<div id="fh5co-tab-feature-center" class="fh5co-tab text-center">
				<ul class="resp-tabs-list hor_1">
					<c:forEach var="club" items="${ clubs }">
						<li><i class="fh5co-tab-menu-icon"></i> 
						<a href="account?club_id=${club.id}">${ club.club_name }</a></li>
					</c:forEach>
				</ul>
				<div class="resp-tabs-container hor_1">
					<div>
						<div class="row">
							<form action="#" method="post">
								<div class="col-md-8"></div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="search_term" class="sr-only">학기</label> <select
											class="form-control input-lg" id="l_search_term">
											<option>2019-1학기</option>
											<option>2019-2학기</option>
											<option selected>2020-1학기</option>
										</select>

										<%--<input type="submit" class="btn btn-primary btn-lg " value="검색">--%>
										<a class="btn btn-primary btn-lg" id="l_search_term_btn">검색</a>
									</div>
								</div>
							</form>
						</div>
						<div class="row">
							<div class="panel panel-default">
								<table class="table text-center l_account_table">
									<thead>
										<tr>
											<th>날짜</th>
											<th>지원금 사용내역</th>
											<th>동아리회비 사용내역</th>
											<th>비고</th>
											<th>잔액</th>
											<th>영수증 첨부</th>
											<th></th>
										</tr>
									</thead>
									<c:forEach var="account" items="${ accounts }">
										<tr>
											<td>${ account.date }</td>
											<c:choose>
												<c:when test="${ account.account_type == 0}">
													<td>${ account.price }</td>
													<td>-</td>
												</c:when>
												<c:otherwise>
													<td>-</td>
													<td>${ account.price }</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${empty account.remark}">
													<td></td>
												</c:when>
												<c:otherwise>
													<td>${ account.remark }</td>
												</c:otherwise>
											</c:choose>
											<td>${ account.total }</td>
											<td><a href="#" class="btn btn-primary">영수증</a></td>
											<td><a href="#">x</a></td>
										</tr>
									</c:forEach>
									<tbody>
										<tr>
											<td><input type="date" class="form-control input-lg"></td>
											<td><input type="number" class="form-control input-lg"></td>
											<td><input type="number" class="form-control input-lg"></td>
											<td><input type="text" class="form-control input-lg"></td>
											<td></td>
											<td><a href="#" class="btn btn-primary">영수증</a></td>
											<td><a href="#">x</a></td>
										</tr>
									</tbody>
									<tbody id="addTd"></tbody>
									<tbody>
										<tr>
											<td colspan="6"><button onclick="attachAddr(this)"
													class="btn btn-primary col-md" id="pls-btn">+</button></td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="row">
								<div class="col-md-8"></div>
								<div class="col-md-4">
									<button class="btn btn-primary col-md-offset-7 btn-lg"
										id="l_account_save">회계 저장</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="fh5co-spacer fh5co-spacer-md"></div>

		<div class="row"></div>
		<%-- // END row --%>
		<div class="fh5co-spacer fh5co-spacer-md"></div>

	</div>
	<%-- // END container --%>


</div>