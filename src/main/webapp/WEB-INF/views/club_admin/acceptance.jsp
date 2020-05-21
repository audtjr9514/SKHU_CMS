<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:url var="R" value="/" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.min.js"></script>
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
<div id="fh5co-hero">
	<a href="#fh5co-main"
		class="smoothscroll fh5co-arrow to-animate hero-animate-4"><i
		class="ti-angle-down"></i></a>
	<!-- End fh5co-arrow -->
	<div class="container">
		<div class="col-md-8 col-md-offset-2">
			<div class="fh5co-hero-wrap">
				<div class="fh5co-hero-intro">
					<h1 class="to-animate hero-animate-1">${club.club_name}</h1>
					<h2 class="to-animate hero-animate-2">${club.content}</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="fh5co-main">
	<div class="container">
		<div class="row">
			<div class="content-box animate-box">
				<div class="col-md-9 col-md-push-3" id="fh5co-content">
					<div class="row">
						<div style="margin-bottom: 20px">
							<h3>회원 관리</h3>
						</div>
						<div class="col-md-5">
							<table class="table table-striped" style="width:100%">

								<tr class="text-center">
									<th style="text-align: center">지원자</th>
								</tr>
								<c:forEach var="user" items="${acceptanceNo}" varStatus="i">
									<tr>
										<td>
											<form method="post">
												<label><input type="checkbox"
													style="margin-right: 10px; width: 18px; height: 18px;">${user.name}</label>
												<i class="btn btn-primary el-icon-document"
													style="padding: 3px 10px;" data-target="#formModal"
													onclick="return showForm('${club.id}','${user.id}');"></i>
												<div class="modal fade" id="formModal${user.id}"
													role="dialog" tabindex="-1" style="z-index: 9999;">
													<div class="modal-dialog modal-md">
													
														<!-- Modal content-->
														<div class="modal-content">
															<div class="modal-header">
																<button class="close" type="button" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">x</span>
																</button>
																<h4 id="modal-title" class="modal-title">동아리 지원서
																	${user.id}</h4>
															</div>
															<div class="modal-body" style="overflow: scroll">
																<table class="table table-striped" style="max-width: 100%; display: table;" >
																	<tr>
																		<td
																			style="margin-right: 10px; width: 18px; height: 18px; font-weight: bold">질문
																			:</td>
																		<c:forEach var="apply_q" items="${questionList}">
																			<td
																				style="margin-right: 10px; width: 18px; height: 18px;"
																				id="receiptForm">Q.${apply_q.content}</td>
																		</c:forEach>
																	</tr>
																	<tr>
																		<td
																			style="margin-right: 10px; width: 18px; height: 18px; font-weight: bold">답변
																			:</td>
																		<c:forEach var="apply_a" items="${answerList1}">
																			<c:if test="${user.id eq apply_a.user_id }">
																				<td
																					style="margin-right: 10px; width: 18px; height: 18px;"
																					id="answer1">A.${apply_a.content}</td>
																			</c:if>
																		</c:forEach>
																	</tr>
																</table>
															</div>
															<div class="modal-footer">
																<button id="closeModal" type="button"
																	class="btn btn-primary col-md" data-dismiss="modal">확인</button>
															</div>
														</div>
														<!-- Modal종료 -->
													</div>
												</div>
												<input type="hidden" name="user_id" value="${user.id}" /> <input
													type="hidden" name="club_id" value="${club.id}" />
												<button class="btn btn-primary"
													style="float: right; background-color: green; padding: 3px 10px; font-size: 15px;"
													type="submit" name="cmd" value="yes">합격</button>
											</form>
										</td>
									</tr>
								</c:forEach>
								<tr>
									<td>
										<button class="btn btn-primary" style="background-color: green; padding: 5px; width: 100%; margin-bottom:1%">선택한 지원자 목록 합격</button>
									</td>
								</tr>
							</table>
						</div>
						<div class="col-md-2">
							<form method="post">
								<%-- <input type="hidden" name="user_id" value="${userClub.user_id}" />
								<input type="hidden" name="club_id" value="${userClub.club_id}" />
								<button class="btn btn-lg btn-primary" type="submit" name="cmd"
									value="yes">&gt;</button>
								<button class="btn btn-lg btn-primary" type="submit" name="cmd"
									value="no">&lt;</button> --%>
							</form>
						</div>

						<div class="col-md-5">
							<table class="table table-striped" style="width:100%">

								<tr class="text-center">
									<th style="text-align: center">
									<div class="allCheck">
									<input type="checkbox" name="allCheck" id="allCheck" />
									전체회원
										<script>
											$("#allCheck").click(function(){
												var chk = $("#allCheck").prop("checked");
												if(chk) {
 													$(".chBox").prop("checked", true);
 												} else {
 													$(".chBox").prop("checked", false);
 												}
											});
										</script>
									</div>
									</th>
									
								</tr>
								<c:forEach var="user" items="${acceptanceYes}">
									<tr>
										<td>
											<form method="post">
												<div class="checkBox">
												<label>
												<input type="checkbox" style="margin-right: 10px; width: 18px; height: 18px;"
												name="chBox" class="chBox" data-cartNum="${user.id}"/>${user.name}</label>
													<script>
														$(".chBox").click(function(){
																$("#allCheck").prop("checked",false)
														});
													</script>
													<input type="hidden" name="user_id" value="${user.id}" /> 
													<input type="hidden" name="club_id" value="${club.id}" />													
												<button class="btn btn-primary"
													style="float: right; background-color: red; padding: 3px 10px; font-size: 15px;"
													type="submit" name="cmd" value="no">탈퇴</button>
												</div>
											</form>
										</td>
									</tr>
								</c:forEach>
								<tr>
									<td>
									<div class="delBtn">
										<button type="button" class="selectDelete_btn"
										style="background-color: red;padding: 5px; width: 100%; margin-bottom:1%">선택한 회원 목록 탈퇴</button>
										<script>
 											$(".selectDelete_btn").click(function(){
  											var confirm_val = confirm("정말 삭제하시겠습니까?");
  
  											if(confirm_val) {
 											 	var checkArr = new Array();
   
   												$("input[class='chBox']:checked").each(function(){
    												checkArr.push($(this).attr("data-cartNum"));
   												});
    
												$.ajax({
    												url : "${R}club_admin/deleteAll",
    												type : "post",
    												data : { chbox : checkArr },
    												success : function(){

													    	 location.href = "${R}club_admin/acceptance?club_id=" + 2;
        													
   														}
   													});
  												} 
 											});
										</script>
									</div>
									</td>
								</tr>
							</table>
						</div>

					</div>
				</div>
			</div>
			<div class="col-md-3 col-md-pull-9" id="fh5co-sidebar">
				<ul class="attendance_check-list hor_1">
					<li><a href="${R}club_admin/notice?club_id=${club_id}">공지사항</a></li>
					<li><a href="${R}club_admin/account?club_id=${club_id}">회계
							관리</a></li>
					<li><a href="${R}club_admin/minutes?club_id=${club_id}">회의록</a></li>
					<li><a href="${R}club_admin/publicity?club_id=${club_id}">홍보게시판</a></li>
					<li><a href="${R}club_admin/recruit?club_id=${club_id}">모집게시판</a></li>
					<li><a href="${R}club_admin/attendance?club_id=${club_id}">출석체크</a></li>
					<li><a href="${R}club_admin/acceptance?club_id=${club_id}">회원
							관리</a></li>
					<sec:authorize access="hasRole('ROLE_ClubAdmin')">
							<li><a href="${R}club_admin/apply_q_list">모집 질문 작성</a></li>
						</sec:authorize>
				</ul>
			</div>
		</div>
	</div>
</div>

<script>
	function showForm(club_id, user_id) {
		/* var url = "${R}club_admin/acceptance?club_id=" + club_id + "&user_id=" + user_id; */
		/*var answer = "${url.answerList}"
		$('#answer').val(answer); */
		/* ${'#modal-title'}.html(user_id);*/
		$('#formModal' + user_id).modal('show');
	};
</script>