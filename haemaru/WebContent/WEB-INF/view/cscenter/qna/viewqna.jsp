<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.qna.*" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
QnaVO param = (QnaVO)request.getAttribute("vo");
QnaVO data = (QnaVO)request.getAttribute("data");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript">
	function goDelete() {
		var del = confirm ('삭제하시겠습니까?');
		if (del){
			document.location.href="process.do?no=<%=data.getNo()%>&cmd=delete";
		} else {
			return false;
		}
	}
	
	
</script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>문의하기</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub5-5.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/js/custom.js"></script>
</head>
<body>
 <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
    <div id="container">
        <!-- con1 : 배너 사진 부분-->
        <div class="con1"></div>
        <!-- con2 : 메인 부분 -->
        <div class="con2">
            <!-- sub bar 부분 (고정) -->
            <div class="fixed-sub">
                <div class="title-area">
                    <h2>고객센터</h2>
                    <p>Customer Center</p>
                </div>
                <ul class="sub-bar">
                    <li ><a href="/cscenter/notice/notice.do">공지사항</a></li>
                    <li><a href="/cscenter/faq/faq.do">FAQ</a></li>
                    <li class="on"><a href="/cscenter/qna/qna.do">문의하기</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>문의하기</h3>
                <p>Ask for infomation</p>
                <!-- 문의글 내용 부분 -->
                <div class="sub5-5-area">
                    <div class="sub5-5-info clear">
                        <h5><span>제목</span><%=data.getTitle()%></h5>
                        <div class="sub5-5-writer clear">
                            <div class="sub5-5-img"></div>
                            <div class="sub5-5-day">
                                <p><%=data.getMember_name()%></p>
                                <p><%=DateUtil.getDateFormat(data.getRegistdate())%></p>
                            </div>
                        </div>
                    </div>
                    <div class="sub5-5-box">
                        <p><%=data.getContents() %></p>
                    </div>
                    <ul class="sub5-5-btn clear">
                        <li><a href="<%=param.getTargetURLParam("qna", param, 0)%>">목록으로</a></li>
                        <li><a href="#" onClick="goDelete();">삭제하기</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
  <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>