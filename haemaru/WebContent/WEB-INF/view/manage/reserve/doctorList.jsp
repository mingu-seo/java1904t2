<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="manage.doctor.*"%>
<%@ page import="util.*"%>
<%@ page import="java.util.*"%>
<%
	ArrayList<DoctorVO> list = (ArrayList<DoctorVO>) request.getAttribute("list");
	int doctor_pk = Function.getIntParameter(request.getParameter("doctor_pk")); 
%>
<select name="doctor_pk" id="doctor_pk">
	<% for (int i=0; i<list.size(); i++) { %>
		<option value="<%=list.get(i).getNo()%>" <%=list.get(i).getNo()==doctor_pk ? "selected" : "" %>><%=list.get(i).getName()%></option>
	<% } %>
</select>