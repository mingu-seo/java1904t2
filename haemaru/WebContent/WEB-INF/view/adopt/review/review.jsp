<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="board.review.*" %>
<%@ page import="member.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
MemberVO mdata = (MemberVO)request.getAttribute("data");
ReviewVO param = (ReviewVO)request.getAttribute("vo");
ArrayList<ReviewVO> list = (ArrayList)request.getAttribute("list");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>입양후기</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub4-2.css">
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
                    <h2>입양</h2>
                    <p>adopt an animal</p>
                </div>
                <ul class="sub-bar">
                    <li ><a href="/adopt/animalprofile/animalprofile.do">프로필</a></li>
                    <li class="on"><a href="/adopt/review/review.do">입양후기</a></li>
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
                <h3>입양후기</h3>
                <p>review</p>
                <%
					for(int i=0; i<list.size(); i++){
					%>
                <div class="review-box-group">
				   <div class="review-box-area clear">
                        <div class="review-img" style='background-image:URL("<%=SiteProperty.REVIEW_UPLOAD_PATH%><%=list.get(i).getFilename()%>");'>
                        </div>
                        <div class="review-info">
                            <!-- 리뷰 텍스트 부분 -->
                            <div class="review-text">
                                <h2><%=list.get(i).getTitle() %></h2>
                                <p><%=list.get(i).getContents() %>
                                </p>
                            </div>
                            <!-- 리뷰 작성자 부분 -->
                            <div class="review-writer clear">
                             <!-- <div class="writer-1"></div>  -->   
                                <div class="writer-2">
                                    <h6><%=list.get(i).getMember_name()%> 님</h6>
                                    <p><%=DateUtil.getDateFormat(list.get(i).getRegistdate())%></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%	
					}
                %>
                <!-- 하단 페이징 -->
                <%=Page.userIndexList(param.getReqPageNo(), totPage, request)%>
                <!-- 리뷰 작성 박스 버튼 -->
                <div class="review-box">
                    <div class="review-more"><a href="/adopt/review/addreview.do">후기 등록하기</a></div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>