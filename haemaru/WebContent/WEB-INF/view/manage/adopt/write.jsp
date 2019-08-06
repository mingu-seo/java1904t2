<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="manage.adopt.*" %>
<%@ page import="java.util.*" %>
<%
AdoptVO param = (AdoptVO)request.getAttribute("vo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
var oEditors; // 에디터 객체 담을 곳
$(window).load(function() {
	oEditors = setEditor("charr"); // 에디터 셋팅
});

function goSave() {
	if ($("#name").val() == "") {
		alert("동물이름을 입력해주세요.");
		$("#name").focus();
		return false;
	}
	
	oEditors.getById["charr"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	$("#frm").submit();
}


</script>
</head>
<body> 
<%@ include file="/WEB-INF/view/manage/include/common.jsp" %>
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/manage/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>동물관리 - [쓰기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>동물 기본 정보</h3>
							<form name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" enctype="multipart/form-data" method="post" >
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="동물 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">카테고리</label></th>
										<td>
											<select name="animal_category">
												<option value="1">강아지</option>
												<option value="2">고양이</option>
												<option value="3">기타동물</option>
											</select>
										</td>
										<th scope="row"><label for="">*이름</label></th>
										<td>
											<input type="text" id="name" name="name" value="" title="동물 이름을 입력해주세요." />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">성별</label></th>
										<td>
											<select name="gender">
												<option value="1" name="남">남</option>
												<option value="2" name="여">여</option>
											</select>
										</td>
										<th scope="row"><label for="">나이</label></th>
										<td>
											<input type="text" id="" name="age" value="" title="동물 나이를 입력해주세요." />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">이미지</label></th>
										<td>
											<input type="file" id="imagename_tmp" name="imagename_tmp" class="w50" title="첨부파일을 업로드 해주세요." />	
										</td>
										<th scope="row"><label for="">품종</label></th>
										<td>
											<input type="text" id="breed" name="breed" value="" title="동물 품종을 입력해주세요." />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">접종현황</label></th>
										<td>
											<input type="text" id="vac" name="vac" value="" title="동물 이름을 입력해주세요." />
										</td>
										<th scope="row"><label for="">상태</label></th>
										<td>
											<select name="state">
												<option value="1">입양중</option>
												<option value="2">입양완료</option>
												<option value="3">비공개</option>
											</select>
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<textarea id="charr" name="charr" title="성격을 입력해주세요" style="width:100%" ></textarea>
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="write"/>
							<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
							<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="#" onclick="goSave();"><strong>저장</strong></a>
								</div>
							</div>
							<!--//btn-->
						</div>
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