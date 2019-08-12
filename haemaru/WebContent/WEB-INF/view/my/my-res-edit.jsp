<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="manage.reserve.*"%>
<%@ page import="member.*"%>
<%@ page import="util.*"%>
<%@ page import="java.util.*"%>
<%
	ReserveVO data = (ReserveVO) request.getAttribute("data");
%>
<div class="headline">
	<p>예약취소</p>
	<img src="/icon/footer-icon.png">
</div>
<div class="re-cancel2-page-text">
	<img src="/img/con2-4.png">
	<h2>Reservation</h2>
	<p>
		<%=data.getRes_date()%>
		<%
			if (data.getRes_hour() < 7) {
		%>
		오전
		<%
			} else {
		%>
		오후
		<%
			}
		%>
		<%=CodeUtil.getDoctorScheduleName(data.getRes_hour())%><br />
		<span><%=data.getName()%></span>님의 예약을 취소하시겠습니까?
	</p>
</div>
<div class="cancel2-checkbox-page clear">
	<a class="re-cancel2-check-in" id="reservationDeleteBtn" href="#;"
		onclick="goCancel(<%=data.getNo()%>)">예</a> <a
		class="re-cancel2-check-out" href="#">아니요</a>
</div>
