<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.*" %>
<%
	MemberVO mdata = (MemberVO)request.getAttribute("data");
%>
	{
		"no":"<%=mdata.getNo() %>",
		"email1":"<%=mdata.getEmail1() %>",
		"email2":"<%=mdata.getEmail2() %>",
		"pw":"<%=mdata.getPw() %>",
		"name":"<%=mdata.getName() %>",
		"birth":"<%=mdata.getBirth() %>",
		"tel1":"<%=mdata.getTel1() %>",
		"tel2":"<%=mdata.getTel2() %>",
		"tel3":"<%=mdata.getTel3() %>"
	}
