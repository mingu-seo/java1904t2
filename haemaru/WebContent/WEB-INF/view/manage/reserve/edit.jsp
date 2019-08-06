<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="manage.reserve.*"%>
<%@ page import="util.*"%>
<%
	ReserveVO param = (ReserveVO) request.getAttribute("vo");
	ReserveVO data = (ReserveVO) request.getAttribute("data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp"%>
<script>
	var oEditors; // 에디터 객체 담을 곳
	jQuery(window).load(function() {
		oEditors = setEditor("info"); // 에디터 셋팅
		initCal({
			id : "res_date",
			type : "day",
			today : "y"
		});
	});

	function goSave() {
		if ($("#name").val() == "") {
			alert('이름을 입력하세요.');
			$("#name").focus();
			return false;
		}
		var sHTML = oEditors.getById["info"].getIR();
		if (sHTML == "" || sHTML == "<p><br></p>") {
			alert('내용을 입력하세요.');
			$("#info").focus();
			return false;
		} else {
			oEditors.getById["info"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
		}
		return true;
	}

	$(function() {
		getDoctorList();
		getSchedList();
		
		$("#doctor_department").change(function() {
			getDoctorList();
			getSchedList();
		});
		
		$("#res_date").change(function() {
			console.log(0);
			getDoctorList();
			getSchedList();
		});
	});
	
	


	function getDoctorList(){
		$.ajax({
			type :"GET",
			url : "/manage/reserve/doctorList?date="+$("#res_date").val()+"&department="+$("#doctor_department").val(),
			async : false,
			success : function(data) {
				$(".doctorListArea").html(data);
				$("#doctor_pk").change(function() {
					getSchedList();
				});
			}
		});
	}
	
	function getSchedList(){
		$.ajax({
			type :"GET",
			url : "/manage/reserve/schedList?date="+$("#res_date").val()+"&doctor_pk="+$("#doctor_pk").val(),
			async : false,
			success : function(data) {
				$(".schedListArea").html(data);
			}
		});
	}
</script>
</head>



<body>
	<%@ include file="/WEB-INF/view/manage/include/common.jsp"%>
	<div id="wrap">
		<!-- canvas -->
			<!-- S T A R T :: headerArea-->
			<%@ include file="/WEB-INF/view/manage/include/top.jsp"%>
			<!-- E N D :: headerArea-->

			<!-- S T A R T :: containerArea-->
			<div id="container">
				<div id="content">
					<div class="con_tit">
						<h2>예약등록 - [쓰기]</h2>
					</div>
					<!-- //con_tit -->
					<div class="con">
						<!-- 내용 : s -->
						<div id="bbs">
							<div id="bread">
								<form method="post" name="frm" id="frm"
									action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do"
									enctype="multipart/form-data" onsubmit="return goSave();">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										summary="관리자 관리 기본내용입니다.">
										<colgroup>
											<col width="15%" />
											<col width="35%" />
											<col width="15%" />
											<col width="35%" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><label for="">예약경로</label></th>
												<td><select name="route">
														<%=CodeUtil.getReserveRouteOption(data.getRoute())%>
												</select></td>
												<tr>
													<th scope="row"><label for="">이름</label></th>
													<td colspan="3"><input type="text" id="name"
														name="name" class="w50" title="이름을 입력해주세요" value="<%=data.getName()%>"/></td>
												</tr>
												<tr>
													<th scope="row"><label for="">연락처</label></th>
													<td colspan="3"><input type="text" id="tel" name="tel"
														class="w50" title="전화번호를 입력해주세요" value="<%=data.getTel()%>"/></td>
												</tr>

												<tr>
													<th scope="row"><label for="">예약날짜</label></th>
													<td><input type="text" id="res_date" name="res_date"
														class="inputTitle" value="<%=data.getRes_date()%>"
														title="예약일을 입력해주세요" />&nbsp; <span id="Calres_dateIcon">
															<img src="/manage/img/calendar_icon.png"
															id="Calres_dateIconImg" style="cursor: pointer;" />
													</span></td>
												</tr>
												<tr>
													<th scope="row"><label for="">진료과목</label></th>
													<td><select name="doctor_department" id="doctor_department">
															<%=CodeUtil.getDoctorDepartmentOption(data.getDoctor_department())%>
													</select></td>
												</tr>
												<tr>
												
													<th scope="row"><label for="">의료진</label></th>
													<td ><div class="doctorListArea" >
													<%=data.getDoctor_name()%>
													</div></td>
												</tr>

												<th scope="row"><label for="">예약시간</label></th>
												<td ><div class="schedListArea" >
												<%=data.getRes_hour()%>
												</div></td>

												<tr>

													<td colspan="4"><textarea id="info"
															name="res_contents" title="내용을 입력해주세요"
															style="width: 100%;"><%=data.getRes_contents()%></textarea></td>
												</tr>
										</tbody>
									</table>
									<input type="hidden" name="member_pk" id="member_pk"
										value="<%=param.getNo()%>" /> <input type="hidden"
										name="doctor_pk" id="doctor_pk" value="<%=param.getNo()%>" />
									<input type="hidden" name="cmd" value="edit" />
									<input type="hidden" name="no"
										value="<%=param.getNo()%>" /> 
								</form>
								<div class="btn">
									<div class="btnLeft">
										<a class="btns"
											href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
									</div>
								<div class="btnRight">
										<a class="btns" style="cursor: pointer;"
											onclick="$('#frm').submit();"><strong>저장</strong></a>
									</div>
								</div>
								<!--//btn-->


								<!-- //bread -->
							</div>
							<!-- //bbs -->
							<!-- 내용 : e -->
						</div>
						<!--//con -->
					</div>
					<!--//content -->
				</div>
				<!--//container -->
				<!-- E N D :: containerArea-->
			</div>
			<!--//canvas -->
		</div>
		<!--//wrap -->
</body>
</html>