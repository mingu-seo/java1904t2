<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="manage.reserve.*"%>
<%@ page import="member.*"%>
<%@ page import="util.*"%>
<%@ page import="java.util.*"%>
<%
	MemberVO loginInfo = (MemberVO)session.getAttribute("memberInfo");
	MemberVO mdata = (MemberVO)request.getAttribute("data");
	//ReserveVO reservedata = (ReserveVO) request.getAttribute("reservedata");
	ArrayList<ReserveVO> rlist = (ArrayList) request.getAttribute("rlist");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>예약확인</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub6-3.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/js/custom.js"></script>
    <script>
    function goEdit(no) {
    	$.ajax({
    		url : "my-res-edit.do?no="+no,
    		async:false,
    		dataType:"HTML",
    		success:function(data) {
    			$(".reservation-cancel2-page").html(data);
    			$('.headline > img').click(function(e){
    		        e.preventDefault();
    		        $('.reservation-cancel2-page').stop().fadeOut(500);
    		    });
    			$('.re-cancel2-check-out').click(function(e){
    		        e.preventDefault();
    		        $('.reservation-cancel2-page').stop().fadeOut(500);
    		    });
    			$('.reservation-cancel2-page').stop().fadeIn(500);
    		}
    	});
    }
    function goCancel(no) {
    	$.ajax({
			url:"/my/reservationdelete?no="+no,
			async:false,
			success:function(data) {
				$('.reservation-cancel2-page').stop().fadeOut(500);
				$("#reserRow"+no).remove();
				$('.reservation-cancel-page').stop().fadeIn(500);
			}
		});
    }
    </script>
</head>
<body>
    <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
    <div id="container">
        <!-- con1 : 배너 사진 부분-->
        <div class="con1"></div>
        <!-- con2 : 메인 부분 -->
        <div class="con2">

            <!-- 예약취소 창 -->
            <div class="reservation-cancel2-page">
                
            </div>
            <!-- 예약취소 마지막 창 -->
            <div class="reservation-cancel-page">
               <div class="headline">
                    <p>예약취소</p>
                    <img src="/icon/footer-icon.png">
                </div>
                <div class="re-cancel-page-text">
                    <img src="/img/con2-4.png">
                    <h2>Reservation</h2>
                    <br>
                    <span><%=loginInfo.getName() %></span>님의 예약이 취소 되었습니다.</p>
                </div>
                <div class="cancel-checkbox-page">
                    <a class="re-cancel-check-in" href="#">확인</a>
                </div>
            </div>
            <!-- sub bar 부분 (고정) -->
            <div class="fixed-sub">
                <div class="title-area">
                    <h2>마이페이지</h2>
                    <p>my page</p>
                </div>
                 <ul class="sub-bar">
                    <li><a href="/my/my-infor.do">나의 정보</a></li>
                    <li><a href="/my/my-pet.do">나의반려동물</a></li>
                    <li class="on"><a href="/my/my-res.do">예약확인</a></li>
                    <li><a href="/my/my-ask.do">문의내역</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
             <div class="main">
                <h3>예약확인</h3>
                <p>Reveration</p>
                <div class="sub6-3-main">
                    <div class="sub6-3-head clear">
                        <img src="/icon/sub6-icon-person.jpg">
                        <h3><span><%=loginInfo.getName() %></span> 님의 예약 정보입니다.</h3>
                    </div>
                    <div class="sub6-3-boxgroup">
                    <%for(int i = 0; i < rlist.size(); i++) { %>
                        <div class="sub6-3-box" id="reserRow<%=rlist.get(i).getNo()%>">
                            <h2>예약내역</h2>
                            <p><span>담당의사</span><%=rlist.get(i).getDoctor_name() %> / <%=CodeUtil.getDoctorPositionName(rlist.get(i).getDoctor_position()) %></p>
                            <p><span>진료과목</span><%=CodeUtil.getDoctorDepartmentName(rlist.get(i).getDoctor_department()) %></p>
                            <p><span>참고사항</span><%= rlist.get(i).getRes_contents() %></p>
                            <p><span>예약시간</span><%=rlist.get(i).getRes_date() %> &nbsp; 
                            <%if(rlist.get(i).getRes_hour() < 7) { %>
                           		오전
                          	<% }else { %>
                          		오후
                          	<%} %>
                             &nbsp;<%=CodeUtil.getDoctorScheduleName(rlist.get(i).getRes_hour()) %>  &nbsp;예약</p>
                            <div class="sub6-3-btn clear">
                             <% if (DateUtil.getDiff(DateUtil.getToday(),rlist.get(i).getRes_date()) < 0) {%>
                                <div class="cancel-btn"><a href="#;" onclick="goEdit(<%=rlist.get(i).getNo()%>)">취소하기</a></div>
                                <% } %> 
                            </div>
                        </div>
                        <%} %>
                    </div>
                    <div class="sub6-3-more"><a href="/reservation/index">예약 하러 가기</a></div>
                </div>
            </div>
        </div>
    </div>
       <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>