<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url var="R" value="/" />


<div id="fh5co-hero">
	<a href="#fh5co-main"
		class="smoothscroll fh5co-arrow to-animate hero-animate-4"><i
		class="ti-angle-down"></i></a>
	<!-- End fh5co-arrow -->
	<div class="container">
		<div class="col-md-8 col-md-offset-2">
			<div class="fh5co-hero-wrap">
				<div class="fh5co-hero-intro">
					<h1 class="to-animate hero-animate-1">동아리 연합회</h1>
					<h2 class="to-animate hero-animate-2">동아리 연합회의 모든 내용을 볼 수
						있습니다.</h2>

				</div>
			</div>
		</div>
	</div>
</div>

<!-- START fhtco-main -->
<div id="fh5co-main">
	<!-- START container -->
	<div class="container">

		<div class="row animate-box">
			<div id="fh5co-tab-feature-center"
				class="fh5co-tab text-center col-md-9 col-md-push-3">
				<h2 class="fh5co-uppercase-heading-sm text-center" id="heading">회계
					관리</h2>

				<ul class="resp-tabs-list hor_1">
					<c:forEach var="club" items="${ clubs }">
						<li><i class="fh5co-tab-menu-icon"></i>${ club.club_name }</li>
					</c:forEach>
				</ul>

				<c:forEach var="club" items="${ clubs }" varStatus="ci">
					<div class="resp-tabs-container hor_1">
						<div>
							<div class="row">
								<form action="#" method="post">
									<div class="col-md-9"></div>
									<div class="col-md-3">
										<div class="form-group">
											<label for="search_term" class="sr-only">학기</label>
											<form:form method="get" modelAttribute="semdate">
												<form:select path="sem_name"
													class="form-control input-lg autosubmit" id="l_search_term">
													<form:options value="${ sem_name }" itemValue="sem_name"
														itemLabel="sem_name" items="${ sems }" />
												</form:select>
											</form:form>

										</div>
									</div>

									<div class="col-md-6"
										style="float: right; margin-top: -10px; margin-bottom: 20px;">
										<select class="form-control input-sm" name="exceldownload"
											onchange="if(this.value) location.href=(this.value);">
											<option value="">엑셀 다운로드</option>
											<option
												value="${R}club_union/account/excel/downloadByClub?club_id=${club.id}&sem_name=${semdate.sem_name}">
												${club.club_name} ${semdate.sem_name} 엑셀 다운로드</option>
											<option
												value="${R}club_union/account/excel/downloadAll?sem_name=${semdate.sem_name}">
												전체동아리 ${semdate.sem_name} 엑셀 다운로드</option>

										</select>
									</div>
								</form>
							</div>
							<div class="row">
								<div class="panel panel-default">
									<form action="account_save" method="post"
										enctype="multipart/form-data"
										onsubmit="return check(${ci.count});" name="account_submit"
										id="account_submit">
										<table
											class="table text-center l_account_table table_${ci.count}">
											<thead>
												<tr>
													<th>날짜</th>
													<th>지원금 사용금액</th>
													<th>동아리회비 사용금액</th>
													<th>사용내용 및 비고</th>
													<!-- <th>잔액</th> -->
													<th>영수증 첨부</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="account" items="${ accounts }">
													<c:if test="${club.id eq account.club_id }">
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
															<td><a class="btn btn-primary" id="showReceipt"
																data-target="#createModal"
																onclick="return showReceipt('${account.id}');">영수증</a> <%-- <img src ="${R}club_union/getImage?id=${account.id}" width="100" height="100"></img> --%>
															</td>
															<td><c:if test="${club.id eq myClub.id}">
																	<a onclick="return post_del('${R}club_union/delete?id=${account.id}&club_id=${club.id}');">x</a>
																</c:if></td>
														</tr>
													</c:if>
												</c:forEach>
												<c:forEach var="total" items="${ totals }">
													<c:if test="${ club.id eq total.club_id }">
														<tr class="total-row">
															<td colspan=4>잔액 :</td>
															<td colspan=2>${ total.total }</td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
											<c:if test="${club.id eq myClub.id}">
												<tbody>
													<tr id="default">
														<input type="hidden" name="club_id" value="${club.id}">
														<td><input type="date" name="date"
															class="form-control input-lg" max="${end_date}"
															min="${start_date}"></td>
														<td><select class="form-control input-lg"
															name="account_type">
																<c:forEach var="at" items="${ account_type }"
																	varStatus="i">
																	<option value="${i.index}">${ at }</option>
																</c:forEach>
														</select></td>
														<td><input type="number" name="price"
															class="form-control input-lg" placeholder="사용금액"></td>
														<td><input type="text" name="remark"
															class="form-control input-lg" placeholder="사용내용 및 비고"></td>
														<!-- <td></td> -->
														<td><label for="uploadImage" class="btn btn-primary">파일선택</label>
															<input type="file" name="file" class="btn btn-primary"
															id="uploadImage" onchange="fileChange(this);"
															style="display: none"> <label for="uploadImage"
															class="fileName" style="display: none"></label></td>
														<td><a onclick="return delete_row(this);"></a></td>
													</tr>

													<tr>
														<td colspan="6"><button
																onclick="return attachAddr(this);"
																class="btn btn-primary col-md" id="pls-btn">+</button></td>
													</tr>
												</tbody>
											</c:if>

										</table>
								</div>
								<c:if test="${club.id eq myClub.id}">
								<div class="row">
									<div class="col-md-8"></div>
									<div class="col-md-4">
										<input type="submit"
											class="btn btn-primary col-md-offset-7 btn-lg"
											id="l_account_save" name="l_account_save" value="회계 저장">
									</div>
								</div>
								</c:if>
								</form>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- sidebar -->
			<div class="col-md-3 col-md-pull-9" id="fh5co-sidebar">
				<c:import url="../tiles/tiles_union_sidebar.jsp" />
			</div>
			<!-- sidebar 끝 -->

		</div>

		<div class="fh5co-spacer fh5co-spacer-md"></div>

		<div class="row"></div>
		<!-- // END row -->
		<div class="fh5co-spacer fh5co-spacer-md"></div>
	</div>
	<!-- // END container -->

</div>


<!-- showReceipt modal -->
<div class="modal fade" id="createModal" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-md">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 id="modal-title" class="modal-title">영수증</h4>
			</div>
			<div class="modal-body" style="overflow: scroll">
				<img src="${R}club_union/getImage?id=${account.id}" id="receiptImg" />
			</div>
			<div class="modal-footer">
				<button id="closeModal" type="button" class="btn btn-primary col-md"
					data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>