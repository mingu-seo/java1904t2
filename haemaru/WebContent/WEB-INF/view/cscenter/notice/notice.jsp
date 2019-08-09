<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.notice.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
NoticeVO param = (NoticeVO)request.getAttribute("vo");
ArrayList<NoticeVO> list = (ArrayList)request.getAttribute("list");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>공지사항</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub5-1.css">
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
                    <li class="on"><a href="/cscenter/notice/notice.do">공지사항</a></li>
                    <li><a href="/cscenter/faq/faq.do">FAQ</a></li>
                    <li><a href="/cscenter/qna/qna.do">문의하기</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>공지사항</h3>
                <p>Notice</p>
                <div class="notice-area">
                    <form class="search-btn"  name="searchForm" id="searchForm" action="notice.do" method="post">
                        <select>
                            <option value="0">전체</option>
                            <option value="1">소식</option>
                            <option value="2">칼럼</option>
                            <option value="3">보도자료</option>
                            <option value="4">증례소개</option>
                        </select>
                        <input type="text" id="search_input" name="sval" value="<%=param.getSval()%>" placeholder="검색어를 입력하세요.">
                        <input type="submit" value="검색"  id="btn_submit_search">
                    </form>
                    <div class="notice-table">
                        <table>
                            <tr>
                                <th>No.</th>
                                <th>Category</th>
                                <th>Title</th>
                                <th>Data</th>
                                <th>View</th>
                            </tr>
                        <% if (totCount == 0) { %>
                        	<tr>
								<td class="first" colspan="7">등록된 공지가 없습니다.</td>
							</tr>
							<%
                        	} else {
							String targetUrl = "";
							String topClass = "";
							NoticeVO data;
							for (int i=0; i<list.size(); i++) {
								data = list.get(i);
								targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+param.getTargetURLParam("read", param, data.getNo())+"'\"";
							%>
                            <tr>
                                <td><%=data.getNo()%></td>
                                <td><%=CodeUtil.getNoticeCategory(data.getType())%></td>
                                <td><a href="viewnotice?no=<%=data.getNo()%>"><%=data.getTitle()%></a></td>
                                <td><%=DateUtil.getDateFormat(data.getCre_date())%></td>
                                <td><%=data.getReadno()%></td>
                            </tr>
                            <%
								}
							}
                            %>
                        </table>
                        <!-- 페이징 처리 -->
                       <%=Page.userIndexList(param.getReqPageNo(), totPage, request)%>
                    </div>
                </div>
            </div>
        </div>
    </div>
  <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>