<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="board.review.*" %>
<%@ page import="member.*" %>
<%@ page import="util.*" %>
<%
ReviewVO data = (ReviewVO)request.getAttribute("data");
ArrayList<ReviewVO> list = (ArrayList)request.getAttribute("list");
MemberVO loginInfo = (MemberVO)session.getAttribute("memberInfo");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>입양후기등록</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub4-3.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/js/custom.js"></script>
<script type="text/javascript">

function getThumbnailPrivew(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('display', '');
            $target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
            //$target.html('<img src="' + e.target.result + '" alt="" />');
        }
        reader.readAsDataURL(html.files[0]);
    }
}


function goSave() {
	if ($("#title").val() == "") {
		alert("제목을 입력해주세요.");
		$("#title").focus();
		return false;
	}
	
	if ($("#contents").val() == "") {
		alert("내용을 입력해주세요.");
		$("#contents").focus();
		return false;
	}
	$("#frm").submit();
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
            <!-- 입양후기확인창 부분 -->
            <div class="abopt-page">
                <div class="headline">
                    <p>입양후기등록</p>
                    <img src="/icon/footer-icon.png">
                </div>
                <div class="abopt-page-text">
                    <img src="img/con2-4.png">
                    <h2><a href="/review.do"><img src="/icon/logo_lightgreen.png"></a></h2>
                    <p>고객님의 후기가 등록되었습니다.</p>
                </div>
                <div class="abopt-checkbox-page">
                    <a class="abopt-check-in" href="#">확인</a>
                </div>
            </div>
            <!-- sub bar 부분 (고정) -->
            <div class="fixed-sub">
                <div class="title-area">
                    <h2>입양</h2>
                    <p>adopt an animal</p>
                </div>
                <ul class="sub-bar">
                    <li class="on"><a href="/adopt/animalprofile">프로필</a></li>
                    <li><a href="/adopt/review/review">입양후기</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <div class="top-arrow">
                    <a href="#">
                        <img src="/icon/top-arrow.png">
                        <p>위로가기</p>
                    </a>
                </div>
                <h3>입양후기 등록</h3>
                <p>내 반려동물의 입양 후기를 등록해주세요.</p>
                <div class="sub4-3-box-group">
                    <!-- 이메일 부분 -->
					<form name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" enctype="multipart/form-data" method="post">
				    <div class="sub4-3-email clear">
                        <p>제목</p><input type="text" id="title_input" name="title" placeholder="제목을 등록해주세요.">
                        	<div class="sub4-3-emailbox"></div>
                    </div>
                    <div class="sub4-3-box clear">
                        <!-- 반려동물 사진 추가 부분 -->
                        <div class="sub4-3-list">
                            <div class="sub4-petplus-img" id="thumb_img">	
                                <!-- <img src="/img/sub6-2-petimg.jpg" > -->
                            </div>
                            <div class="sub4-file">
                            	<input type="file" name="filename_tmp" id="filename_tmp" name="filename_tmp" onchange="getThumbnailPrivew(this,$('#thumb_img'))"/>
                            </div>
                        </div>
                        <!-- 후기 적는 텍스트 박스 부분 -->
                        <div class="sub4-3-list">
                             <textarea id="sub4-3-textarea" name="contents" placeholder="후기 내용을 적어주세요."></textarea>
                        </div>
                    </div>
                  <input type="hidden" name="cmd" value="write"/>
                  <input type="hidden" name="member_pk" value="<%=memberInfo.getNo()%>" />
                  </form>
                    <!-- 등록하기 버튼 부분 -->
                    <div class="review-last-box">
                        <a href="javascript:goSave();"><input type="hidden" value="후기 등록">후기 등록하기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
   <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>